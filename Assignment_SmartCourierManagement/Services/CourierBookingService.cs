using Assignment_SmartCourierManagement.DeliveryCalculators;
using Assignment_SmartCourierManagement.Invoices;
using Assignment_SmartCourierManagement.Models;
using Assignment_SmartCourierManagement.Notifications;
using System;
using System.Collections.Generic;
using System.Text;

namespace Assignment_SmartCourierManagement.Services
{
    public class CourierBookingService
    {
        private readonly IDeliveryChargeCalculator _calculator;
        private readonly INotificationService _notificationService;
        private readonly IInvoiceGenerator _invoiceGenerator;

        public CourierBookingService(
            IDeliveryChargeCalculator calculator,
            INotificationService notificationService,
            IInvoiceGenerator invoiceGenerator)
        {
            _calculator = calculator;
            _notificationService = notificationService;
            _invoiceGenerator = invoiceGenerator;
        }

        public void BookCourier(CourierBooking booking)
        {
            double charge =
                _calculator.CalculateCharge(booking.Parcel.Weight);

            _notificationService.SendNotification(
                $"Courier booked successfully for {booking.Customer.CustomerName}");

            _invoiceGenerator.GenerateInvoice(booking, charge);
        }
    }
}
