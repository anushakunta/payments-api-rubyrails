class TransactionsController < ApplicationController
  before_action :set_transaction, only: [:capture_payment, :refund_payment, :show]

  def authorize_payment
    transaction = Transaction.create(transaction_params.merge(status: :authorized))
    if transaction.persisted?
      render json: transaction, status: :created
    else
      render json: { errors: transaction.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def capture_payment
    if @transaction.authorized?
      @transaction.update(status: :captured)
      render json: @transaction, status: :ok
    else
      render json: { error: 'Only authorized transactions can be captured.' }, status: :unprocessable_entity
    end
  end

  def refund_payment
    if @transaction.captured?
      @transaction.update(status: :refunded)
      render json: @transaction, status: :ok
    else
      render json: { error: 'Only captured transactions can be refunded.' }, status: :unprocessable_entity
    end
  end

  def show
    render json: @transaction
  end

  private

  def set_transaction
    @transaction = Transaction.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    render json: { error: 'Transaction not found.' }, status: :not_found
  end

  def transaction_params
    params.permit(:amount, :currency)
  end
end
