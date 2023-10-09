class CreateMembers < ActiveRecord::Migration[7.0]
  def change
    create_table :members do |t|
      t.text :person
      t.boolean :officer
      t.text :user_detail
      t.text :clan_detail
      

      t.references :clan  ,foreign_key: true
      t.references :user  ,foreign_key: true

      t.timestamps
    end
  end
end
