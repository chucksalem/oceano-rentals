module Admin
  class DashboardController < ApplicationController
    http_basic_authenticate_with name: Rails.application.credentials.admin[:username], password: Rails.application.credentials.admin[:password]

    def index
    end
  end
end
