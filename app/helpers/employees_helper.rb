module EmployeesHelper
  def pizza_name
    if current_user.admin == true
      "Dirk"
    else
      @employee.name
    end
  end
end
