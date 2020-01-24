class CreateThread < ActiveRecord::Migration[6.0]
  def change
    create_table :threads do |t|
      t.text :subject
      t.bigint :first_comment_id
      t.bigint :last_comment_id

      t.timestamps
    end
  end
end
