    const EmployeeModal = new bootstrap.Modal(document.getElementById('EmployeeModal'));
$(document).ready(function () {
    $("#employeeTable").DataTable();
    GetAllEmployee();
    
    //EmployeeModal.show();
}
);

function cleardata() {
    $('#empId').val('');
    $('#empName').val('');
    $('#empEmail').val('');
    $('#empPhone').val('');
    $('#empDepartment').val('');
    $('#empSalary').val('');
    $('#empAddress').val('');
    $('#PhoneNumber').val('');
    $('#empPosition').val('');
    $('#empDateOfJoining').val('');
    $("#empid").prop('disabled', false);
}
function editemployee(empid) {
    $.ajax({
        type: "GET",
        url: "employee/getemployeebyid",
        dataType: "json",
        contentType: 'application/json',
        data: { id: empid },
        success: function (data) {
            var data = JSON.parse(data.Data)[0];
            EmployeeModal.show();
            $("#empId").val(data.Id);   
            $("#empName").val(data.Name);   
            $("#empEmail").val(data.Email);
            $("#empPhone").val(data.PhoneNumber);
            $("#empDepartment").val(data.Department);
            $("#empPosition").val(data.Position);
            $("#empSalary").val(data.Salary);
            let htmlDate = data.DateOfJoining.split("T")[0];
            $("#empDateOfJoining").val(htmlDate);
            $("#empAddress").val(data.Address);
            $("#empid").prop('disabled', true);
            //$("#btnSave").text("Update Employee");
            //$("#btnSave").attr("onclick", "UpdateEmployee()");
        },
        error: function (xhr, status, error) {
            console.error("Error fetching employees:", error);
        }
    });
}
function CreatedEmployee() {
    var obj = {
        Id: $("#empId").val(),
        Name: $("#empName").val(),
        Email: $("#empEmail").val(),
        Phone: $("#empPhone").val(),
        Department: $("#empDepartment").val(),
        Position: $("#empPosition").val(),
        Salary: $("#empSalary").val(),
        JoiningDate: $("#empDateOfJoining").val(),
        Address: $("#empAddress").val()
    }

    $.ajax({
        type: "POST",
        url: "employee/addemployee",
        dataType: "json",
        contentType: 'application/json',
        data: JSON.stringify(obj),
        success: function (data) {
            debugger
            if (data.Success) {
                alert("Employee created successfully!");
                EmployeeModal.hide();
                GetAllEmployee();

            }
            else {
                alert("Error creating employee: " + data.Message);
            }
        },
        error: function (xhr, status, error) {
            console.error("Error fetching employees:", error);
        }
    });

}
function UpdateEmployee() {
    var obj = {
        Id: $("#empId").val(),
        Name: $("#empName").val(),
        Email: $("#empEmail").val(),
        Phone: $("#empPhone").val(),
        Department: $("#empDepartment").val(),
        Position: $("#empPosition").val(),
        Salary: $("#empSalary").val(),
        JoiningDate: $("#empDateOfJoining").val(),
        Address: $("#empAddress").val()
    }

    $.ajax({
        type: "POST",
        url: "employee/updateemployee",
        dataType: "json",
        contentType: 'application/json',
        data: JSON.stringify(obj),
        success: function (data) {
            debugger
            if (data.Success) {
                alert("Employee updated successfully!");
                EmployeeModal.hide();
                GetAllEmployee();

            }
            else {
                alert("Error updating employee: " + data.Message);
            }
        },
        error: function (xhr, status, error) {
            console.error("Error fetching employees:", error);
        }
    });

}
function SaveEmployee() {
    

    if ($("#empId").val() == "") {
        CreatedEmployee();
    }
    else {
        UpdateEmployee();
    }
}   
function AddEmployee() {
    cleardata();
    EmployeeModal.show();
}
function DeleteEmployee(empid) {
    if (confirm("Are you sure?") == true) {
        $.ajax({
            type: "GET",
            url: "employee/deleteemployee",
            dataType: "json",
            contentType: 'application/json',
            data: { id: empid },
            success: function (data) {

                if (data.Success) {
                    alert("Employee deleted successfully!");
                    EmployeeModal.hide();
                    GetAllEmployee();
                }
                else {
                    alert(data.Message);
                }
            },
            error: function (xhr, status, error) {
                console.error("Error deleting employees:", error);
            }
        });
    }
}

function GetAllEmployee() {
        $.ajax({
            type: "GET",
            url: "employee/getalldata",
            dataType: "json",
            contentType: 'application/json',
            success: function (data) {

                var table = $("#employeeTable").DataTable();
                table.clear().draw();
                var data = JSON.parse(data.OutData[0]);
                $.each(data, function (index, employee) {
                    table.row.add([
                        employee.Name,
                        employee.Email,
                        employee.PhoneNumber,
                        employee.Position,
                        employee.Salary,
                        employee.DateOfJoining,
                        `<button class="btn btn-sm btn-primary edit-btn" onclick=editemployee("${employee.Id}")>Edit</button>
         <button class="btn btn-sm btn-danger delete-btn" onclick=DeleteEmployee("${employee.Id}")>Delete</button>`
                    ]).draw();
                });
            },
            error: function (xhr, status, error) {
                console.error("Error fetching employees:", error);
            }
        });
}