using CustomerOnboardingApplication.Interfaces;
using CustomerOnboardingApplication.Models;
using Microsoft.EntityFrameworkCore;

namespace CustomerOnboardingApplication.Services
{
    public class AttachmentService: IAttachmentService
    {
        private readonly CustomerOnboardingApplicationContext _customerOnboardingContext;

        public AttachmentService(CustomerOnboardingApplicationContext customerOnboardingContext)
        {
            _customerOnboardingContext = customerOnboardingContext;
        }

        public async Task<List<string>> GetAllFileNames()
        {
            return await _customerOnboardingContext.Documents
                .Select(file => file!.FileName)
                .ToListAsync();
        }

        public async Task<Document> GetAttachment(int id)
        {
            return await _customerOnboardingContext.Documents.FindAsync(id);
        }
    }
}
