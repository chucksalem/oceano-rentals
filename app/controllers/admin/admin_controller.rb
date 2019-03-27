# frozen_string_literal: true

module Admin
  class AdminController < ApplicationController
    http_basic_authenticate_with name: Rails.application.credentials.admin[:username], password: Rails.application.credentials.admin[:password]

    layout 'admin'
  end
end
