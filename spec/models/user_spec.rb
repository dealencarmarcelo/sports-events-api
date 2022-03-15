require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'associations' do
    it { should have_many(:results) }
    it { should have_many(:events).through(:users_events) }
  end
end
