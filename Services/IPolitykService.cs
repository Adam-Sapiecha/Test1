using Microsoft.Data.SqlClient;

public interface IPolitykService
{
    IEnumerable<PolitykDetailsDto> GetPolitycy();
}





public class PolitykService : IPolitykService
{
    private readonly string _connectionString;
    public PolitykService(IConfiguration configuration)
    {
        _connectionString = configuration.GetConnectionString("DefaultConnection");
    }






    public IEnumerable<PolitykDetailsDto> GetPolitycy()
    {
        var politycy = new List<PolitykDetailsDto>();



        using (var connection = new SqlConnection(_connectionString))
        using (var command = connection.CreateCommand())
        {
            connection.Open();
            command.CommandText = @"
                SELECT p.ID, p.Imie, p.Nazwisko, p.DataUrodzenia,
                       pt.Nazwa, pr.Od, pr.Do
                FROM Polityk p
                LEFT JOIN Przynaleznosc pr ON p.ID = pr.Polityk_ID
                LEFT JOIN Partia pt ON pr.Partia_ID = pt.ID
                ORDER BY p.ID;
            ";
            using (var reader = command.ExecuteReader())
            {
                while (reader.Read())
                {
                    int id = reader.GetInt32(0);
                    var polityk = politycy.FirstOrDefault(x => x.Id == id);
                    if (polityk == null)
                    {
                        polityk = new PolitykDetailsDto
                        {
                            Id = id,
                            Imie = reader.GetString(1),
                            Nazwisko = reader.GetString(2),
                            HistoriaPrzynaleznosci = new List<PartiaHistoriaDto>()
                        };

                        if (!reader.IsDBNull(3))
                        {
                            DateTime dataUrodzenia = reader.GetDateTime(3);
                            int wiek = DateTime.Now.Year - dataUrodzenia.Year;
                            if (dataUrodzenia > DateTime.Now.AddYears(-wiek))
                                wiek--;
                            polityk.Wiek = wiek;
                        }
                        politycy.Add(polityk);
                    }
                    if (!reader.IsDBNull(4))
                    {
                        polityk.HistoriaPrzynaleznosci.Add(new PartiaHistoriaDto
                        {
                            NazwaPartii = reader.GetString(4),
                            Od = reader.GetDateTime(5),
                            Do = reader.IsDBNull(6) ? (DateTime?)null : reader.GetDateTime(6)
                        });
                    }
                }}
        }
        foreach (var p in politycy)
        {
            var aktywna = p.HistoriaPrzynaleznosci.FirstOrDefault(x => x.Do == null);
            p.AktualnaPartia = aktywna?.NazwaPartii;
        }

        return politycy;}}
