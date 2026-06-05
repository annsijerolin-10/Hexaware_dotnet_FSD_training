using System;
using System.Collections.Generic;
using System.Text;

namespace Ecommerce_Assignment.Models
{
    public class Order
    {
        public decimal ProductPrice { get; set; }
        public int Quantity { get; set; }

        public Order(decimal productPrice,int quantity)
        {
            ProductPrice = productPrice;
            Quantity = quantity;
        }
    }
}
