using System;
using System.Collections.Generic;
using System.Text;

namespace AppointmentManagement
{
    public partial class Appointment
    {
        public bool ValidateAppointment()
        {
            return !string.IsNullOrEmpty(PatientName) &&
                !string.IsNullOrEmpty(Department) &&
                Fee > 0;
        }

    }
}
