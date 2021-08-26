class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.string   :postal_code,       null: false
      t.integer  :prefecture_id,     null: false
      t.string   :city,              null: false
      t.string   :adress,            null: false
      t.string   :building
      t.string   :telephone_number,  null: false
      t.references :pay, null: false, foregin_key: true
      t.timestamps
    end
  end
end
