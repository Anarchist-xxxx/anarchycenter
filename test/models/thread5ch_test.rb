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

require 'test_helper'

class Thread5chTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
