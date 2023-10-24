class CreateUserDetails < ActiveRecord::Migration[7.0]
  def change
    create_table :user_details do |t|
      t.string :name
      
      t.references :clan_request, foreign_key:true
      t.references :branch_creation, foreign_key:true
      t.references :clan_creation, foreign_key:true
    
      t.references :comment, foreign_key:true
      t.references :memory_edit, foreign_key:true
      t.references :family_history_edit, foreign_key:true
      t.references :clan_history_edit, foreign_key:true
      t.references :family_edit, foreign_key:true
      t.references :partner_edit, foreign_key:true
      t.references :clan_details_edit, foreign_key:true

      t.references :family_delete, foreign_key:true
      t.references :partner_delete, foreign_key:true
      t.references :clan_history_delete, foreign_key:true
      t.references :family_history_delete, foreign_key:true
      t.references :memory_delete, foreign_key:true
      
      t.references :user, foreign_key:true
      

      t.timestamps
    end
  end
end
