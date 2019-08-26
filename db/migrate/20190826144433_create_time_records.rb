class CreateTimeRecords < ActiveRecord::Migration[5.2]
  def change
    create_table :time_records do |t|
      t.references :user, foreign_key: true
      t.date :date
      t.datetime :entrance
      t.datetime :output

      t.timestamps
    end
  end
end
