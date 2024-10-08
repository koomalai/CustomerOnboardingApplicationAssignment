﻿using CustomerOnboardingApplication.Interfaces;
using CustomerOnboardingApplication.Models;
using Microsoft.EntityFrameworkCore;

namespace CustomerOnboardingApplication.Services
{
    public class CustomerFormDetailsService : ICustomerFormDetailsService
    {
        private readonly CustomerOnboardingApplicationContext _customerOnboardingContext;

        public CustomerFormDetailsService(CustomerOnboardingApplicationContext customerOnboardingContext)
        {
            _customerOnboardingContext = customerOnboardingContext;
        }

        public async Task<int> CustomerDetails(Customer customer, Company company, Director director, Application application, IFormFile file)
        {
            if (_customerOnboardingContext.Customers.Any(email => email.Email == customer.Email))
            {
                return 0;
            }

            if (file == null || file.Length == 0)
            {
                return 0;
            }

            using (var memoryStream = new MemoryStream())
            {
                await file.CopyToAsync(memoryStream);

                var fileStorage = new Document
                {
                    FileName = file.FileName,
                    Documents = memoryStream.ToArray(),
                    Customer = customer
                };

                _customerOnboardingContext.Documents.Add(fileStorage); 
            }

            company = new Company
            {
                NameOfCompany = company.NameOfCompany,
                BusinessActivity = company.BusinessActivity,
                DateOfIncorporation = company.DateOfIncorporation,
                License = company.License,
                RegistrationNumber = company.RegistrationNumber,
                TypeOfEntity = company.TypeOfEntity,
                CountryName = company.CountryName,
                Customer = customer,
            };

            director = new Director { 
                NameOfDirectorOrShareholders = director.NameOfDirectorOrShareholders,
                PassportNumberOfDirectors = director.PassportNumberOfDirectors,
                Customer = customer,
            };

            application = new Application
            {
                StatusOfApplication = application.StatusOfApplication,
                ApplicationDate = application.ApplicationDate,
                Customer = customer,
            };

            _customerOnboardingContext.Customers.Add(customer);
            _customerOnboardingContext.Companies.Add(company);
            _customerOnboardingContext.Directors.Add(director);
            _customerOnboardingContext.Applications.Add(application);

            await _customerOnboardingContext.SaveChangesAsync();

            if (customer != null || company != null || director != null || application != null || file != null)
            {
                return application!.ApplicationId;
            }
            return 0;
        }

        public async Task<IEnumerable<Company>> GetCustomerDetails()
        {
            return await _customerOnboardingContext.Companies.ToListAsync();
        }
    }
}
