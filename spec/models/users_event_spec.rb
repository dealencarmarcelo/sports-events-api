require 'rails_helper'

RSpec.describe UsersEvent, type: :model do
  it { should belong_to(:user) }
  it { should belong_to(:event) }
end
