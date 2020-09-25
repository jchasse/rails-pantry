class SessionsController < ApplicationController

  before_action :redirect_if_logged_in, except: [:destroy]

  def new
    # @errors = []
    # @user = User.new
  end

  def create
    @user = User.find_by(username: params[:user][:username])
    if @user && @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      redirect_to items_path
    else
      @errors = ["Username or password incorrect"]
      render :new
    end
  end

  def destroy
    session.clear
    redirect_to '/'
  end

  def create_with_fb
    user = User.find_or_create_by(username: auth["email"]) do |u|
        u.password = 'password'
    end
    user.save
    session[:user_id] = user.id

    redirect_to items_path
  end

  private

  def auth
    request.env['omniauth.auth']["info"]
  end

end
