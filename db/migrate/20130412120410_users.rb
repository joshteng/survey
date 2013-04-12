class Users < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name, :email, :password_hash, :password_salt
      t.timestamps
    end
  end
end
