class BankAccountsController < ApplicationController
  def balance
  	balance = CurrentBalanceUseCase.new(account_id: params[:id]).execute
  	render json: { balance: balance.to_f }, status: :ok
  rescue StandardError => exception
  	render json: { error: exception.message }, status: :bad_request
  end

  def money_transfer
  	origin_id = params[:origin_id]
  	destination_id = params[:destination_id]
  	amount = params[:amount].to_d

  	money_transfer = MoneyTransferUseCase.new(
  			origin_account_id: origin_id, 
  			destination_account_id: destination_id, 
  			amount: amount)
  	money_transfer.execute

  	render json: { }, status: :ok

  rescue StandardError => exception
  	render json: { error: exception.message }, status: :bad_request
  end
end
