require 'test_helper'

class AccountTest < ActiveSupport::TestCase

  test "balance can be zero" do
    @account = FactoryGirl.build(:account)
    @account.user = FactoryGirl.build(:user)

    @account.balance = 0
    @account.save

    assert @account.valid?
  end

  test "balance can be positive" do
    @account = FactoryGirl.build(:account)
    @account.user = FactoryGirl.build(:user)

    @account.balance = 10
    @account.save

    assert @account.valid?
  end

  test "balance can't be negative" do
    @account = FactoryGirl.build(:account)
    @account.user = FactoryGirl.build(:user)

    @account.balance = -10
    @account.save
    
    assert @account.invalid?
    assert @account.errors.full_messages.include? "Balance " + I18n.t("errors.messages.greater_than_or_equal_to", count: 0)
  end

end
