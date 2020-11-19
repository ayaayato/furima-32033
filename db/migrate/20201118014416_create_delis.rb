class CreateDelis < ActiveRecord::Migration[6.0]
  def change
    create_table :delis do |t|

      t.string    :postal,          null: false
      t.string    :city,            null: false
      t.string    :number,          null: false
      t.string    :bill
      t.string    :phone,           null: false
      t.integer   :send_area_id,    null: false

      t.references :order,       foreign_key: true

      t.timestamps
    end
  end
end
