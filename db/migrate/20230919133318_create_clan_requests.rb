class CreateClanRequests < ActiveRecord::Migration[7.0]
  def change
    create_table :clan_requests do |t|
     
      t.string :details
      t.text :user_detail
      t.boolean :approved
    
      t.references :clan  ,foreign_key: true

      t.timestamps
    end
  end
end
