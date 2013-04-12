class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |q|
      q.string :question
      q.references :survey
      q.timestamps
    end
  end
end
