using CustomerOnboardingApplication.Models;

namespace CustomerOnboardingApplication.Interfaces
{
    public interface ICountryService
    {
        public Task<IEnumerable<Country>> GetAllCountriesAsync();
    }
}
