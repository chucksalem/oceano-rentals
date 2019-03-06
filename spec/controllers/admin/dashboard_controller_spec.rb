# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Admin::DashboardController do
  describe 'GET #index' do
    before { http_login }

    it 'returns http success' do
      get :index

      expect(response).to have_http_status(:success)
    end
  end
end
