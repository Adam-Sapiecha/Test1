public class PolitykDetailsDto {
    public int Id { get; set; }
    public string Imie { get; set; }
    public string Nazwisko { get; set; }
    public int Wiek { get; set; }
    public string AktualnaPartia { get; set; }
    public List<PartiaHistoriaDto> HistoriaPrzynaleznosci { get; set; }
}