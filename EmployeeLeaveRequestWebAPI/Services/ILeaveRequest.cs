using EmployeeLeaveRequestWebAPI.DTOs;
//using EmployeeLeaveRequestWebAPI.Models;
namespace EmployeeLeaveRequestWebAPI.Services
{
    public interface ILeaveRequest
    {
        LeaveRequestResponseDto Create(LeaveRequestCreateDto dto);

        List<LeaveRequestResponseDto> GetAll();
        LeaveRequestResponseDto? GetById(int id);

    }
}
