class User < ApplicationRecord
  extend Enumerize

  has_secure_password

  attr_accessor :token

  has_many :results

  has_many :users_events
  has_many :events, through: :users_events

  validates_presence_of :first_name,
                        :last_name,
                        :username,
                        :email,
                        :role

  validates :password, length: { minimum: 6 }, presence: true

  enumerize :role, in: %w[admin competitor], predicates: true
end
