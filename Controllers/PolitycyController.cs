[ApiController]
[Route("politycy")]
public class PolitycyController : ControllerBase
{
    private readonly IPolitykService _service;
    public PolitycyController(IPolitykService service)
    {
        _service = service;
    }

    [HttpGet]
    public IActionResult GetPolitycy()
    {
        var politycy = _service.GetPolitycy();
        return Ok(politycy);
    }
}
