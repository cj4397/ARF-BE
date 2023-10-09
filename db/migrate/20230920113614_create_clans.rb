class CreateClans < ActiveRecord::Migration[7.0]
  def change
    create_table :clans do |t|
      t.text :clan_detail
      t.text :clan_history
    
      t.text :family
      t.text :member
      t.text :branch_clan
      t.text :edit
      t.text :memory
      t.text :clan_request

      t.timestamps
    end
  end
end
