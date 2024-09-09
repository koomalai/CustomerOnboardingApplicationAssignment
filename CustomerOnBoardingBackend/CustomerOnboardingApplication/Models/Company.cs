using System;
using System.Collections.Generic;

namespace CustomerOnboardingApplication.Models;

public partial class Company
{
    public int CompanyId { get; set; }

    public string? NameOfCompany { get; set; }

    public string? TypeOfEntity { get; set; }

    public string? BusinessActivity { get; set; }

    public string? License { get; set; }

    public string? RegistrationNumber { get; set; }

    public DateTime? DateOfIncorporation { get; set; }

    public int? CountryId { get; set; }

    public int? CustomerId { get; set; }

    public virtual Country? Country { get; set; }

    public virtual Customer? Customer { get; set; }
}
