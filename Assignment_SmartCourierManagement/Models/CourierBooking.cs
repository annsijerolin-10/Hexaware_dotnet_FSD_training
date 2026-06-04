using System;
using System.Collections.Generic;
using System.Text;

namespace Assignment_SmartCourierManagement.Models
{
    public class CourierBooking
    {
        public Customer Customer { get; set; }
        public Parcel Parcel { get; set; }
        public string DeliveryType { get; set; }
    }
}
