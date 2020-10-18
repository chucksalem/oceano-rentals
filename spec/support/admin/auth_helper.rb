module AuthHelper
  def http_login
    username = Rails.application.credentials.admin[:username]
    password = Rails.application.credentials.admin[:password]
    request.env['HTTP_AUTHORIZATION'] = ActionController::HttpAuthentication::Basic.encode_credentials(username, password)
  end
end
