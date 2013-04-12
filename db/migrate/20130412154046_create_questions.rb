class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |q|
      q.string :question
      q.references :survey
    end
  end
end
