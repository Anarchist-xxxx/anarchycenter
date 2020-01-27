require 'sidekiq-scheduler'

class Crawler
  include Sidekiq::Worker

  def perform
    liveanarchy = Itest5ch::Board.find('liveanarchy')

    raw_threads = liveanarchy.threads
    raw_threads.each do |raw_thread|
      thread = build_thread(raw_thread)
      if thread.save
        comments = raw_thread.comments.map { |raw_comment| build_comment(raw_comment, thread) }
        comments.reject! { |comment| comment.number < thread.last_comment.number } if thread.last_comment
        comments.each { |comment| comment.save }
        thread.first_comment_id = comments.first.id
        thread.last_comment_id = comments.last.id
        thread.save
      end
    end
  end

  private

  # Itest5ch::ThreadをBBS::Threadに変換する
  def build_thread(raw_thread)
    BBS::Thread.new(dat: raw_thread.dat,
                    subdomain: raw_thread.subdomain,
                    board: raw_thread.board,
                    subject: raw_thread.name)
  end

  # Itest5ch::CommentをBBS::Commentに変換する
  def build_comment(raw_comment, bbs_thread)
    BBS::Comment.new(number: raw_comment.number,
                     name: raw_comment.name,
                     mail: raw_comment.mail,
                     date: raw_comment.date,
                     cid: raw_comment.id,
                     comment: raw_comment.message,
                     thread: bbs_thread)
  end

  def get_thread(key)
    Itest5ch::Board.find('liveanarchy').threads.find { |thread| thread.dat == key }
  end
end