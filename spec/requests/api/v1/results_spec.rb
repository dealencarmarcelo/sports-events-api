require 'rails_helper'

RSpec.describe 'Api::V1::Results', type: :request do
  before do
    @current_user = create(:user, :admin)
  end

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
    it 'renders a successful one_hundred_meters event response' do
      create(:users_event, user_id: user.id, event_id: one_hundred_meters_event.id)
      create(:result, :one_hundred_meters, user_id: user.id, event_id: one_hundred_meters_event.id)

      get "/api/v1/events/#{one_hundred_meters_event.id}/results", headers: authenticate_user(@current_user)

      expect(response).to be_successful
      expect(json.size).to eq(Result.count)
    end

    it 'renders a successful javelin_throw event response' do
      create(:users_event, user_id: user.id, event_id: javelin_throw_event.id)
      create(:result, :javelin_throw, user_id: user.id, event_id: javelin_throw_event.id)

      get "/api/v1/events/#{javelin_throw_event.id}/results", headers: authenticate_user(@current_user)

      expect(response).to be_successful
      expect(json.size).to eq(Result.count)
    end

    it 'renders error with invalid credentials' do
      create(:users_event, user_id: user.id, event_id: javelin_throw_event.id)
      create(:result, :javelin_throw, user_id: user.id, event_id: javelin_throw_event.id)

      get "/api/v1/events/#{javelin_throw_event.id}/results"
      
      expect(response).to_not be_successful
    end
  end

  describe 'GET /show' do
    context 'one hundred meters result' do
      it 'renders a successful result response' do
        create(:users_event, user_id: user.id, event_id: one_hundred_meters_event.id)
        result = create(:result, :one_hundred_meters, user_id: user.id, event_id: one_hundred_meters_event.id)

        get "/api/v1/events/#{one_hundred_meters_event.id}/results/#{result.id}", headers: authenticate_user(@current_user)

        expect(response).to be_successful
        expect(json['id']).to eq(result.id)
      end
    end

    context 'one javelin throw result' do
      it 'renders a successful result response' do
        create(:users_event, user_id: user.id, event_id: javelin_throw_event.id)
        result = create(:result, :javelin_throw, user_id: user.id, event_id: javelin_throw_event.id)

        get "/api/v1/events/#{javelin_throw_event.id}/results/#{result.id}", headers: authenticate_user(@current_user)

        expect(response).to be_successful
        expect(json['id']).to eq(result.id)
      end
    end
  end

  describe 'POST /create' do
    context 'one hundred meters result' do
      it 'renders a successful result response' do
        create(:users_event, user_id: user.id, event_id: one_hundred_meters_event.id)
        post "/api/v1/events/#{one_hundred_meters_event.id}/results", params: { result: one_hundred_params },
                                                                      headers: authenticate_user(@current_user)

        expect(response).to be_successful
      end
    end

    context 'javelin throw result' do
      it 'renders a successful result response' do
        create(:users_event, user_id: user.id, event_id: javelin_throw_event.id)
        post "/api/v1/events/#{javelin_throw_event.id}/results", params: { result: javelin_throw_params },
                                                                 headers: authenticate_user(@current_user)

        expect(response).to be_successful
      end
    end

    context 'return error with invalid params' do
      it 'renders a successful result response' do
        create(:users_event, user_id: user.id, event_id: javelin_throw_event.id)
        javelin_throw_params[:unit] = 'cm'
        post "/api/v1/events/#{javelin_throw_event.id}/results", params: { result: javelin_throw_params },
                                                                 headers: authenticate_user(@current_user)

        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end
end
