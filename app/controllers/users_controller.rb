class UsersController < ApplicationController
  def index
    @users = User.all
    add_data_to_response(@users)

    render json: @response
  end

  def create
    begin
      @user = User.create(
        name: params[:name],
        password: params[:password],
        room_id: params[:room_id]
      )
      @user.save!
      add_data_to_response(@user)

      render json: @response
    rescue
      add_errors_to_response(@user.errors.full_messages)

      render json: @response
    end
  end

  def destroy
    begin
      @user = User.find(params[:id])
      @user.destroy
      add_data_to_response(true)

      render json: @response
    rescue ActiveRecord::RecordNotFound => e
      add_errors_to_response([e])

      render json: @response
    end
  end

end
