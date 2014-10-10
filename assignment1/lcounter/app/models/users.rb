class UserValidator < ActiveModel::Validator
  def validate(record)
    if not record.username.length.in? 5..20
  record.errors[:base] << '-1'
  # record.errors[:code] << '1'
  elsif not record.password.length.in? 8..20
  record.errors[:base] << '-2'
  # elsif record.username.present?
  #   record.errors[:base] << "-3"
end
end
end

class User < ActiveRecord::Base
  validates_with UserValidator
end