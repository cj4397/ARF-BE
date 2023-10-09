class CreateUserDetails < ActiveRecord::Migration[7.0]
  def change
    create_table :user_details do |t|
      t.string :name
      t.string :nickname
      t.references :clan_request, foreign_key:true
      t.references :branch_creation, foreign_key:true
      t.references :clan_creation, foreign_key:true
      t.references :edit, foreign_key:true
      t.references :comment, foreign_key:true
      
      t.references :user, foreign_key:true
      

      t.timestamps
    end
  end
end
