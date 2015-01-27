class AddAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |a|
      a.string :name
      a.string :email 
      a.string :password
    end
  end
end