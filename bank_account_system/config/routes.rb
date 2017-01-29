Rails.application.routes.draw do
  get 'bank_accounts/:id/balance', to: 'bank_accounts#balance', as: 'bank_account_balance'
  get 'bank_accounts/:origin_id/money_transfer/:destination_id', to: 'bank_accounts#money_transfer', as: 'money_transfer'
end
