class CreateEdits < ActiveRecord::Migration[7.0]
  def change
    create_table :edits do |t|
      t.string :title
      t.text :details
      t.integer :user_detail
     
      t.text :history
      t.text :comment
      t.boolean :approved
      t.references :clan, foreign_key:true

      t.timestamps
    end
  end
end
