class CreateEdits < ActiveRecord::Migration[7.0]
  def change
    create_table :edits do |t|
      t.text :memory_edit
      t.text :family_history_edit
      t.text :clan_history_edit
      t.text :partner_edit
      t.text :family_edit
     
      t.text :clan_details_edit

      t.references :clan, foreign_key:true

      t.timestamps
    end
  end
end
