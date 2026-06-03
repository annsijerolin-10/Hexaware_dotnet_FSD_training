using System;
using System.Collections.Generic;
using System.Text;

namespace AppointmentManagement
{
    public partial class Appointment
    {
        public void Display()
        {
            Console.WriteLine($"{AppointmentId} | {PatientName} | {Department} | " +
                $"{AppointmentDate.ToShortDateString()} | {Fee} | {Status}");
            
        }
    }
}
