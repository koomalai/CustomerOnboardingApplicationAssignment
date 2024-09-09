using System;
using System.Collections.Generic;

namespace CustomerOnboardingApplication.Models;

public partial class Customer
{
    public int CustomerId { get; set; }

    public string? MainPurposeForApplyingAtMcb { get; set; }

    public string? NameOfApplicant { get; set; }

    public string? Email { get; set; }

    public virtual ICollection<Application> Applications { get; set; } = new List<Application>();

    public virtual ICollection<Company> Companies { get; set; } = new List<Company>();

    public virtual ICollection<Director> Directors { get; set; } = new List<Director>();

    public virtual ICollection<Document> Documents { get; set; } = new List<Document>();
}
