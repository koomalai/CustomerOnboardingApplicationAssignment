namespace CustomerOnboardingApplication.DTO.CompanyDto
{
    public class AddCompanyDto
    {
        public string? NameOfCompany { get; set; }

        public string? CountryName { get; set; }

        public string? TypeOfEntity { get; set; }

        public string? BusinessActivity { get; set; }

        public string? License { get; set; }

        public string? RegistrationNumber { get; set; }

        public DateTime? DateOfIncorporation { get; set; }
    }
}
