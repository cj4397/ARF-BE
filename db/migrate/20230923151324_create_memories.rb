class CreateMemories < ActiveRecord::Migration[7.0]
  def change
    create_table :memories do |t|
      t.text :history
      t.references :clan, foreign_key:true

      t.timestamps
    end
  end
end
