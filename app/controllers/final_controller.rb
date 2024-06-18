class FinalController < ApplicationController
  def index
  end

  def new
  end

  def create
    @user = Admin.new(username: params["uname"], 
                    password: params["pword"], 
                    firstname: params["fname"], 
                    middlename: params["mname"], 
                    lastname: params["lname"])
    @user.save
    
    redirect_to "/admin/login"
  end

  def dash
   @users = Tao.all
  end

  def log
  end

  def login
    @user = Admin.find_by(username: params["user"],
                          password: params["pass"])
    if @user
      redirect_to "/admin/dash"
    else
      redirect_to "/admin/login"
    end
  end

  def approve
    reg = Tao.find(params[:id])

    if room_reserved?(reg.room_type)
      flash[:alert] = "ROOM IS RESERVED"
    else
      app = Approved.new(firstname: reg.firstname,
                       middlename: reg.middlename,
                       lastname: reg.lastname,
                       email: reg.email,
                       contact: reg.contact,
                       room_type: reg.room_type,
                       check_in: reg.check_in,
                       check_out: reg.check_out)
      app.save

      room = Room.find_by(room_type: reg.room_type)
      room.update(status: 'Reserved') if room

      flash[:notice] = "Reservation Approved"
    end
    
    reg.destroy

    redirect_to "/admin/dash"
  end

  def reject
    @user = Tao.delete(params[:id])

    redirect_to "/admin/dash"
  end

  def approved
    @approved = Approved.all
  end

  def rooms
    @rooms = Room.all
  end

  def nroom
  end

  def history
    @history = History.all
  end

  def nrooms
    @room = Room.new(room_type: params["rom"], description: params["desc"], price: params["price"])
    @room.save

    redirect_to "/admin/rooms"
  end

  def remove_reservation
    user = Approved.find(params[:id])
    his = History.new(firstname: user.firstname,
                       middlename: user.middlename,
                       lastname: user.lastname,
                       email: user.email,
                       contact: user.contact,
                       room_type: user.room_type,
                       check_in: user.check_in,
                       check_out: user.check_out)
    his.save
    
    room = Room.find_by(room_type: user.room_type)
    room.update(status: 'Available') if room

    user.destroy

    redirect_to "/admin/approved"
  end

end

private

def room_reserved?(room_type)
  Room.exists?(room_type: room_type, status: 'Reserved')
end