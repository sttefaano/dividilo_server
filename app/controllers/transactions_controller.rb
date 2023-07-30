class TransactionsController < ApplicationController
  def index
    @transactions = Transaction.all
    add_data_to_response(@transactions)

    render json: @response
  end

  def create
    begin
      @transaction = Transaction.create(
        amount: params[:amount],
        description: params[:description],
        user_id: params[:user_id],
        room_id: User.find(params[:user_id]).room.id # should be using param to down the requests made (save in client room_id)
      )
      @transaction.save!
      add_data_to_response(@transaction)

      render json: @response
    rescue StandardError => e
      add_errors_to_response([e])

      render json: @response
    end
  end

  def destroy
    begin
      @transaction = Transaction.find(params[:id])
      @transaction.destroy
      add_data_to_response(true)

      render json: @response
    rescue ActiveRecord::RecordNotFound => e
      add_errors_to_response([e])

      render json: @response
    end
  end

end
