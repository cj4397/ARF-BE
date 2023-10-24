class CreateFamilyHistories < ActiveRecord::Migration[7.0]
  def change
    create_table :family_histories do |t|
      t.text :history
      t.references :family, foreign_key:true
      t.references :family_history_delete, foreign_key:true

      t.timestamps
    end
  end
end
