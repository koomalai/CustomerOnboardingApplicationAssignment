using CustomerOnboardingApplication.DTO.CompanyDto;
using CustomerOnboardingApplication.Models;

namespace CustomerOnboardingApplication.Interfaces
{
    public interface ICustomerFormDetailsService
    {
        public Task<int> CustomerDetails(Customer customer, Company company, Director director, Application application, IFormFile file);
        public Task<IEnumerable<Company>> GetCustomerDetails();
    }
}
