using crud_framework_four_eight.Models;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Threading.Tasks;
using System.Web;
using System.Web.Mvc;
using Newtonsoft.Json;

namespace crud_framework_four_eight.Repo
{
    public class EmployeeServices : IEmployeeServices
    {
        private readonly string connectionString = ConfigurationManager.ConnectionStrings["crud"].ConnectionString;
        public async Task<ResponseModel> GetAllEmployees()
        {
            ResponseModel response = new ResponseModel();
            try
            {
                string connectionString = null;
                connectionString = ConfigurationManager.ConnectionStrings["crud"].ConnectionString;
                SqlConnection connection = new SqlConnection(connectionString);
                await connection.OpenAsync();
                SqlCommand command = new SqlCommand("Employee_Get_All_SP", connection);
                command.CommandType = CommandType.StoredProcedure;
                SqlDataAdapter da = new SqlDataAdapter(command);
                DataSet ds = new DataSet();
                da.Fill(ds);
                connection.Close();
                
                if (ds.Tables[0].Rows.Count == 0)
                {
                    response.Success = false;
                    response.Message = "No employees found.";
                    response.Data = null;
                    return response;
                }
                else
                {
                    response.Success = true;
                    response.OutData = new List<object>();
                    response.OutData.Add(JsonConvert.SerializeObject(ds.Tables[0]));
                    response.Message = "Employees retrieved.";
                }
            }
            catch (Exception ex)
            {
                response.Success = false;
                response.Message = ex.Message;
            }
            return response;
        }

        public async Task<ResponseModel> GetEmployeeById(int id)
        {
            ResponseModel response = new ResponseModel();
            try
            {
                SqlConnection connection = new SqlConnection(connectionString);
                await connection.OpenAsync();
                SqlCommand command = new SqlCommand("Employee_Get_By_Id_SP", connection);
                command.CommandType = CommandType.StoredProcedure;
                command.Parameters.AddWithValue("@Id", id);
                SqlDataAdapter da = new SqlDataAdapter(command);
                DataSet ds = new DataSet();
                da.Fill(ds);
                connection.Close();

                if (ds.Tables[0].Rows.Count == 0)
                {
                    response.Success = false;
                    response.Message = "Employee not found.";
                    response.Data = null;
                    return response;
                }

                response.Success = true;
                response.Data =JsonConvert.SerializeObject(ds.Tables[0]);
                response.Message = "Employee retrieved.";
            }
            catch (Exception ex)
            {
                response.Success = false;
                response.Message = ex.Message;
            }
            return response;
        }

        public async Task<ResponseModel> AddEmployee(Employee employee)
        {
            ResponseModel response = new ResponseModel();
            try
            {
                SqlConnection connection = new SqlConnection(connectionString);
                await connection.OpenAsync();
                SqlCommand command = new SqlCommand("Employee_Add_SP", connection);
                command.CommandType = CommandType.StoredProcedure;
                command.Parameters.AddWithValue("@Name", employee.Name);
                command.Parameters.AddWithValue("@Email", employee.Email);
                command.Parameters.AddWithValue("@PhoneNumber", employee.Phone);
                command.Parameters.AddWithValue("@Address", employee.Address);
                command.Parameters.AddWithValue("@Position", employee.Position);
                command.Parameters.AddWithValue("@Department", employee.Department);
                command.Parameters.AddWithValue("@DateOfJoining", employee.JoiningDate);
                command.Parameters.AddWithValue("@Salary", employee.Salary);
                int result = await command.ExecuteNonQueryAsync();
                connection.Close();
                if (result > 0)
                {
                    response.Success = true;
                    response.Message = "Employee added successfully.";
                    response.Result = result;
                }
                else
                {
                    response.Success = false;
                    response.Message = "Failed to add employee.";
                }
            }
            catch (Exception ex)
            {
                response.Success = false;
                response.Message = ex.Message;
            }
            return response;
        }

        public async Task<ResponseModel> UpdateEmployee(Employee employee)
        {
            ResponseModel response = new ResponseModel();
            try
            {
                SqlConnection connection = new SqlConnection(connectionString);
                connection.Open();
                SqlCommand command = new SqlCommand("Employee_Update_SP", connection);
                command.CommandType = CommandType.StoredProcedure;
                command.Parameters.AddWithValue("@Id", employee.Id);
                command.Parameters.AddWithValue("@Name", employee.Name);
                command.Parameters.AddWithValue("@Email", employee.Email);
                command.Parameters.AddWithValue("@PhoneNumber", employee.Phone);
                command.Parameters.AddWithValue("@Address", employee.Address);
                command.Parameters.AddWithValue("@Position", employee.Position);
                command.Parameters.AddWithValue("@Department", employee.Department);
                command.Parameters.AddWithValue("@DateOfJoining", employee.JoiningDate);
                command.Parameters.AddWithValue("@Salary", employee.Salary);
                int result =await command.ExecuteNonQueryAsync();
                connection.Close();

                if (result > 0)
                {
                    response.Success = true;
                    response.Message = "Employee updated successfully.";
                    response.Result = result;
                }
                else
                {
                    response.Success = false;
                    response.Message = "Failed to update employee.";
                }
            }
            catch (Exception ex)
            {
                response.Success = false;
                response.Message = ex.Message;
            }
            return response;
        }

        public async Task<ResponseModel> DeleteEmployee(int id)
        {
            ResponseModel response = new ResponseModel();
            try
            {
                SqlConnection connection = new SqlConnection(connectionString);
                await connection.OpenAsync();
                SqlCommand command = new SqlCommand("Employee_Delete_SP", connection);
                command.CommandType = CommandType.StoredProcedure;
                command.Parameters.AddWithValue("@Id", id);
                int result =await command.ExecuteNonQueryAsync();
                connection.Close();

                if (result > 0)
                {
                    response.Success = true;
                    response.Message = "Employee deleted successfully.";
                    response.Result = result;
                }
                else
                {
                    response.Success = false;
                    response.Message = "Failed to delete employee.";
                }
            }
            catch (Exception ex)
            {
                response.Success = false;
                response.Message = ex.Message;
            }
            return response;

        }
    }
}