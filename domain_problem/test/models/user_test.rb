require 'test_helper'

class UserTest < ActiveSupport::TestCase

  test "name is not empty" do  	
    @user = FactoryGirl.build(:user)
    @user.name = ''
    assert @user.invalid? 
    assert @user.errors.full_messages.include? "Name can't be blank"
  end

  test "email is not empty" do    
    @user = FactoryGirl.build(:user)
    @user.email = ''
    assert @user.invalid?
    assert @user.errors.full_messages.include? "Email can't be blank"
  end

  test "email is unique" do
    user_1 = FactoryGirl.build(:user, email: 'abc@abc.com')
    user_2 = FactoryGirl.build(:user, email: 'abc@abc.com')

    user_1.save
    user_2.save

    assert user_1.valid?
    assert user_2.invalid?
    puts user_2.errors.full_messages.to_s

    assert user_2.errors.full_messages.include? "Email has already been taken"
  end

  # test "valid name" do
  # end

  # test "valid email" do
  # end

  def teardown
  end

end
