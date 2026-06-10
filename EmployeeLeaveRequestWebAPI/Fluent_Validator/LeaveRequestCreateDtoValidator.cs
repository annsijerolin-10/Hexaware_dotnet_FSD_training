using EmployeeLeaveRequestWebAPI.DTOs;
using FluentValidation;

namespace EmployeeLeaveRequestWebAPI.Validations
{
    public class LeaveRequestCreateDtoValidator: AbstractValidator<LeaveRequestCreateDto>
    {
        public LeaveRequestCreateDtoValidator()
        {
            RuleFor(x => x.EmployeeName)
                .NotEmpty()
                .Length(3, 100);

            RuleFor(x => x.EmployeeEmail)
                .NotEmpty()
                .EmailAddress();

            RuleFor(x => x.MobileNumber)
                .NotEmpty()
                .Matches(@"^[6-9]\d{9}$")
                .WithMessage("Mobile Number must be a valid 10 digit Indian mobile number");

            RuleFor(x => x.LeaveType)
                .Must(x => x == "Sick" ||
                           x == "Casual" ||
                           x == "Earned")
                .WithMessage("Leave Type must be Sick, Casual, or Earned");

            RuleFor(x => x.StartDate)
                .GreaterThan(DateTime.Today)
                .WithMessage("Start Date must be a future date");

            RuleFor(x => x.EndDate)
                .GreaterThan(DateTime.Today)
                .WithMessage("End Date must be a future date");

            RuleFor(x => x.Reason)
                .NotEmpty()
                .Length(10, 250);
        }
    }
}