using System;
using System.Collections.Generic;

namespace CustomerOnboardingApplication.Models;

public partial class Director
{
    public int DirectorId { get; set; }

    public string? NameOfDirectorOrShareholders { get; set; }

    public string? PassportNumberOfDirectors { get; set; }

    public int? CustomerId { get; set; }

    public virtual Customer? Customer { get; set; }
}
