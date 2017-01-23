require 'test_helper'

class MoneyTransferServiceTest < ActiveSupport::TestCase

    # test "execute money transfer for valid origin and destination account ids" do
    #   origin_account_id = FactoryGirl.create(:account, balance: 100, user: FactoryGirl.create(:user)).id
    #   destination_account_id = FactoryGirl.create(:account, balance: 30,  user: FactoryGirl.create(:user)).id

    #   MoneyTransferService.new.transfer(origin_account_id: origin_account_id, destination_account_id: destination_account_id, amount: 50)

    #   SHOULD IT BE A MOCK CALL TO MONEY TRANSFER ???
    #   assert Account.find_by_id(origin_account_id).balance == 50
    #   assert Account.find_by_id(destination_account_id).balance == 80
    # end

    # test "raise error when origin account id is inexistent" do
    # end

    # test "raise error when origin account id is nil" do
    # end

    # test "raise error when destination account id is inexistent" do
    # end

    # test "raise error when destination account id is nil" do
    # end

end