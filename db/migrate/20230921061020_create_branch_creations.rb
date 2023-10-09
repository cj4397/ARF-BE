class CreateBranchCreations < ActiveRecord::Migration[7.0]
  def change
    create_table :branch_creations do |t|
      t.text :request
      t.text :user_detail
      
      t.boolean :approved


      t.timestamps
    end
  end
end
