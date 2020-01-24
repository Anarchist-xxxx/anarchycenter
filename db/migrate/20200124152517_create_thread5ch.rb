class CreateThread5ch < ActiveRecord::Migration[6.0]
  def change
    create_table :thread5ches do |t|
      t.string :subject
      t.integer :first_comment_id
      t.integer :last_comment_id

      t.timestamps
    end
  end
end
