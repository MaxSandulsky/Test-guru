class Badge < ApplicationRecord
  validates :title,
            :pic_url,
            :description,
            :rule,
            presence: true
end
