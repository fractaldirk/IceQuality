class CommentsController < ApplicationController
  def create
    @employee = Employee.find(params[:employee_id])
    @comment = @employee.comments.create(params[:comment])
    redirect_to communication_employee_path(@employee)
  end

 def destroy
    @employee = Employee.find(params[:employee_id])
    @comment = @employee.comments.find(params[:id])
    @comment.destroy
    redirect_to communication_employee_path(@employee)
  end
end
