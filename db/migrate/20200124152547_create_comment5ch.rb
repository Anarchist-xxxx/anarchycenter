class CreateComment5ch < ActiveRecord::Migration[6.0]
  def change
    create_table :comment5ches do |t|
      t.integer :number
      t.string :mail
      t.string :name
      t.datetime :date
      t.string :comment

      t.timestamps
    end
  end
end
