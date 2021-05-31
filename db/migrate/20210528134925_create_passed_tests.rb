class CreatePassedTests < ActiveRecord::Migration[6.1]
  def change
    create_table :passed_tests do |t|
      t.references :user, null: false
      t.references :test, null: false

      t.timestamps
    end
  end
end
