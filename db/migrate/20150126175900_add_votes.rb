class AddVotes < ActiveRecord::Migration

  create_table :votes do |v|
    v.integer :track_id
    v.integer :account_id
    v.integer :vote 
  end
  
end