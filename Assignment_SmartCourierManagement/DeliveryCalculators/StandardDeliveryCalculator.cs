using System;
using System.Collections.Generic;
using System.Text;

namespace Assignment_SmartCourierManagement.DeliveryCalculators
{
    public class StandardDeliveryCalculator : IDeliveryChargeCalculator
    {
        public double CalculateCharge(double weight)
        {
            return weight * 50;
        }
    }
}
