# == Schema Information
#
# Table name: comments
#
#  id         :bigint           not null, primary key
#  number     :integer
#  name       :text(65535)
#  mail       :text(65535)
#  date       :datetime
#  cid        :string(255)
#  comment    :text(4294967295)
#  thread_id  :bigint           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_comments_on_thread_id  (thread_id)
#

class BBS::Comment < ApplicationRecord
  belongs_to :thread
end
