class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.string :name
      t.date :start_date
      t.date :end_date
      t.time :start_time
      t.time :end_time
      t.text :description
      t.string :location
      t.boolean :active
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
