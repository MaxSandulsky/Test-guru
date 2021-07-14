class BadgesTestPassage < ApplicationRecord
  belongs_to :test
  belongs_to :user
  belongs_to :badges_rule
end
