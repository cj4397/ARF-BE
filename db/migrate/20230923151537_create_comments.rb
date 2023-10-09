class CreateComments < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.integer :user_detail
      t.text :details
      t.references :edit, foreign_key:true

      t.timestamps
    end
  end
end
