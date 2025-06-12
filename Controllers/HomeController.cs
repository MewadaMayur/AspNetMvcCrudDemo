using crud_framework_four_eight.Models;
using crud_framework_four_eight.Repo;
using Microsoft.Ajax.Utilities;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Threading.Tasks;
using System.Web.Mvc;

namespace crud_framework_four_eight.Controllers
{
    public class HomeController : Controller
    {
        private readonly IEmployeeServices _employeeServices;

        
        public HomeController(IEmployeeServices employeeServices)
        {
            _employeeServices = employeeServices;
        }
        public ActionResult Index()
        {
            return View();
        }

        [Route("employee/getalldata")]
        [HttpGet]
        public async Task<JsonResult> GetallEmployees()
        {
            ResponseModel res = new ResponseModel();
            res = await _employeeServices.GetAllEmployees();
            return Json(res, JsonRequestBehavior.AllowGet);
        }

        [Route("employee/addemployee")]
        [HttpPost]
        public async Task<JsonResult> CreateEmployee(Employee emp)
        {
            ResponseModel responseModel = new ResponseModel();
            if (emp == null)
            {
                emp = new Employee();
            }
            if (ModelState.IsValid)
            {
                responseModel = await _employeeServices.AddEmployee(emp);
                return Json(responseModel, JsonRequestBehavior.AllowGet);
            }
            else
            {
                var errors = ModelState.Values
                .SelectMany(v => v.Errors)
                .Select(e => e.ErrorMessage)
                .ToList();
                responseModel.Success = false;
                responseModel.Data = errors;
                responseModel.Message = "Invalid data.";
                return Json(responseModel, JsonRequestBehavior.AllowGet);
            }

        }

        [Route("employee/updateemployee")]
        [HttpPost]
        public async Task<JsonResult> UpdateEmployee(Employee emp)
        {
            ResponseModel responseModel = new ResponseModel();
            if (emp == null)
            {
                emp = new Employee();
            }
            if (ModelState.IsValid)
            {
                responseModel = await _employeeServices.UpdateEmployee(emp);
                return Json(responseModel, JsonRequestBehavior.AllowGet);
            }
            else
            {
                return Json(responseModel, JsonRequestBehavior.AllowGet);
            }
        }

        [Route("employee/deleteemployee")]
        [HttpGet]
        public async Task<JsonResult> DeleteEmployee(int id)
        {
            ResponseModel responseModel = new ResponseModel();
            if (id <= 0)
            {
                return Json(new { success = false, message = "Invalid employee ID." }, JsonRequestBehavior.AllowGet);
            }
            responseModel = await _employeeServices.DeleteEmployee(id);
            return Json(responseModel, JsonRequestBehavior.AllowGet);
        }


        [HttpGet]
        [Route("employee/getemployeebyid")]
        public async Task<JsonResult> GetEmployeeById(int id)
        {
            ResponseModel responseModel = new ResponseModel();
            responseModel = await _employeeServices.GetEmployeeById(id);
            if (responseModel.Success)
            {
                return Json(responseModel, JsonRequestBehavior.AllowGet);
            }
            else
            {
                return Json(responseModel, JsonRequestBehavior.AllowGet);
            }
        }
    }
}
