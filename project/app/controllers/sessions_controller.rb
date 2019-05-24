class SessionsController < ApplicationController
  def new
    redirect_to new_user_session_path
  end

  def create
    # #complete this method
    # user = User.find_by(email: session_params[:email], password: session_params[:password])
    # if user.present?
    #   session[:user_id] = user.id
    #   flash[:notice] = 'Login Success'
    #   redirect_to profile_path(user.id)
    # else
    #   flash[:notice] = 'Login Failed'
    #   redirect_to root_path
    # end
  end

  def destroy
    # #complete this method
    # session.delete(:user_id)
    # @current_user = nil
    # redirect_to root_path
  end


  def session_params
    params.require(:session).permit(:email, :password)
  end
end
