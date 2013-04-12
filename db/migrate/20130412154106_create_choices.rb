class CreateChoices < ActiveRecord::Migration
  def change
    create_table :choices do |c|
      c.string :choice
      c.references :question
    end
  end
end
