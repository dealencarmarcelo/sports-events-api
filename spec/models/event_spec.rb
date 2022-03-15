require 'rails_helper'

RSpec.describe Event, type: :model do
  describe 'associations' do
    it { should belong_to(:organization) }

    it { should have_many(:users).through(:users_events) }
  end

  describe 'presences' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:start_date) }
    it { should validate_presence_of(:end_date) }
  end

  describe 'validations' do
    context 'when start_date is before end_date' do
      it 'is a valid event' do
        event = build_stubbed(:event, :forward_javelin_throw, start_date: Date.today, end_date: Date.tomorrow)
        expect(event).to be_valid
      end
    end

    context 'whehn start_date if after end_date' do
      it 'is not a valid event' do
        event = build_stubbed(:event, :forward_javelin_throw, start_date: Date.tomorrow, end_date: Date.today)
        expect(event).to_not be_valid
      end
    end
  end
end
