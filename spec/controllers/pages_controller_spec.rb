# frozen_string_literal: true

require 'rails_helper'

RSpec.describe PagesController do
  describe 'GET #resources' do
    it 'returns http success' do
      get :resources

      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET #contact' do
    it 'returns http success' do
      get :contact

      expect(response).to have_http_status(:success)
    end
  end

  describe 'POST #contact_thank_you' do
    it 'returns http success' do
      # pending
    end
  end
end
