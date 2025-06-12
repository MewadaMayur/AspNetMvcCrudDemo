using crud_framework_four_eight.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace crud_framework_four_eight.Repo
{
    public interface IEmployeeServices
    {
        Task<ResponseModel> GetAllEmployees();
        Task<ResponseModel> GetEmployeeById(int id);
        Task<ResponseModel> AddEmployee(Employee employee);
        Task<ResponseModel> UpdateEmployee(Employee employee);
        Task<ResponseModel> DeleteEmployee(int id);
    }
}
