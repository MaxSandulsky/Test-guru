class Test < ApplicationRecord
  def self.titles(category)
    Test.order(title: :desc).where(category_id: Category.find_by_title(category).id).pluck(:title)
  end
end
