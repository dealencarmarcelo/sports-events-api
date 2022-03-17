require 'rails_helper'

RSpec.describe Result, type: :model do
  describe 'validate max attempts' do
    let!(:user) { create(:user, :competitor) }
    let!(:event) { create(:event, :current_javelin_throw) }

    it 'returns error se tiver o valor máximo' do
      FactoryBot.create_list(:result, 3, :javelin_throw, user_id: user.id, event_id: event.id)
      result = build(:result, :javelin_throw, user_id: user.id, event_id: event.id)

      result.validate

      expect(result).to_not be_valid
      expect(result.errors[:result]).to include('max attempts')
    end
  end
end
