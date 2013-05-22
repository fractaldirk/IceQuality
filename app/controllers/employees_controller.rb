class EmployeesController < ApplicationController
  before_filter :authenticate_user!
  before_filter :admin!, only: [:new, :edit, :create, :manage]

  # GET /employees
  # GET /employees.json
  def index
    if current_user.admin == true
      redirect_to manage_path
    else
      redirect_to "/employees/#{current_user.level.to_s}"
    end
  end

  # GET /employees/1
  # GET /employees/1.json
  def show
    @employee = Employee.find(params[:id])
    @latest_comments = @employee.comments.find(:all, :order => "created_at DESC", :limit => 5)

    unless current_user.admin == true
      unless current_user.level == @employee.id
        redirect_to employees_path
      else
        respond_to do |format|
          format.html # show.html.erb
          format.json { render json: @employee }
        end
      end
    end
  end

  def instructions
    @employee = Employee.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @employee }
    end
  end

  def communication
    @employee = Employee.find(params[:id])
    @ordered_comments = @employee.comments.order("created_at DESC")

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @employee }
    end
  end

  # GET /employees/new
  # GET /employees/new.json
  def new
    @employee = Employee.new

    1.times { @employee.descriptions.build }

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @employee }
    end
  end

  # GET /employees/1/edit
  def edit
    @employee = Employee.find(params[:id])
  end

  # POST /employees
  # POST /employees.json
  def create
    @employee = Employee.new(params[:employee])

    respond_to do |format|
      if @employee.save
        format.html { redirect_to @employee, notice: 'Employee was successfully created.' }
        format.json { render json: @employee, status: :created, location: @employee }
      else
        format.html { render action: "new" }
        format.json { render json: @employee.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /employees/1
  # PUT /employees/1.json
  def update
    @employee = Employee.find(params[:id])

    respond_to do |format|
      if @employee.update_attributes(params[:employee])
        format.html { redirect_to @employee, notice: 'Employee was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @employee.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /employees/1
  # DELETE /employees/1.json
  def destroy
    @employee = Employee.find(params[:id])
    @employee.destroy

    respond_to do |format|
      format.html { redirect_to employees_url }
      format.json { head :no_content }
    end
  end

  def manage
    @employees = Employee.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @employees }
    end
  end

  def pdf
    instructions = File.join(Rails.root, "tmp/instructions.pdf")
    send_file(instructions, :filename => "instructions.pdf", :type => "application/pdf")
  end

  def contact
    @employee = Employee.find(params[:id])
  end
end
