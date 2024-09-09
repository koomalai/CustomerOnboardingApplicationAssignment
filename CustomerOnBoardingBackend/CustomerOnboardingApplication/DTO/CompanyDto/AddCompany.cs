namespace CustomerOnboardingApplication.DTO.CompanyDto
{
    public class AddCompany
    {
        public string? NameOfCompany { get; set; }

        public string? TypeOfEntity { get; set; }

        public string? BusinessActivity { get; set; }

        public string? License { get; set; }

        public string? RegistrationNumber { get; set; }

        public DateTime? DateOfIncorporation { get; set; }
    }
}
