class CreateBadgesTestPassages < ActiveRecord::Migration[6.1]
  def change
    create_table :badges_test_passages do |t|
      t.references :test, foreign_key: true
      t.references :user, foreign_key: true
      t.references :badges_rule, foreign_key: true

      t.timestamps
    end
  end
end
