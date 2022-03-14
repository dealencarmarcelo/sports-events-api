require 'rails_helper'

RSpec.describe Event, type: :model do
  describe 'associations' do
    it { should belong_to(:organization) }
    
    it { should have_many(:users).through(:users_events) }
  end
end
