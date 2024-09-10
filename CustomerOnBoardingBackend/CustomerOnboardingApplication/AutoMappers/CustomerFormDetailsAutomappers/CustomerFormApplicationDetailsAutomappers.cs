using CustomerOnboardingApplication.DTO.ApplicationDto;
using CustomerOnboardingApplication.Models;
using AutoMapper;
using CustomerOnboardingApplication.DTO.CustomerDto;
using CustomerOnboardingApplication.DTO.CompanyDto;
using CustomerOnboardingApplication.DTO.CountryDto;
using CustomerOnboardingApplication.DTO.DirectorDto;
using CustomerOnboardingApplication.DTO.DocumentsDto;

namespace CustomerOnboardingApplication.AutoMappers.CustomerFormDetailsAutomappers
{
    public static class CustomerFormApplicationDetailsAutomappers
    {
        public static Customer ToCustomer(this AddCustomerDto customerDto)
        {
            var mapper = BaseAutoMapper.CreateBaseAutoMapper<AddCustomerDto, Customer>();
            return mapper.Map<Customer>(customerDto);
        }

        public static Company ToCompany(this AddCompanyDto companyDto)
        {
            var mapper = BaseAutoMapper.CreateBaseAutoMapper<AddCompanyDto, Company>();
            return mapper.Map<Company>(companyDto);
        }

        public static Country ToCountry(this AddCountryDto countryDto)
        {
            var mapper = BaseAutoMapper.CreateBaseAutoMapper<AddCountryDto, Country>();
            return mapper.Map<Country>(countryDto);
        }

        public static Director ToDirector(this AddDirectorDto directorDto)
        {
            var mapper = BaseAutoMapper.CreateBaseAutoMapper<AddDirectorDto, Director>();
            return mapper.Map<Director>(directorDto);
        }

        public static Document ToDocument(this AddDocumentsDto documentDto)
        {
            var mapper = BaseAutoMapper.CreateBaseAutoMapper<AddDocumentsDto, Document>();
            return mapper.Map<Document>(documentDto);
        }

        public static Application ToApplication(this ApplicationDto applicationDto)
        {
            var configuration = new MapperConfiguration(configuration =>
                configuration.CreateMap<ApplicationDto, Application>()
                .ForMember(destination =>
                destination.ApplicationDate,
                applicationDate => applicationDate.MapFrom(source => DateTime.Today))
                .ForMember(destination =>
                destination.StatusOfApplication,
                userType => userType.MapFrom(source => "Submitted"))
            );
            var mapper = new Mapper(configuration);
            return mapper.Map<Application>(applicationDto);
        }
    }
}
