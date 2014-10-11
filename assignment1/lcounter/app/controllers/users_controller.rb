class UsersController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    @new_user = Users.new
  end
  def create
    @response = Users.signup(params)
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
  def clear
    Users.clear()
    redirect_to(root_url)
  end
end