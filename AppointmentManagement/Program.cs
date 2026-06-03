using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
namespace AppointmentManagement
{
    class Program
    {
        static void Main(string[] args)
        {
            List<Appointment> appointments = new List<Appointment>()
            {
                new Appointment{AppointmentId=1,PatientName="Raju",Gender="Male",Department="Cardio",AppointmentDate=DateTime.Today,Fee=800,Status="Scheduled"},
                new Appointment{AppointmentId=2,PatientName="Vinai",Gender="Male",Department="Ortho",AppointmentDate=DateTime.Today.AddDays(5),Fee=500,Status="Scheduled"},
                new Appointment{AppointmentId=3,PatientName="Meena",Gender="Female",Department="Neuro",AppointmentDate=DateTime.Today,Fee=700,Status="Completed"},
                new Appointment{AppointmentId=4,PatientName="Shalu",Gender="Female",Department="Cardio",AppointmentDate=DateTime.Today,Fee=800,Status="Completed"},

            };


            //To display all Appointments:
            Console.WriteLine("\n1.All Appointments");
            Console.WriteLine("----------------------");
            foreach(var app in appointments)
            {
                app.Display();
            }

            //2.Display schedule appointment
            Console.WriteLine("\n2.Scheduled appointment");
            Console.WriteLine("-----------------------");
            var scheduledappointment = appointments.Where(appoint => appoint.Status == "Scheduled");
            DisplayAppointments(scheduledappointment);

            //3.Display completed appointments.
            Console.WriteLine("\n3.Completed appointments");
            Console.WriteLine("--------------------------");
            Console.WriteLine("completed appointments");
            var completedappointment = appointments.Where(appoint => appoint.Status == "Completed");

            DisplayAppointments(completedappointment);


             //Display appointments by Cardiology department.
             Console.WriteLine("\n4.Cardiology department");
            Console.WriteLine("--------------------------");
            var cardioappointment = appointments.Where(appoint => appoint.Department == "Cardio");

            DisplayAppointments(cardioappointment);

            //Display appointments with consultation fee greater than 500.
            Console.WriteLine("\n5.consultation fee greater than 500");
            Console.WriteLine("--------------------------");
            var feeconstraint = appointments.Where(appoint => appoint.Fee > 500).ToList();
            DisplayAppointments(feeconstraint);

            //Sort appointments by appointment date.

            Console.WriteLine("\n6.sort appoint by appointment date");
            Console.WriteLine("--------------------------");
            var sortbyappointmentdate = appointments.OrderBy(appoint => appoint.AppointmentDate);
            DisplayAppointments(sortbyappointmentdate);

            //Search appointment by patient name.
            Console.WriteLine("\n7. appointment by patient name");
            Console.WriteLine("--------------------------");

            var searchbyname = appointments.Where(appoint => appoint.PatientName.Contains("Meena"));
            DisplayAppointments(searchbyname);

            //Group by Department:
            Console.WriteLine("\n8.Group by Department:");
            Console.WriteLine("--------------------------");
            var grpbyDepartment = appointments.GroupBy(appoint => appoint.Department);

            foreach (var group in grpbyDepartment)
            {
                Console.WriteLine($"\nDepartment : {group.Key}");
                DisplayAppointments(group);
            }

            //Count appointments by status.
            Console.WriteLine("\n9.Count appointments by status.");
            Console.WriteLine("--------------------------");
            var statusCount = appointments.GroupBy(a => a.Status).
                Select(c => new
                {
                    Status = c.Key,
                    Count = c.Count()


                });
            foreach(var status in statusCount)
            {
                Console.WriteLine($"{status.Status}:{status.Count}");
            }

            //Calculate total revenue from completed appointments.
            Console.WriteLine("\n10.Total revenue from completed appointments.");
            Console.WriteLine("--------------------------");

            decimal totalrev = appointments.Where(appoint => appoint.Status=="Completed").Sum(appoint=>appoint.Fee);
            Console.WriteLine("Total Revenue"+totalrev);

            //Average Consultation Fee

            Console.WriteLine("\n11.Average Consultation Fee");
            Console.WriteLine("--------------------------");
            double averageFee = (double)appointments.Average(a => a.Fee);

            Console.WriteLine("\nAverage Fee = " + averageFee);

            // 17. Upcoming Appointments
            Console.WriteLine("\n12.Upcoming Appointments");
            Console.WriteLine("--------------------------");

            var upcoming = appointments
                .Where(a => a.AppointmentDate > DateTime.Today);

            foreach (var a in upcoming)
            {
                a.Display();

            }
            Console.ReadKey();



        }
        static void DisplayAppointments(IEnumerable<Appointment> appointments)
        {
            foreach (var appointment in appointments)
            {
                appointment.Display();
            }
        }

    }
}