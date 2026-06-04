using System;
using System.Collections.Generic;
using System.Text;

namespace Assignment_SmartCourierManagement.Notifications
{
    internal class WhatsAppNotification: INotificationService
    {
        public void SendNotification(string message)
        {
            Console.WriteLine($"Whatsapp Message sent : {message}");

        }
    
    }
}
