using System;
using System.Collections.Generic;
using System.Text;

namespace Assignment_SmartCourierManagement.Notifications
{
    public interface INotificationService
    {
        void SendNotification(string message);
    }
}
