class CreateSurveysTaken < ActiveRecord::Migration
  def change
    create_table :survey_takens, :id => false do |st|
      st.references :user
      st.references :survey
    end
    add_index(:survey_takens, [:user_id, :survey_id], :unique => true)
  end
end
