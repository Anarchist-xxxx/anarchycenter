class CreateBbsThreads < ActiveRecord::Migration[6.0]
  def change
    create_table :bbs_threads do |t|

      t.timestamps
    end
  end
end
