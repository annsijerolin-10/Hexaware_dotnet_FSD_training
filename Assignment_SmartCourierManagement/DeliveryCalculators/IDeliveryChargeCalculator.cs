using System;
using System.Collections.Generic;
using System.Text;

namespace Assignment_SmartCourierManagement.DeliveryCalculators
{
    
        public interface IDeliveryChargeCalculator
        {
            double CalculateCharge(double weight);
        }
    
}
