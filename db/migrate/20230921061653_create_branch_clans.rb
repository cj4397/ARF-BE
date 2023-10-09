class CreateBranchClans < ActiveRecord::Migration[7.0]
  def change
    create_table :branch_clans do |t|
      t.integer :branch_clan_id
      t.references :clan, foreign_key:true

      t.timestamps
    end
  end
end
