using Azure.Core;
using CustomerOnboardingApplication.AutoMappers.CustomerFormDetailsAutomappers;
using CustomerOnboardingApplication.DTO.ApplicationDto;
using CustomerOnboardingApplication.DTO.CompanyDto;
using CustomerOnboardingApplication.DTO.CountryDto;
using CustomerOnboardingApplication.DTO.CustomerDto;
using CustomerOnboardingApplication.DTO.DirectorDto;
using CustomerOnboardingApplication.DTO.DocumentsDto;
using CustomerOnboardingApplication.Interfaces;
using CustomerOnboardingApplication.Models;
using Microsoft.AspNetCore.Mvc;
using System.Text;

namespace CustomerOnboardingApplication.Controllers
{
    public class CustomerFormDetailsController : ControllerBase
    {
        private readonly ICustomerFormDetailsService _customerFormDetailsService;

        public CustomerFormDetailsController(ICustomerFormDetailsService customerFormDetailsService)
        {
            _customerFormDetailsService = customerFormDetailsService;
        }

        [HttpPost]
        [Route("api/customer/customerFormSubmission")]
        public async Task<bool> CustomerFormDetailsAsync(AddCustomerDto customerDto, AddCompanyDto companyDto, AddDirectorDto directorDto, IFormFile file)
        {
            var customer = customerDto.ToCustomer();
            var company = companyDto.ToCompany();
            var director = directorDto.ToDirector();
            var application = new ApplicationDto().ToApplication();
            return await _customerFormDetailsService.CustomerDetails(customer, company, director, application, file);
        }

        [HttpGet]
        [Route("api/customer/customerDetails")]
        public async Task<IEnumerable<Company>> GetCustomerDetailsAsync()
        {
            return await _customerFormDetailsService.GetCustomerDetails();         
        }
    }
}
