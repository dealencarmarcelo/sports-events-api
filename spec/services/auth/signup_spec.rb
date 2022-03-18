require 'rails_helper'

describe Api::V1::Auth::SignupService do
  subject(:context) { described_class.call(auth_params) }

  describe '.call' do
    context 'with valid params' do
      password = Faker::Alphanumeric.alphanumeric(number: 8)
      let(:auth_params) do
        {
          first_name: Faker::Name.first_name,
          last_name: Faker::Name.last_name,
          email: Faker::Internet.email,
          username: Faker::Internet.username,
          age: Faker::Number.between(from: 18, to: 60),
          role: 'admin',
          password: password,
          password_confirmation: password
        }
      end
      it 'succeeds' do
        expect(context).to be_success
      end
    end

    context 'with invalid params' do
      password = Faker::Alphanumeric.alphanumeric(number: 8)
      let(:auth_params) do
        {
          first_name: nil,
          last_name: Faker::Name.last_name,
          email: Faker::Internet.email,
          username: Faker::Internet.username,
          age: Faker::Number.between(from: 18, to: 60),
          role: 'admin',
          password: password,
          password_confirmation: password
        }
      end
      it 'fails' do
        expect{ context }.to raise_error ActiveRecord::RecordInvalid
      end
    end
  end
end
