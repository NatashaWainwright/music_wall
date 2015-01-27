class AddMoreColumns < ActiveRecord::Migration

  def change
    add_index :tracks, :account_id
  end

end