class CreateTestPassages < ActiveRecord::Migration[6.1]
  def change
    create_table :test_passages do |t|
      t.references :user, :test, null: false, foreign_key: true
      t.references :current_question, foreign_key: { to_table: 'questions' }
      t.integer :correct_questions, default: 0
      t.boolean :expired, default: false

      t.timestamps
    end
  end
end
