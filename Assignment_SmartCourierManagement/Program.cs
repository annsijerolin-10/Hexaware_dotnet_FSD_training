using System;
using Assignment_SmartCourierManagement.Models;
using Assignment_SmartCourierManagement.DeliveryCalculators;
using Assignment_SmartCourierManagement.Notifications;
using Assignment_SmartCourierManagement.Invoices;
using Assignment_SmartCourierManagement.Services;

namespace Assignment_SmartCourierManagement
{
    internal class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine(" SMART COURIER DELIVERY MANAGEMENT SYSTEM ");

            Console.Write("Customer Name : ");
            string name = Console.ReadLine();

            Console.Write("Customer Email : ");
            string email = Console.ReadLine();

            Console.Write("Customer Mobile Number : ");
            string mobile = Console.ReadLine();

            Console.Write("Parcel Weight (Kg) : ");
            double weight = Convert.ToDouble(Console.ReadLine());

            Console.Write("Source City : ");
            string sourceCity = Console.ReadLine();

            Console.Write("Destination City : ");
            string destinationCity = Console.ReadLine();

            Console.WriteLine("\nDelivery Types");
            Console.WriteLine("1. Standard Delivery");
            Console.WriteLine("2. Express Delivery");
            Console.WriteLine("3. International Delivery");
            Console.Write("Choose Delivery Type : ");
            int deliveryChoice = Convert.ToInt32(Console.ReadLine());

            Console.WriteLine("\nNotification Types");
            Console.WriteLine("1. Email");
            Console.WriteLine("2. SMS");
            Console.WriteLine("3. WhatsApp");
            Console.Write("Choose Notification Type : ");
            int notificationChoice = Convert.ToInt32(Console.ReadLine());

            Customer customer = new Customer
            {
                CustomerName = name,
                CustomerEmail = email,
                MobileNumber = mobile
            };

            Parcel parcel = new Parcel
            {
                Weight = weight,
                SourceCity = sourceCity,
                DestinationCity = destinationCity
            };

            CourierBooking booking = new CourierBooking
            {
                Customer = customer,
                Parcel = parcel,
                DeliveryType = GetDeliveryType(deliveryChoice)
            };

            IDeliveryChargeCalculator calculator =
                GetCalculator(deliveryChoice);

            INotificationService notificationService =
                GetNotificationService(notificationChoice);

            IInvoiceGenerator invoiceGenerator =
                new ConsoleInvoiceGenerator();

            CourierBookingService bookingService =new CourierBookingService(
                    calculator,
                    notificationService,
                    invoiceGenerator);

            bookingService.BookCourier(booking);

            Console.ReadKey();
        }

        static IDeliveryChargeCalculator GetCalculator(int choice)
        {
            if (choice == 1)
                return new StandardDeliveryCalculator();

            if (choice == 2)
                return new ExpressDeliveryCalculator();

            return new InternationalDeliveryCalculator();
        }

        static INotificationService GetNotificationService(int choice)
        {
            if (choice == 1)
                return new EmailNotificationService();

            if (choice == 2)
                return new SmsNotificationService();

            return new WhatsAppNotification();
        }

        static string GetDeliveryType(int choice)
        {
            if (choice == 1)
                return "Standard Delivery";

            if (choice == 2)
                return "Express Delivery";

            return "International Delivery";
        }
    }
}