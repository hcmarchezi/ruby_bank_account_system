class CurrentBalanceUseCase
  def initialize(params)
    @account_id = params[:account_id]
  end

  def execute
    account = Account.find_by_id(@account_id)
    raise InexistentAccountError if account.nil?
    account.balance
  end
end




