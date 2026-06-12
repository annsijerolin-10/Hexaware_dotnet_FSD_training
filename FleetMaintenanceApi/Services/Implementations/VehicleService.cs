using FleetMaintenanceApi.Dtos;
using FleetMaintenanceApi.DTOs;
using FleetMaintenanceApi.Models;
using FleetMaintenanceApi.Repositories.Interfaces;
using FleetMaintenanceApi.Services.Interfaces;

namespace FleetMaintenanceApi.Services.Implementations
{
    public class VehicleService : IVehicleService
    {
        private readonly IVehicleRepository _vehicleRepository;
        public VehicleService(IVehicleRepository vehicleRepository)
        {
            _vehicleRepository = vehicleRepository;
        }
        

        public async Task<List<VehicleResponseDto>> GetAllVehiclesAsync()
        {
            var vehicles = await _vehicleRepository.GetAllVehiclesAsync();
            return vehicles.Select(v => new VehicleResponseDto
            {
                VehicleId = v.VehicleId,
                VehicleNumber = v.VehicleNumber,
                VehicleType = v.VehicleType,
                Brand = v.Brand,
                Model = v.Model,
                PurchaseYear = v.PurchaseYear,
                IsActive = v.IsActive
            }).ToList();
            
        }

        public async Task<VehicleResponseDto?> GetVehicleByIdAsync(int vehicleId)
        {
            var vehicle = await _vehicleRepository.GetVehicleByIdAsync(vehicleId);
            if (vehicleId == null)
            {
                return null;
            }
            return new VehicleResponseDto
            {
                VehicleId = vehicle.VehicleId,
                VehicleNumber = vehicle.VehicleNumber,
                VehicleType = vehicle.VehicleType,
                Brand = vehicle.Brand,
                Model = vehicle.Model,
                PurchaseYear = vehicle.PurchaseYear,
                IsActive = vehicle.IsActive

            };
        }
        public async Task<(bool Success, string Message, VehicleResponseDto? Data)> AddVehicleAsync(VehicleCreateDto dto)
        {
            if (string.IsNullOrWhiteSpace(dto.VehicleNumber))
            {
                return (false, "Vehicle Number is required", null);

            }
            if (string.IsNullOrWhiteSpace(dto.VehicleType))
            {
                return (false, "Vehicle Type is required", null);

            }
            if (string.IsNullOrWhiteSpace(dto.Brand))
            {
                return (false, "Brand is required", null);

            }
            if (dto.PurchaseYear <= 2000)
            {
                return (false, "Purchase Year should be greater than 2000.", null);
            }
            var vehicle = new Vehicle
            {
                VehicleNumber = dto.VehicleNumber,
                VehicleType = dto.VehicleType,
                Brand = dto.Brand,
                Model = dto.Model,
                PurchaseYear = dto.PurchaseYear,
                IsActive = dto.IsActive
            };

            await _vehicleRepository.AddVehicleAsync(vehicle);
            return (true,
               "Vehicle added successfully",
               new VehicleResponseDto
               {
                   VehicleId = vehicle.VehicleId,
                   VehicleNumber = vehicle.VehicleNumber,
                   VehicleType = vehicle.VehicleType,
                   Brand = vehicle.Brand,
                   Model = vehicle.Model,
                   PurchaseYear = vehicle.PurchaseYear,
                   IsActive = vehicle.IsActive
               });

        }
    }
}
