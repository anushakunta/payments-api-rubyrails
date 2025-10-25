Rails.application.routes.draw do
  post 'transactions/authorize', to: 'transactions#authorize_payment'
  post 'transactions/:id/capture', to: 'transactions#capture_payment'
  post 'transactions/:id/refund', to: 'transactions#refund_payment'
  get 'transactions/:id', to: 'transactions#show'
end
