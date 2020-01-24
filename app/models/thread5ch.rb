# == Schema Information
#
# Table name: thread5ches
#
#  id               :bigint           not null, primary key
#  subject          :string(255)
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  first_comment_id :integer
#  last_comment_id  :integer
#

class Thread5ch < ApplicationRecord
end
