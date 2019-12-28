class CreateReserveThreads < ActiveRecord::Migration[6.0]
  def change
    create_table :reserve_threads do |t|
      t.string :subject
      t.string :name
      t.string :mail
      t.string :message
      t.datetime :reserve_at, null: false
      t.datetime :reserved_at

      t.timestamps
    end
  end
end
