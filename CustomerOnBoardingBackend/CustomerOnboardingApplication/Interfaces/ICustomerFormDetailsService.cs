using CustomerOnboardingApplication.DTO.CompanyDto;
using CustomerOnboardingApplication.Models;
using Microsoft.AspNetCore.Mvc;

namespace CustomerOnboardingApplication.Interfaces
{
    public interface ICustomerFormDetailsService
    {
        public Task<bool> CustomerDetails(Customer customer, Company company, Director director, Application application, IFormFile file);
        public Task<IEnumerable<Company>> GetCustomerDetails();
    }
}
