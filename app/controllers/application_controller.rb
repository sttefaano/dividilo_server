class ApplicationController < ActionController::API
  before_action :build_response

  private

  def build_response
    @response = {
      data: {},
      errors: {}
    }
  end

  def add_data_to_response(data)
    @response[:data] = data
  end

  def add_errors_to_response(errors)
    @response[:errors] = errors
  end
end
