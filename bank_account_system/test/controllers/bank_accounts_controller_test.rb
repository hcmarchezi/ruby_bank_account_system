require 'test_helper'

class BankAccountsControllerTest < ActionDispatch::IntegrationTest

  ## Bank account balance
  test "should get balance for a valid account id" do
  	account_id = FactoryGirl.create(:account, balance: 25, user: FactoryGirl.create(:user))

    get bank_account_balance_url(account_id)

    assert_response :success
    json = JSON.parse(response.body)
    assert json["balance"] == 25
  end

  test "should get error if a problem happens in current account balance" do
  	account_id = 99999
  	
  	get bank_account_balance_url(account_id)

  	assert_response :bad_request
  	json = JSON.parse(response.body)
  	assert json.key? "error" 
  end

  ## Money transfer
  test "should transfer money between 2 valid account ids" do
  	origin_account_id = FactoryGirl.create(:account, balance: 25, user: FactoryGirl.create(:user))
  	destination_account_id = FactoryGirl.create(:account, balance: 25, user: FactoryGirl.create(:user))

    get money_transfer_url(origin_account_id, destination_account_id) + "?amount=10"

    assert_response :success
  end

  test "should get error if a problem happens in money transfer" do
  	get money_transfer_url(22222,33333) + "?amount=20"

  	assert_response :bad_request
  	json = JSON.parse(response.body)
  	assert json.key? "error"
  end

end
