require 'rails_helper'

RSpec.describe 'Api::V1::Auth', type: :request do
  before do
    @user = FactoryBot.create(:user)

    password = Faker::Alphanumeric.alphanumeric(number: 8)
    @params = {
      first_name: Faker::Name.first_name,
      last_name: Faker::Name.last_name,
      email: Faker::Internet.email,
      username: Faker::Internet.username,
      age: Faker::Number.between(from: 18, to: 60),
      role: 'admin',
      password: password,
      password_confirmation: password
    }
  end

  describe 'POST /signin' do
    context 'with valid params' do
      it 'returns success' do
        post '/api/v1/auth/signin', params: { email: @user.email, password: @user.password }
        expect(response).to have_http_status(:success)
      end
    end
    context 'with invalid params' do
      it 'returns unprocessable_entity on an invalid email' do
        post '/api/v1/auth/signin', params: { email: Faker::Internet.email, password: @user.password }
        expect(response).to have_http_status(:unauthorized)
      end
      it 'returns unprocessable_entity on an invalid password' do
        post '/api/v1/auth/signin', params: { email: @user.email, password: Faker::Internet.password }
        expect(response).to have_http_status(:unauthorized)
      end
    end
  end

  describe 'POST /signup' do
    context 'with valid params'do
      it 'returns success' do
        post '/api/v1/auth/signup', params: @params
        expect(response).to have_http_status(:success)
      end
    end
  end
end
