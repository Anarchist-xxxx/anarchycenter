# == Schema Information
#
# Table name: comment5ches
#
#  id         :bigint           not null, primary key
#  comment    :string(255)
#  date       :datetime
#  mail       :string(255)
#  name       :string(255)
#  number     :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class Comment5chTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
