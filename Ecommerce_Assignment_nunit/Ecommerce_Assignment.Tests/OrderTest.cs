using Ecommerce_Assignment.Models;
using Ecommerce_Assignment.Services;
using System;
using System.Collections.Generic;
using System.Text;

namespace Ecommerce_Assignment.Tests
{
    [TestFixture]
    public class OrderBillingServiceTests
    {
        private OrderService service;

        [SetUp]
        public void Setup()
        {
            service = new OrderService();
        }

        [Test]
        public void CalculateSubTotal_ValidInputs_ReturnsSubTotal()
        {
            decimal result = service.CalculateSubTotal(100, 5);

            Assert.That(result, Is.EqualTo(500));
        }

        [Test]
        public void CalculateSubTotal_InvalidPrice_ThrowsException()
        {
            Assert.Throws<ArgumentException>(() =>
                service.CalculateSubTotal(0, 5));
        }

        [Test]
        public void CalculateSubTotal_InvalidQuantity_ThrowsException()
        {
            Assert.Throws<ArgumentException>(() =>
                service.CalculateSubTotal(100, 0));
        }

        [Test]
        public void CalculateDiscount_SubTotalGreaterThan5000_Returns10Percent()
        {
            decimal result = service.CalculateDiscount(6000);

            Assert.That(result, Is.EqualTo(600));
        }

        [Test]
        public void CalculateDiscount_SubTotalBetween2000And4999_Returns5Percent()
        {
            decimal result = service.CalculateDiscount(3000);

            Assert.That(result, Is.EqualTo(150));
        }

        [Test]
        public void CalculateDiscount_SubTotalLessThan2000_ReturnsZero()
        {
            decimal result = service.CalculateDiscount(1000);

            Assert.That(result, Is.EqualTo(0));
        }

        [Test]
        public void CalculateDeliveryCharge_AmountLessThan1000_Returns100()
        {
            decimal result = service.CalculateDeliveryCharge(500);

            Assert.That(result, Is.EqualTo(100));
        }

        [Test]
        public void CalculateDeliveryCharge_AmountGreaterThanOrEqualTo1000_ReturnsZero()
        {
            decimal result = service.CalculateDeliveryCharge(1500);

            Assert.That(result, Is.EqualTo(0));
        }

        [Test]
        public void CalculateFinalAmount_WithDiscountAndFreeDelivery_ReturnsFinalAmount()
        {
            decimal result = service.CalculateFinalAmount(1000, 6);

            Assert.That(result, Is.EqualTo(5400));
        }

        [Test]
        public void CalculateFinalAmount_NoDiscount_WithDeliveryCharge_ReturnsFinalAmount()
        {
            decimal result = service.CalculateFinalAmount(100, 5);

            Assert.That(result, Is.EqualTo(600));
        }
    }
}