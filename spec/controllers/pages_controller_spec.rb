# frozen_string_literal: true

require 'rails_helper'

RSpec.describe PagesController do
  describe 'GET #resources' do
    it 'returns http success' do
      get :resources

      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET #maps' do
    it 'returns http success' do
      get :maps

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
    let(:params) do
      { firstname: Faker::Name.first_name,
        lastname: Faker::Name.last_name,
        email: Faker::Internet.email,
        phone: Faker::PhoneNumber.cell_phone_with_country_code,
        message: Faker::Lorem.sentence
      }
    end

    it 'returns http success' do
      post :contact_thank_you, params: params

      expect(response).to have_http_status(:success)
    end
  end
end
