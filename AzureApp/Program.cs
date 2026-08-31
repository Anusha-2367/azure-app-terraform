var builder = WebApplication.CreateBuilder(args);

var app = builder.Build();

app.MapGet("/", () =>
{
    return Results.Ok(new
    {
        Application = "Azure App Service Demo",
        Status = "Running",
        Message = "Application deployed successfully using GitHub Actions!",
        Environment = "Azure"
    });
});

app.MapGet("/health", () =>
{
    return Results.Ok(new
    {
        Status = "Healthy"
    });
});

app.Run();