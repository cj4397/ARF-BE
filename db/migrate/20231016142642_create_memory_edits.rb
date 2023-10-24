class CreateMemoryEdits < ActiveRecord::Migration[7.0]
  def change
    create_table :memory_edits do |t|
      t.integer :history_edit
      t.integer :history
      t.integer :user_detail
      t.string :reason
      t.boolean :approved
      t.references :edit, foreign_key:true

      t.timestamps
    end
  end
end
