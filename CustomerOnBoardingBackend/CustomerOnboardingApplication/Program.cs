using CustomerOnboardingApplication.Interfaces;
using CustomerOnboardingApplication.Models;
using CustomerOnboardingApplication.Services;
using Microsoft.EntityFrameworkCore;

var builder = WebApplication.CreateBuilder(args);

// Add services to the container.

builder.Services.AddControllers();
// Learn more about configuring Swagger/OpenAPI at https://aka.ms/aspnetcore/swashbuckle
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen();

builder.Services.AddDbContext<CustomerOnboardingApplicationContext>(options =>
                options.UseSqlServer("Data Source = K130468\\SQLEXPRESS; Initial Catalog = CustomerOnboardingApplication; Integrated Security = True; TrustServerCertificate = True;"));
builder.Services.AddScoped<ICustomerFormDetailsService, CustomerFormDetailsService>();
builder.Services.AddScoped<ICountryService, CountryService>();

builder.Services.AddCors(options =>
{
    options.AddDefaultPolicy(policy => policy
        .AllowAnyOrigin()
        .AllowAnyHeader()
        .AllowAnyMethod()
    );
});

var app = builder.Build();

// Configure the HTTP request pipeline.
if (app.Environment.IsDevelopment())
{
    app.UseSwagger();
    app.UseSwaggerUI();
}

app.UseCors();

app.UseHttpsRedirection();

app.UseAuthorization();

app.MapControllers();

app.Run();
