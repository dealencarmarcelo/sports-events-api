require 'rails_helper'

RSpec.describe 'Api::V1::Events', type: :request do
  let!(:organization) { create(:organization) }
  let!(:one_hundred_meters_sport) { create(:sport, :one_hundred_meters) }
  let!(:javelin_throw_sport) { create(:sport, :javelin_throw) }

  let(:one_hundred_params) {
    {
      name: 'One Hundred Event',
      organization_id: organization.id,
      sport_id: one_hundred_meters_sport.id,
      start_date: Date.today,
      end_date: Date.tomorrow
    }
  }

  let(:javelin_throw_params) {
    {
      name: 'Javelin Event',
      organization_id: organization.id,
      sport_id: javelin_throw_sport.id,
      start_date: Date.today,
      end_date: Date.tomorrow
    }
  }

  describe 'GET /index' do
    it 'renders a successful response' do
      create(:event, :current_one_hundred_meters)
      create(:event, :current_javelin_throw)

      get '/api/v1/events'

      expect(response).to be_successful
      expect(json.size).to eq(Event.count)
    end
  end

  describe 'GET /show' do
    context 'one hundred meters event' do
      it 'renders a successful event response' do
        event = create(:event, :current_one_hundred_meters)

        get "/api/v1/events/#{event.id}"

        expect(response).to be_successful
        expect(json['id']).to eq(event.id)
        expect(json['name']).to eq(event.name)
      end
    end

    context 'one javelin throw event' do
      it 'renders a successful event response' do
        event = create(:event, :current_javelin_throw)

        get "/api/v1/events/#{event.id}"

        expect(response).to be_successful
        expect(json['id']).to eq(event.id)
        expect(json['name']).to eq(event.name)
      end
    end
  end

  describe 'POST /create' do
    context 'one hundred meters event' do
      it 'renders a successful event response' do
        post '/api/v1/events', params: { event: one_hundred_params }

        expect(response).to be_successful
      end

      it 'renders a error with invalid start_date' do
        one_hundred_params[:start_date] = nil
        post '/api/v1/events', params: { event: one_hundred_params }

        expect(response).to_not be_successful
        expect(json['errors']['event']).to have_key('start_date')
      end
    end

    context 'javelin throw event' do
      it 'renders a successful event response' do
        post '/api/v1/events', params: { event: javelin_throw_params }

        expect(response).to be_successful
      end

      it 'renders a error with invalid start_date' do
        javelin_throw_params[:start_date] = nil
        post '/api/v1/events', params: { event: javelin_throw_params }

        expect(response).to_not be_successful
        expect(json['errors']['event']).to have_key('start_date')
      end
    end
  end

  describe 'UPDATE /update' do
    context 'one hundred meters event' do
      it 'renders a successful event response' do
        event = create(:event, :current_one_hundred_meters)
        put "/api/v1/events/#{event.id}", params: { event: { active: false } }

        expect(response).to be_successful
        expect(json['active']).to be false

        active_event_ids = Event.active.ids
        expect(active_event_ids).to_not include(event.id)
      end
    end

    context 'javelin throw event' do
      it 'renders a successful event response' do
        event = create(:event, :current_javelin_throw)
        put "/api/v1/events/#{event.id}", params: { event: { active: false } }

        expect(response).to be_successful
        expect(json['active']).to be false

        active_event_ids = Event.active.ids
        expect(active_event_ids).to_not include(event.id)
      end
    end
  end

  describe 'GET /ranking' do
    context ''
  end
end
