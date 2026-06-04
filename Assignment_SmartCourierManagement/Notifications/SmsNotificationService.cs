using System;
using System.Collections.Generic;
using System.Text;

namespace Assignment_SmartCourierManagement.Notifications
{
    internal class SmsNotificationService: INotificationService
    {
        public void SendNotification(string message)
        {
            Console.WriteLine($"SMS sent : {message}");

        }
    
    }
}
