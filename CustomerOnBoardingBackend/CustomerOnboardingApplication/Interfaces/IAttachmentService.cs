using CustomerOnboardingApplication.Models;

namespace CustomerOnboardingApplication.Interfaces
{
    public interface IAttachmentService
    {
        public Task<List<string>> GetAllFileNames();
        public Task<Document> GetAttachment(int id);
    }
}
