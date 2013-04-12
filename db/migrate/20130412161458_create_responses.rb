class CreateResponses < ActiveRecord::Migration
  def change
    create_table :responses do |r|
      r.references :user
      r.references :choice
    end
  end
end
