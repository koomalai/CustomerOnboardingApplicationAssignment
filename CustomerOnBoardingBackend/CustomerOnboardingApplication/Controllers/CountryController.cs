using CustomerOnboardingApplication.Interfaces;
using CustomerOnboardingApplication.Models;
using Microsoft.AspNetCore.Mvc;

namespace CustomerOnboardingApplication.Controllers
{
    public class CountryController: ControllerBase
    {
        private readonly ICountryService _countryService;

        public CountryController(ICountryService countryService)
        {
            _countryService = countryService;
        }

        [HttpGet]
        [Route("api/country/getAllCountry")]
        public async Task<IEnumerable<Country>> GetAllCountriesAsync()
        {
            return await _countryService.GetAllCountriesAsync();
        }
    }
}
