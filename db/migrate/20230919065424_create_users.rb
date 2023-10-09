class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :middle_name
      t.string :last_name
   
      t.string :email
      t.string :password_hash
      t.string :token
      t.integer :phone
      t.text :member
      t.text :user_detail
      t.boolean :is_admin
      

      t.timestamps
    end
  end
end
