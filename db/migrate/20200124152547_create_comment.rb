class CreateComment < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.integer :number
      t.text :mail
      t.text :name
      t.datetime :date
      t.text :comment, :limit => 4294967295
      t.references :thread, null: false

      t.timestamps
    end
  end
end
