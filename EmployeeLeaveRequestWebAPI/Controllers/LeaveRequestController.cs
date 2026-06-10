using EmployeeLeaveRequestWebAPI.DTOs;
using EmployeeLeaveRequestWebAPI.Services;
using Microsoft.AspNetCore.Mvc;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace EmployeeLeaveRequestWebAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class LeaveRequestController : ControllerBase
    {
        private readonly ILeaveRequest _service;

        public LeaveRequestController(ILeaveRequest service)
        {
            _service = service;
        }

        // GET: api/<LeaveRequestController>
        [HttpGet]
        public IActionResult GetAll()
        {
            return Ok(_service.GetAll());
        }
        // GET api/<LeaveRequestController>/5
        [HttpGet("{id}")]
        public IActionResult GetById(int id)
        {
            var leaveRequest = _service.GetById(id);

            if (leaveRequest == null)
            {
                return NotFound($"Leave Request with Id {id} not found");
            }

            return Ok(leaveRequest);
        }

        // POST api/<LeaveRequestController>
        [HttpPost]
        public IActionResult Create(LeaveRequestCreateDto dto)
        {
            var result = _service.Create(dto);

            return Ok(result);
        }

        // PUT api/<LeaveRequestController>/5
        [HttpPut("{id}")]
        public void Put(int id, [FromBody] string value)
        {
        }

        // DELETE api/<LeaveRequestController>/5
        [HttpDelete("{id}")]
        public void Delete(int id)
        {
        }
    }
}
