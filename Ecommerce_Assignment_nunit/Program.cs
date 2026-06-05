
using Ecommerce_Assignment.Services;
using Ecommerce_Assignment.Models;
namespace Ecommerce_Assignment
{
    internal class Program
    {
        static void Main(string[] args)
        {
            OrderService orderService = new OrderService();
            //Order order = new Order(100, 5);
            decimal productPrice = 1000;
            int quantity = 6;
            decimal finalAmount =orderService.CalculateFinalAmount(productPrice, quantity);
            Console.WriteLine($"Final amount is {finalAmount}");
            Console.ReadKey();
        }
    }
}