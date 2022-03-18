require 'rails_helper'

RSpec.describe Result, type: :model do
  describe 'validate max attempts' do
    let!(:user) { create(:user, :competitor) }
    let!(:event) { create(:event, :current_javelin_throw) }

    it 'returns error if max attempts' do
      FactoryBot.create(:users_event, user_id: user.id, event_id: event.id)
      FactoryBot.create_list(:result, 3, :javelin_throw, user_id: user.id, event_id: event.id)
      result = build(:result, :javelin_throw, user_id: user.id, event_id: event.id)

      result.validate

      expect(result).to_not be_valid
      expect(result.errors[:message]).to include(I18n.t('errors.messages.max_attempts'))
    end

    it 'returns error if unsubscribed' do
      result = build(:result, :javelin_throw, user_id: user.id, event_id: event.id)

      result.validate

      expect(result).to_not be_valid
      expect(result.errors[:message]).to include(I18n.t('errors.messages.not_subscribed'))
    end
  end
end
