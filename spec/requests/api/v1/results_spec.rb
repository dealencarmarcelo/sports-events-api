require 'rails_helper'

RSpec.describe 'Api::V1::Results', type: :request do
  let!(:user) { create(:user, :competitor) }
  let!(:one_hundred_meters_event) { create(:event, :current_one_hundred_meters) }
  let!(:javelin_throw_event) { create(:event, :current_javelin_throw) }

  let(:one_hundred_params) {
    {
      event_id: one_hundred_meters_event.id,
      user_id: user.id,
      unit: 'seconds',
      value: 10.5
    }
  }

  let(:javelin_throw_params) {
    {
      event_id: javelin_throw_event.id,
      user_id: user.id,
      unit: 'meters',
      value: 50.0
    }
  }

  describe 'GET /index' do
    it 'renders a successful response' do
      create(:result, :one_hundred_meters)
      create(:result, :javelin_throw)

      get '/api/v1/results'

      expect(response).to be_successful
      expect(json['results'].size).to eq(Result.count)
    end
  end

  describe 'GET /show' do
    context 'one hundred meters result' do
      it 'renders a successful result response' do
        result = create(:result, :one_hundred_meters)

        get "/api/v1/results/#{result.id}"

        expect(response).to be_successful
        expect(json['id']).to eq(result.id)
      end
    end

    context 'one javelin throw result' do
      it 'renders a successful result response' do
        result = create(:result, :javelin_throw)

        get "/api/v1/results/#{result.id}"

        expect(response).to be_successful
        expect(json['id']).to eq(result.id)
      end
    end
  end

  describe 'POST /create' do
    context 'one hundred meters result' do
      it 'renders a successful result response' do
        post '/api/v1/results', params: { result: one_hundred_params }

        expect(response).to be_successful
      end
    end

    context 'javelin throw result' do
      it 'renders a successful result response' do
        post '/api/v1/results', params: { result: javelin_throw_params }

        expect(response).to be_successful
      end
    end
  end
end
