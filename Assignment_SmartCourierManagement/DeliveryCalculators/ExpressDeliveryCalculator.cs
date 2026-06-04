using System;
using System.Collections.Generic;
using System.Text;

namespace Assignment_SmartCourierManagement.DeliveryCalculators
{
    internal class ExpressDeliveryCalculator: IDeliveryChargeCalculator
    {
        public double CalculateCharge(double weight)
        {
            return (weight * 80) + 100;
        }
    }
    
}
