using FleetMaintenanceApi.Data;
using FleetMaintenanceApi.Models;
using FleetMaintenanceApi.Repositories.Interfaces;
using Microsoft.EntityFrameworkCore;

namespace FleetMaintenanceApi.Repositories.Implementations
{
    public class DriverRepository : IDriverRepository
    {
        private readonly FleetMaintenanceDbContext _context;
        public DriverRepository(FleetMaintenanceDbContext context)
        {
            _context = context;
        }
       

        public Task<List<Driver>> GetAllDriversAsync()
        {
            return _context.Drivers.ToListAsync();
        }

        public Task<Driver?> GetDriverByIdAsync(int driverid)
        {
            return _context.Drivers.FirstOrDefaultAsync(d => d.DriverId == driverid);
        }

        public async Task AddDriverAsync(Driver driver)
        {
            await _context.Drivers.AddAsync(driver);
            await _context.SaveChangesAsync();
        }

        public async Task<bool> DriverExistsAsync(int driverId)
        {
            return await _context.Drivers.AnyAsync(d => d.DriverId == driverId);
        }
    }
}
