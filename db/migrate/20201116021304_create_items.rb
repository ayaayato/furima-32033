class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|

      t.string     :title,          null: false
      t.text       :explan,         null: false
      t.integer    :price,          null: false
      t.integer    :category_id,    null: false
      t.integer    :status_id,      null: false
      t.integer    :send_fee_id,    null: false
      t.integer    :send_area_id,   null: false
      t.integer    :send_day_id,    null: false

      t.references :user,       foreign_key: true

      t.timestamps
    end
  end
end
