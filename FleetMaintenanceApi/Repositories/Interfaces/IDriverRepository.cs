using FleetMaintenanceApi.Models;

namespace FleetMaintenanceApi.Repositories.Interfaces
{
    public interface IDriverRepository
    {
        Task<List<Driver>> GetAllDriversAsync();
        Task<Driver?> GetDriverByIdAsync(int driverid);
        Task AddDriverAsync(Driver driver);
        Task<bool> DriverExistsAsync(int driverId);





    }
}
