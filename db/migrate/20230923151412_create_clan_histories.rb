class CreateClanHistories < ActiveRecord::Migration[7.0]
  def change
    create_table :clan_histories do |t|
      t.text :history
      t.references :clan, foreign_key:true
      t.references :clan_history_delete, foreign_key:true

      t.timestamps
    end
  end
end
