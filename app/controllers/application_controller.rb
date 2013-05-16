class ApplicationController < ActionController::Base
  protect_from_forgery
  def admin!
    redirect_to "/", error: 'You dont have enough permissions to be here' unless current_user.admin == true
  end
end
