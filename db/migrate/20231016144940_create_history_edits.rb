class CreateHistoryEdits < ActiveRecord::Migration[7.0]
  def change
    create_table :history_edits do |t|
      t.string :title
      t.text :details
          
      t.text :comment

      t.references :memory_edit, foreign_key:true
      t.references :family_history_edit, foreign_key:true
      t.references :clan_history_edit, foreign_key:true

      t.timestamps
    end
  end
end
