require 'test_helper'

class CurrentBalanceUseCaseTest < ActiveSupport::TestCase

  test "check current balance from a bank account" do 
    account_id = FactoryGirl.create(:account, balance: 100, 
                                    user: FactoryGirl.create(:user)).id

    current_balance_use_case = CurrentBalanceUseCase.new(account_id: account_id)

    assert current_balance_use_case.execute == 100
  end

  test "check current balance from inexistent bank account raises an error" do
    account_id = 99999

    current_balance_use_case = CurrentBalanceUseCase.new(account_id: account_id)

    assert_raises(InexistentAccountError) { current_balance_use_case.execute }
  end

  test "check current balance from nil bank account id raises an error" do
    account_id = nil

    current_balance_use_case = CurrentBalanceUseCase.new(account_id: account_id)

    assert_raises(InexistentAccountError) { current_balance_use_case.execute }
  end

end