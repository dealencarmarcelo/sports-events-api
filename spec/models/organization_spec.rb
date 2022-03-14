require 'rails_helper'

RSpec.describe Organization, type: :model do
  describe 'associations' do
    it { should belong_to(:user) }

    it { should have_many(:events) }
  end
end
