class UserController < ApplicationController
  def index
    @users = Tao.all
  end

  def new
    @rooms = Room.find(params[:id])
  end

  def create
    @user = Tao.new(firstname: params["fname"], 
                    middlename: params["mname"], 
                    lastname: params["lname"], 
                    email: params["email"], 
                    contact: params["cont"],
                    check_in: params["check_in"],
                    check_out: params["check_out"],
                    room_type: params["room_type"],
                    status: 'Pending')
    @user.save
    
    redirect_to "/user/main"
  end

  def book
    @rooms = Room.all
  end
end
