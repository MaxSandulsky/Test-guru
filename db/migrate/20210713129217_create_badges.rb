class CreateBadges < ActiveRecord::Migration[6.1]
  def change
    create_table :badges do |t|
      t.references :test, foreign_key: true
      t.references :user, foreign_key: true
      t.references :category, foreign_key: true
      t.integer :level
      t.integer :attempts
      t.string :pic_url
      t.string :title
      t.boolean :achieved, default: false

      t.timestamps
    end
  end
end
