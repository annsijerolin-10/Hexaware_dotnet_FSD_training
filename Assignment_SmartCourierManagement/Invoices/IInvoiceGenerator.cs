using Assignment_SmartCourierManagement.Models;
using System;
using System.Collections.Generic;
using System.Text;

namespace Assignment_SmartCourierManagement.Invoices
{
    
        public interface IInvoiceGenerator
        {
            void GenerateInvoice(CourierBooking booking, double charge);
        }
    
}
