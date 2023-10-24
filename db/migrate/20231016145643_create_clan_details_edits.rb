class CreateClanDetailsEdits < ActiveRecord::Migration[7.0]
  def change
    create_table :clan_details_edits do |t|
      t.string :name
      t.text :details
      t.string :reason
      t.boolean :approved
      t.integer :clan_detail
      t.text :user_detail
      t.text :comment

      t.references :edit, foreign_key:true

      t.timestamps
    end
  end
end
