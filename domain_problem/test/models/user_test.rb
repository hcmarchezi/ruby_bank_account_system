require 'test_helper'

class UserTest < ActiveSupport::TestCase

  test "name is not empty" do  	
    @user = FactoryGirl.build(:user)
    @user.name = ''
    assert @user.invalid? 
    assert @user.errors.full_messages.include? "Name " +  I18n.t("errors.messages.blank") 
  end

  test "email is not empty" do    
    @user = FactoryGirl.build(:user)
    @user.email = ''
    assert @user.invalid?
    assert @user.errors.full_messages.include? "Email " + I18n.t("errors.messages.blank")
  end

  test "email is unique" do
    user_1 = FactoryGirl.build(:user, email: 'abc@abc.com')
    user_1.save
    user_2 = FactoryGirl.build(:user, email: 'abc@abc.com')
    user_2.save
    assert user_1.valid?
    assert user_2.invalid?
    assert user_2.errors.full_messages.include? "Email " + I18n.t("errors.messages.taken")
  end

  test "name with letters and spaces is valid" do
    @user = FactoryGirl.build(:user)
    @user.name = 'Walter Mercado'
    @user.save
    assert @user.valid? 
  end

  test "name with symbols is not valid" do
    @user = FactoryGirl.build(:user)
    @user.name = '###Pedro###'
    @user.save    
    assert @user.invalid?    
    assert @user.errors.full_messages.include? "Name " + I18n.t("errors.messages.invalid")
  end

  test "email is valid when properly formatted" do
    @user = FactoryGirl.build(:user)
    @user.email = "valid@email.com"
    @user.save
    assert @user.valid? 
  end

  test "email is invalid when improperly formatted" do
    @user = FactoryGirl.build(:user)
    @user.email = '123@!!!!.com'
    @user.save
    @user.invalid?
    assert @user.errors.full_messages.include? "Email " + I18n.t("errors.messages.invalid")
  end

end
