# == Schema Information
#
# Table name: threads
#
#  id               :bigint           not null, primary key
#  dat              :string(255)
#  subdomain        :string(255)
#  board            :string(255)
#  subject          :text(65535)
#  first_comment_id :bigint
#  last_comment_id  :bigint
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

class BBS::Thread < ApplicationRecord
  include ActiveModel::Validations
  validate :validate_thread_exists, on: :create

  has_many :comments

  has_one :first_comment, class_name: 'BBS::Comment', primary_key: :first_comment_id, foreign_key: :id
  has_one :last_comment, class_name: 'BBS::Comment', primary_key: :last_comment_id, foreign_key: :id

  def validate_thread_exists
    thread = BBS::Thread.find_by(dat: self.dat,
                                 subdomain: self.subdomain,
                                 board: self.board)
    self.errors.add(:dat, "exists on #{self.board}") if thread.present?
  end

  def ==

  end
end