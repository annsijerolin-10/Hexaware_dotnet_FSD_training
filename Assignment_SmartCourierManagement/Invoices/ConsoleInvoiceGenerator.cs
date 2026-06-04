using Assignment_SmartCourierManagement.Models;
using System;
using System.Collections.Generic;
using System.Text;

namespace Assignment_SmartCourierManagement.Invoices
{
      public class ConsoleInvoiceGenerator : IInvoiceGenerator
        {
            public void GenerateInvoice(CourierBooking booking, double charge)
            {
                Console.WriteLine("\n===== INVOICE =====");

                Console.WriteLine($"Customer Name     : {booking.Customer.CustomerName}");
                Console.WriteLine($"Source City       : {booking.Parcel.SourceCity}");
                Console.WriteLine($"Destination City  : {booking.Parcel.DestinationCity}");
                Console.WriteLine($"Parcel Weight     : {booking.Parcel.Weight} Kg");
                Console.WriteLine($"Delivery Type     : {booking.DeliveryType}");
                Console.WriteLine($"Total Charge      : Rs.{charge}");

                Console.WriteLine("===================\n");
            }
        }
    
}
