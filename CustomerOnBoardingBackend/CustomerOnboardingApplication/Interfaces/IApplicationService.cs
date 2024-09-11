using CustomerOnboardingApplication.Models;

namespace CustomerOnboardingApplication.Interfaces
{
    public interface IApplicationService
    {
        public Task<Application> GetApplicationByIdAsync(int id);
        public Task UpdateApplicationAsync(Application application);
    }
}
