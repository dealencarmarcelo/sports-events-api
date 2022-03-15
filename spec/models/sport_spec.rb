require 'rails_helper'

RSpec.describe Sport, type: :model do
  describe 'associations' do
    it { should have_many(:events) }
  end
end
