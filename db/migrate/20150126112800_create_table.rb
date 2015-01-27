class CreateTable < ActiveRecord::Migration
  def change
    create_table :tracks do |t|
      t.string :title
      t.string :author
      t.string :url
      t.timestamp
    end
  end
end