class CreateBbsComments < ActiveRecord::Migration[6.0]
  def change
    create_table :bbs_comments do |t|

      t.timestamps
    end
  end
end
