using CustomerOnboardingApplication.Interfaces;
using CustomerOnboardingApplication.Models;

namespace CustomerOnboardingApplication.Services
{
    public class ApplicationService: IApplicationService
    {
        private readonly CustomerOnboardingApplicationContext _customerOnboardingContext;

        public ApplicationService(CustomerOnboardingApplicationContext customerOnboardingContext)
        {
            _customerOnboardingContext = customerOnboardingContext;
        }

        public async Task<Application> GetApplicationByIdAsync(int id)
        {
            return await _customerOnboardingContext.Applications.FindAsync(id);
        }

        public async Task UpdateApplicationAsync(Application application)
        {
            _customerOnboardingContext.Applications.Update(application);
            await _customerOnboardingContext.SaveChangesAsync();
        }
    }
}
