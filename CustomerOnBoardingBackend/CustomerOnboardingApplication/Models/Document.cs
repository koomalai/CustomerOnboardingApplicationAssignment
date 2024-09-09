using System;
using System.Collections.Generic;

namespace CustomerOnboardingApplication.Models;

public partial class Document
{
    public int DocumentId { get; set; }

    public byte[]? Documents { get; set; }

    public byte[]? DigitalSignature { get; set; }

    public int? CustomerId { get; set; }

    public virtual Customer? Customer { get; set; }
}
