using System;
using System.Collections.Generic;
using System.Text;

namespace Assignment_SmartCourierManagement.DeliveryCalculators
{
    internal class InternationalDeliveryCalculator: IDeliveryChargeCalculator
    {
        public double CalculateCharge(double weight)
        {
            return (weight * 150) + 500;
        }
    }
    
 
}
