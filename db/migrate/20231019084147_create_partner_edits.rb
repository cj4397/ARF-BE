class CreatePartnerEdits < ActiveRecord::Migration[7.0]
  def change
    create_table :partner_edits do |t|
      t.string :name
      t.string :status
      t.string :reason
      t.text :comment
      t.text :user_detail
      t.text :partner
      t.references :edit, foreign_key:true

      t.timestamps
    end
  end
end
