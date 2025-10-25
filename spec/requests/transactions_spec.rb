require 'rails_helper'

RSpec.describe "Transactions API", type: :request do
  describe "POST /transactions/authorize" do
    it "creates a new authorized transaction" do
      post "/transactions/authorize", params: { amount: 100, currency: 'USD' }
      expect(response).to have_http_status(:created)
    end
  end
end
