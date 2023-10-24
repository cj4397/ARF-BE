class CreateChildren < ActiveRecord::Migration[7.0]
  def change
    create_table :children do |t|
      t.text :family
      t.references :partner, references:true

      t.timestamps
    end
  end
end
