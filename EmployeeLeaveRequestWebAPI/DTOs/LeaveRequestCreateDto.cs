using EmployeeLeaveRequestWebAPI.Validations;
using System.ComponentModel.DataAnnotations;

namespace EmployeeLeaveRequestWebAPI.DTOs
{
    public class LeaveRequestCreateDto
    {
        //[Required(ErrorMessage ="Name is required.")]
        //[StringLength(100,MinimumLength =3,ErrorMessage ="Name should have length between 3 and 100 char.")]

        public string EmployeeName { get; set; } = string.Empty;


        //[Required(ErrorMessage = "Email is required.")]
        //[EmailAddress(ErrorMessage ="Invalid email")]
        public string EmployeeEmail { get; set; } = string.Empty;

        //[Required(ErrorMessage = "Mobile Number is required.")]
        //[RegularExpression(@"^[6-9]\d{9}$", ErrorMessage = "MobileNumber must be a valid 10 digit indian mobile number")]
        public string MobileNumber { get; set; } = string.Empty;

        //[ValidLeaveType(ErrorMessage =  "Leave Type is required.")]
        public string LeaveType { get; set; } = string.Empty;

        //[FutureDate(ErrorMessage ="Start Date must be a future date.")]
        public DateTime StartDate { get; set; }

       // [FutureDate(ErrorMessage = "End Date must be a future date.")]
        public DateTime EndDate { get; set; }

        //[Required(ErrorMessage ="Reason should not be empty")]
        //[StringLength(250, MinimumLength = 10, ErrorMessage = "Reason should have length between 10 and 250 char.")]

        public string Reason { get; set; } = string.Empty;
       
     
    }
}
