class CreateSurveys < ActiveRecord::Migration
  def change
    create_table :surveys do |s|
      s.string :title
      s.text :description
      s.references :user
      s.timestamps
    end
  end
end
