using System;
using System.Collections.Generic;

namespace CustomerOnboardingApplication.Models;

public partial class Country
{
    public int CountryId { get; set; }

    public string? CountryOfIncorporation { get; set; }

    public virtual ICollection<Company> Companies { get; set; } = new List<Company>();
}
