class CreateSurveysTaken < ActiveRecord::Migration
  def change
    create_table :surveys_taken, :id => false do |st|
      st.references :user
      st.references :survey
    end
    add_column(:surveys_taken, [:user_id, :survey_id], :integer, :unique => true)
  end
end
