using FleetMaintenanceApi.Models;

namespace FleetMaintenanceApi.Repositories.Interfaces
{
    public interface IMaintenanceRepository
    {
        

        Task AddMaintenanceRecordAsync(MaintenanceRecord maintenanceRecord);
        IQueryable<MaintenanceRecord> GetMaintenanceRecordsQueryable();

    }
}
