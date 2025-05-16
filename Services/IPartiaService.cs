public enum DeletePartiaResult { Success, Conflict, NotFound }


public interface IPartiaService
{ DeletePartiaResult DeletePartia(int id); }





public class PartiaService : IPartiaService
{
    private readonly string _connectionString;
    public PartiaService(IConfiguration configuration)
    {
        _connectionString = configuration.GetConnectionString("DefaultConnection");
    }





    public DeletePartiaResult DeletePartia(int id)
    {
        using (var connection = new SqlConnection(_connectionString))
        using (var command = connection.CreateCommand())
        {
            connection.Open();
            command.CommandText = "SELECT COUNT(1) FROM Partia WHERE ID = @id";
            command.Parameters.AddWithValue("@id", id);
            int count = (int)command.ExecuteScalar();
            if (count == 0)
                return DeletePartiaResult.NotFound;

            command.CommandText = @"
                SELECT COUNT(1) 
                FROM Przynaleznosc 
                WHERE Partia_ID = @id AND Do IS NULL";
            int activeCount = (int)command.ExecuteScalar();
            if (activeCount > 0)
                return DeletePartiaResult.Conflict;
            command.CommandText = "DELETE FROM Przynaleznosc WHERE Partia_ID = @id";
            command.ExecuteNonQuery();

            command.CommandText = "DELETE FROM Partia WHERE ID = @id";
            command.ExecuteNonQuery();
        }
        return DeletePartiaResult.Success;
    }
}
