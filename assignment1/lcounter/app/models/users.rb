class UsersValidator < ActiveModel::Validator
  def validate(record)
    if not record.username.length.in? 5..20
      record.errors[:error_code] << '-1'
    elsif not record.password.length.in? 8..20
      record.errors[:error_code] << '-2'
    elsif not Users.find_by(username: record.username).nil?
      record.errors[:error_code] << '-3'
    end
  end
end

class Users < ActiveRecord::Base
  validates_with UsersValidator
  def self.login(params)
    # Update db to increment count and return the value
    @user = Users.find_by(:username => params[:username],
                          :password => params[:password])
    if @user
      @user.update_attribute("count", @user.count + 1);
      response = { :user_name => @user.username, :login_count => @user.count }
    else
      response = { :error_code => '-4'}
    end
    return response
  end
  def self.signup(params)
    user = Users.new(:username => params[:username],
                     :password => params[:password])
    if user.save
      response = { :user_name => user.username, :login_count => user.count }
    else
      response = { :error_code => user.errors[:error_code] }
    end
    return response  end
  def self.clear
    Users.delete_all
  end
end
