class CreateRequests < ActiveRecord::Migration[7.0]
  def change
    create_table :requests do |t|
      t.string :request_type
      t.datetime :start_time
      t.datetime :end_time
      t.string :origin
      t.string :destination
      t.boolean :avaiable

      t.timestamps
    end
  end
end
