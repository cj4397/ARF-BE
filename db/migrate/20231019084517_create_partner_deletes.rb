class CreatePartnerDeletes < ActiveRecord::Migration[7.0]
  def change
    create_table :partner_deletes do |t|
      t.string :reason
      t.text :user_detail
      t.text :partner
      t.text :comment
      t.boolean :cancelled

      t.references :delete_collection, foreign_key:true

      t.timestamps
    end
  end
end
