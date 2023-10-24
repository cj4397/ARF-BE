class CreateDeleteCollections < ActiveRecord::Migration[7.0]
  def change
    create_table :delete_collections do |t|
      t.text :family_delete
      t.text :partner_delete
      t.text :clan_history_delete
      t.text :family_history_delete
      t.text :memory_delete
      t.references :clan, foreign_key:true
      t.timestamps
    end
  end
end
