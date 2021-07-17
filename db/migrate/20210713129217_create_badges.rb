class CreateBadges < ActiveRecord::Migration[6.1]
  def change
    create_table :badges do |t|
      t.string :pic_url
      t.string :title
      t.string :description
      t.string :rule
      t.string :rule_value

      t.timestamps
    end
  end
end
