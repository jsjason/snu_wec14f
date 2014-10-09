require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test 'valid username' do
    # TODO change the messages to be proper
    user1 = User.create(:username => '5_000', :password => 'proper_length')
    assert user1.valid?, "The name is too short or too long #{user1.errors}"
    user2 = User.create(:username => '20_00000000000000000', :password => 'proper_length')
    assert user2.valid?, "The name is too short or too long #{user2.errors}"

  end
  test 'invalid username' do
    user2 = User.create(:username => '4_00', :password => 'proper_length')
    assert_not user2.valid?, "The name is too short or too long #{user2.errors}"
    user3 = User.create(:username => '21_000000000000000000', :password => 'proper_length')
    assert_not user3.valid?, "The name is too short or too long #{user3.errors}"
  end
  test 'valid password' do
    user1 = User.create(:username => 'proper_length', :password => '8_000000')
    assert user1.valid?, "The password is too short or too long #{user1.errors}"
    user2 = User.create(:username => 'proper_length', :password => '20_00000000000000000')
    assert user2.valid?, "The password is too short or too long #{user2.errors}"
  end
  test 'invalid password' do
    user1 = User.create(:username => 'proper_length', :password => '7_00000')
    assert_not user1.valid?, "The password is too short or too long #{user1.errors}"
    user2 = User.create(:username => 'proper_length', :password => '21_000000000000000000')
    assert_not user2.valid?, "The password is too short or too long #{user2.errors}"
  end
end