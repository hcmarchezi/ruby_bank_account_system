class MoneyTransferUseCase
	def initialize(params)
		# Retrieve participating objects and parameters
		@origin_account_id = params[:origin_account_id]		
		@destination_account_id = params[:destination_account_id]
		@amount = params[:amount]		
	end

	def money_transfer=(money_transfer)
		@money_transfer = money_transfer
	end

	def execute
		# Check origin account
		origin_account = Account.find_by_id @origin_account_id
		raise InexistentOriginAccountError if origin_account.nil?

		# Check destination account
		destination_account = Account.find_by_id @destination_account_id
		raise InexistentDestinationAccountError if destination_account.nil?

		# use case implementation
		if @money_transfer.nil?
			@money_transfer = MoneyTransfer.new(origin: origin_account, destination: destination_account)
		end
		@money_transfer.transfer(@amount)
		origin_account.save
		destination_account.save
	end
end