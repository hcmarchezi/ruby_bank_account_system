class InexistentAccountError < StandardError
  def initialize
  	super(I18n.t "use_cases.errors.messages.current_balance.inexistent_account_error")
  end
end