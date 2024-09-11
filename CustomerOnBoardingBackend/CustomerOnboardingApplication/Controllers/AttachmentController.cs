using CustomerOnboardingApplication.Interfaces;
using Microsoft.AspNetCore.Mvc;

namespace CustomerOnboardingApplication.Controllers
{
    public class AttachmentController: ControllerBase
    {
        private readonly IAttachmentService _attachmentService;

        public AttachmentController(IAttachmentService attachmentService)
        {
            _attachmentService = attachmentService;
        }

        [HttpGet]
        [Route("api/attachment/{id}")]
        public async Task<IActionResult> GetAttachment(int id)
        {
            var attachment = await _attachmentService.GetAttachment(id);
            if (attachment == null)
            {
                return NotFound();
            }

            return File(attachment.Documents, attachment.FileName);
        }

        [HttpGet]
        [Route("api/attachment/filenames")]
        public async Task<IActionResult> GetAllFileNames()
        {
            var fileNames = await _attachmentService.GetAllFileNames(); ;
          
            return Ok(fileNames);
        }
    }
}
