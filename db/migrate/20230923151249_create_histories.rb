class CreateHistories < ActiveRecord::Migration[7.0]
  def change
    create_table :histories do |t|
 
      t.string :title
      t.string :details
      t.references :clan_history, foreign_key:true
      t.references :family_history, foreign_key:true
      t.references :memory, foreign_key:true
      t.references :edit, foreign_key:true

      t.timestamps
    end
  end
end
