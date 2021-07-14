class CreateBadges < ActiveRecord::Migration[6.1]
  def change
    create_table :badges do |t|
      t.references :user, :badges_rule, null: false, foreign_key: true
      t.string :title
      t.string :pic_url

      t.timestamps
    end
  end
end
