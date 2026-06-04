using System;
using System.Collections.Generic;
using System.Text;

namespace Assignment_SmartCourierManagement.Notifications
{
    internal class EmailNotificationService:INotificationService
    {
        public void SendNotification(string message) {
            Console.WriteLine($"Email sent : {message}");

        }
    }
}
