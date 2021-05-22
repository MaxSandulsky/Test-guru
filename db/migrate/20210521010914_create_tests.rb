class CreateTests < ActiveRecord::Migration[6.1]
  def change
    create_table :tests do |t|
      t.references :category, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.integer :level, null: false, default: 0
      t.string :title, null: false

      t.timestamps
    end
  end
end
