require 'test_helper'

class MoneyTransferTest < ActiveSupport::TestCase

  test "money transfer from account with enough funds to another" do
    account_1 = FactoryGirl.create(:account, balance: 100, user: FactoryGirl.create(:user))
    account_2 = FactoryGirl.create(:account, balance:   0, user: FactoryGirl.create(:user))

    MoneyTransfer.new(origin: account_1, destination: account_2).transfer(80)

    assert account_1.balance == 20
    assert account_2.balance == 80
  end

  test "money transfer from account without enough funds to another" do
    account_1 = FactoryGirl.create(:account, balance: 10, user: FactoryGirl.create(:user))
    account_2 = FactoryGirl.create(:account, balance: 20, user: FactoryGirl.create(:user))

    money_transfer = MoneyTransfer.new(origin: account_1, destination: account_2)
    money_transfer.transfer(80)

    assert money_transfer.errors.full_messages.include?  I18n.t("activemodel.models.money_transfer.errors.messages.no_funds_in_origin_account")

    assert account_1.balance == 10
    assert account_2.balance == 20
  end

  # test "money transfer from unsaved account to another" do
  #   account_1 = FactoryGirl.build(:account, balance: 100, user: FactoryGirl.create(:user))
  #   account_2 = FactoryGirl.create(:account, balance: 20, user: FactoryGirl.create(:user))

  #   assert_error MoneyTransfer.transfer(origin: account_1, destination: account_2, amount: 80), "origin account is unsaved"

  #   assert account_1.balance 10
  #   assert account_2.balance 20
  # end

  # test "money transfer from account with funds to nil account" do
  #   account_1 = FactoryGirl.create(:account, balance: 100, user: FactoryGirl.create(:user))
  #   account_2 = nil

  #   assert_error MoneyTransfer.transfer(origin: account_1, destination: account_2, amount: 80), "destination account is nil"

  #   assert account_1.balance 10
  #   assert account_2.balance 20
  # end

  # test "money transfer from account with funds to unsaved account" do
  #   account_1 = FactoryGirl.create(:account, balance: 100, user: FactoryGirl.create(:user))
  #   account_2 = FactoryGirl.create(:account, balance: 20, user: FactoryGirl.create(:user))

  #   assert_error MoneyTransfer.transfer(origin: account_1, destination: account_2, amount: 80), "destination account is unsaved"

  #   assert account_1.balance 10
  #   assert account_2.balance 20
  # end

  # ### test wrong parameters sent

end
