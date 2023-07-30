class RoomsController < ApplicationController

  def index
    @rooms = Room.all
    add_data_to_response(@rooms)
    render json: @rooms
  end

  def create
    begin
      @room = Room.create(name: params[:name], password: params[:password])
      @room.save!
      add_data_to_response(@room)

      render json: @response
    rescue StandardError => e
      add_errors_to_response([e])

      render json: @response
    end
  end

  def show
    begin
      room = Room.find(params[:id]).attributes.slice('id', 'name').transform_keys(&:to_sym)
      @room = format_room(room)
      add_data_to_response(@room)

      render json: @response
    rescue ActiveRecord::RecordNotFound => e
      add_errors_to_response([e])

      render json: @response
    end
  end

  def update
  end

  def destroy
    begin
      @room = Room.find(params[:id])
      @room.destroy
      add_data_to_response(true)

      render json: @response
    rescue ActiveRecord::RecordNotFound => e
      add_errors_to_response([e])

      render json: @response
    end
  end

  private

  def format_room(room)
    users = User.where(room_id: room[:id]).pluck(:id, :name).map { |id, name| {id: id, name: name} }
    transactions = Transaction.where(user_id: users.map { |user| user[:id] })
    users = users.map { |user| user.merge!(transactions: transactions) }
    room.merge!(users: users)
  end
end
