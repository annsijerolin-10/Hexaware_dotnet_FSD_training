using EmployeeLeaveRequestWebAPI.DTOs;
using EmployeeLeaveRequestWebAPI.Models;

namespace EmployeeLeaveRequestWebAPI.Services
{

    public class LeaveRequestService : ILeaveRequest
    {
        private readonly List<LeaveRequestResponseDto> leaveRequests = new();

        public LeaveRequestResponseDto Create(LeaveRequestCreateDto dto)
        {
            var response = new LeaveRequestResponseDto
            {
                LeaveRequestId = leaveRequests.Count + 1,
                EmployeeName = dto.EmployeeName,
                EmployeeEmail = dto.EmployeeEmail,
                LeaveType = dto.LeaveType,
                StartDate = dto.StartDate,
                EndDate = dto.EndDate,
                Reason = dto.Reason,
                TotalDays = (dto.EndDate - dto.StartDate).Days + 1,
                Status = "Pending",
                CreatedOn = DateTime.Now
            };

            leaveRequests.Add(response);

            return response;
        }


        public List<LeaveRequestResponseDto> GetAll()
        {
            return leaveRequests;
        }
        public LeaveRequestResponseDto? GetById(int id)
        {
            return leaveRequests.FirstOrDefault(x => x.LeaveRequestId == id);

        }
    }
}
 