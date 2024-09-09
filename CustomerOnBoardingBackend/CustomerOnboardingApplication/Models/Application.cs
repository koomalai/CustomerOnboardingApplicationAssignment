using System;
using System.Collections.Generic;

namespace CustomerOnboardingApplication.Models;

public partial class Application
{
    public int ApplicationId { get; set; }

    public DateTime? ApplicationDate { get; set; }

    public string? StatusOfApplication { get; set; }

    public int? CustomerId { get; set; }

    public virtual Customer? Customer { get; set; }
}
