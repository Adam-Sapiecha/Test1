var builder = WebApplication.CreateBuilder(args);
builder.Services.AddScoped<IPolitykService, PolitykService>();
builder.Services.AddScoped<IPartiaService, PartiaService>();
builder.Services.AddControllers();
var app = builder.Build();

app.MapControllers();
app.Run();
