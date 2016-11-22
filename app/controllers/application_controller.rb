class ApplicationController < ActionController::API
  include ActionController::HttpAuthentication::Token::ControllerMethods

  respond_to :json

  private

  def render_json_api_errors(object)
    render json:       object,
           status:     :unprocessable_entity,
           adapter:    :json_api,
           serializer: ActiveModel::Serializer::ErrorSerializer
  end
end
