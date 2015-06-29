require('sinatra')
require('sinatra/reloader')
require("sinatra/activerecord")
require("./lib/company")
require("./lib/manager")
require("./lib/employee")

enable :sessions


set :bind, '0.0.0.0'

get("/") do  
  erb(:index) 
end

get("/log_in") do
  erb(:login)
end

get("/sign_up") do
  erb(:sign_up)
end

post("/signup_employee_done") do
  employee_firstname = params.fetch("firstname")
  employee_lastname = params.fetch("lastname")
  employee_email = params.fetch("email")
  employee_username = params.fetch("username")
  employee_password = params.fetch("password")
  
  @new_employee = Employee.new({:firstname => employee_firstname, :lastname => employee_lastname, :email => employee_email, :username => employee_username, :password => employee_password})
  
  
  if @new_employee.save()
    redirect("/log_in")
  else
    erb(:errors)
  end
  
end

post("/signup_manager_done") do
  
  company_name = params.fetch("company_name")
  
  manager_firstname = params.fetch("firstname")
  manager_lastname = params.fetch("lastname")
  manager_email = params.fetch("email")
  manager_username = params.fetch("username")
  manager_password = params.fetch("password")
  
  new_company = Company.create({:company_name => company_name})
  
  new_manager = Manager.create({:firstname => manager_firstname, :lastname => manager_lastname, :email => manager_email, :username => manager_username, :password => manager_password, :company_id => new_company.id})
  
  
  
  redirect("/log_in")
  
end

post("/login_employee_done") do
  view_to_show = nil
  employee_username = params.fetch("username")
  employee_password = params.fetch("password")
  if Manager.exists?(:username => employee_username)
    employee = Manager.find_by username: employee_username 
    if employee.password.==(employee_password)
      view_to_show = :app
    else
      redirect("/log_in")
    end

  elsif Employee.exists?(:username => employee_username)
   employee = Employee.find_by username: employee_username 
    if employee.password.==(employee_password)
      view_to_show = :app
    else
      redirect("/log_in")
    end
  else
    redirect("/log_in")
  end  
  erb(view_to_show)
end