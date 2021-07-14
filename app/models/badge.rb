class Badge < ApplicationRecord
  belongs_to :user
  belongs_to :badges_rule
end
