using CustomerOnboardingApplication.Interfaces;
using CustomerOnboardingApplication.Models;
using Microsoft.EntityFrameworkCore;

namespace CustomerOnboardingApplication.Services
{
    public class CountryService: ICountryService
    {
        private readonly CustomerOnboardingApplicationContext _customerOnboardingContext;

        public CountryService(CustomerOnboardingApplicationContext customerOnboardingContext)
        {
            _customerOnboardingContext = customerOnboardingContext;
        }
        public async Task<IEnumerable<Country>> GetAllCountriesAsync()
        {
            return await _customerOnboardingContext.Countries.ToListAsync();
        }
    }
}
