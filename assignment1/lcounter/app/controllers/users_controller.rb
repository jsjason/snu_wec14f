class UsersController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
  end
  def create
    if params[:login]
      Users.login(params)
    elsif params[:register]
      @response = Users.signup(params)
    end
    respond_to do |format|
      format.json { render json: @response }
    end
  end
  def login
    @response = Users.login(params)
    respond_to do |format|
      format.json { render json: @response }
    end
  end
  def logout
    respond_to do |format|
      format.js
    end
    # session[:username] = nil
    # session[:login_count] = nil
  end
  def clear
    Users.clear()
    redirect_to(root_url)
  end
end