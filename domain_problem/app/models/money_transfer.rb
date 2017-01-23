class MoneyTransfer
	include ActiveModel::Validations

	def initialize(params)
		@account_origin = params[:origin]
		@account_destination = params[:destination]
	end

	def transfer(amount)
		if (@account_origin.balance - amount) < 0
			self.errors[:base] << I18n.t("activemodel.models.money_transfer.errors.messages.no_funds_in_origin_account")
		else
			@account_origin.balance = @account_origin.balance - amount
			@account_destination.balance = @account_destination.balance + amount
		end
	end
end