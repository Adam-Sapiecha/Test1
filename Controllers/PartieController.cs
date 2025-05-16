[ApiController]
[Route("partie")]
public class PartieController : ControllerBase
{
    private readonly IPartiaService _service;
    public PartieController(IPartiaService service)
    {
        _service = service;
    }

    [HttpDelete("{id}")]
    public IActionResult Delete(int id)
    {
        var result = _service.DeletePartia(id);
        if (result == DeletePartiaResult.NotFound)
        {

            return NotFound("Partia już została rozwiązana. Imperatorka nie toleruje redundancji.");
        }
        if (result == DeletePartiaResult.Conflict)
        {

            return Conflict("Nie mozna usunąc w ponieważ w partii są ciagle politycy");
        }
        return NoContent();
    }
}

