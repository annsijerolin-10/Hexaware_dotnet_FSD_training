using System;
using System.Collections.Generic;
using System.Text;

namespace AppointmentManagement
{
    public partial class Appointment
    {
        public int AppointmentId { get; set; }
        public string PatientName { get; set; } = string.Empty;
        public decimal Fee { get; set; }
        public string Department { get; set; } = string.Empty;
        public string Gender { get; set; } = string.Empty;
        public DateTime AppointmentDate { get; set; }
        public string Status { get; set; } = string.Empty;


    }
}
