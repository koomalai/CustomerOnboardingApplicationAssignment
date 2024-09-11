using CustomerOnboardingApplication.DTO.ApplicationDto;
using CustomerOnboardingApplication.Interfaces;
using Microsoft.AspNetCore.Mvc;

namespace CustomerOnboardingApplication.Controllers
{
    public class ApplicationController: ControllerBase
    {
        private readonly IApplicationService _applicationService;
       
        public ApplicationController(IApplicationService applicationService)
        {
            _applicationService = applicationService;
        }

        [HttpPut]
        [Route("api/application/update/{id}")]
        public async Task<IActionResult> UpdateApplicationStatus(int id, UpdateApplicationStatusDto updateApplicationDto)
        {
            var application = await _applicationService.GetApplicationByIdAsync(id);
            if (application == null)
            {
                return NotFound();
            }

            //Map Dto to Model class
            application.StatusOfApplication = updateApplicationDto.StatusOfApplication;

            await _applicationService.UpdateApplicationAsync(application);

            return Ok(application);
        }
    }
}
