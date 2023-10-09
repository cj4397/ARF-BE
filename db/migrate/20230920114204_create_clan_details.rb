class CreateClanDetails < ActiveRecord::Migration[7.0]
  def change
    create_table :clan_details do |t|
      t.string :name
      t.string :details

 
      t.references :clan, foreign_key:true
     

      t.timestamps
    end
  end
end
