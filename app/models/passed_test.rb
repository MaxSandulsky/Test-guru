class PassedTest < ApplicationRecord
  belongs_to :user

  has_many :tests, foreign_key: 'id'
end
