class CreateRequests < ActiveRecord::Migration[7.0]
  def change
    create_table :requests do |t|
      t.string :name
      t.string :main_clan
      
      t.references :clan_creation, foreign_key: true
      t.references :branch_creation, foreign_key: true

      t.timestamps
    end
  end
end
