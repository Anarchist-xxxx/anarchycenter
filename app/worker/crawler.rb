require 'sidekiq-scheduler'

class Crawler
  include Sidekiq::Worker

  @@prev_threads = {}

  #
  # dat
  #   last_saved_comment_id
  #

  def perform
    puts '================================'
    puts '[START] Crawler'
    puts '================================'

    liveanarchy = Itest5ch::Board.find('liveanarchy')

    now_threads = {}
    liveanarchy.threads.each do |now_thread|
      now_threads.store(now_thread.dat, {})
    end

    reserved_hash = {}

    now_threads.each do |now_thread_key, hash|
      # スレッドを取得
      raw_thread = get_thread(now_thread_key)

      # 前回のスレッドにないとき
      unless @@prev_threads.has_key?(now_thread_key)
        unless raw_thread.blank?
          thread = build_thread(raw_thread)
          if thread.save
            puts '---------------'
            puts 'Thread saved'
            puts "#{thread.dat} #{thread.subject}"
            puts '---------------'
          else
            puts '---------------'
            puts 'Thread save FAILED!!'
            puts "#{thread.dat} #{thread.subject}"
            puts '---------------'
          end
        end

        comments = get_comments(thread)
        BBS::Comment.import(comments)
        thread.update(first_comment: comments.first)
        if comments.present?
          reserved_hash.store(now_thread_key, { last_saved_comment_id: comments.last.number })
        else
          reserved_hash.store(now_thread_key, { last_saved_comment_id: nil })
        end


      # 前回のスレッドにあるとき
      else
        saved_thread = BBS::Thread.find_by(dat: now_thread_key, subdomain: 'agree', board: 'liveanarchy')
        last_saved_comment_id = @@prev_threads[:now_thread.dat][:last_saved_comment_id]

        if saved_thread.present?
          target_comments = get_comments(saved_thread)
          target_comments.reject { |comment| comment.number < last_saved_comment_id } if last_saved_comment_id.present?
          BBS::Comment.import(target_comments)
        end
      end
    end

    reserved_hash.each do |key, hash|
      now_threads.store(key, hash)
    end

    @@prev_threads.each do |prev_thread_key, hash|
      if now_threads[prev_thread_key].blank?
        downed_thread = BBS::Thread.find_by(dat: now_thread_key, subdomain: 'agree', board: 'liveanarchy')
        downed_thread.update(last_comment_id: downed_thread.comments.last)
      end
    end

    @@prev_threads == now_threads.deep_dup

    puts '================================'
    puts '[DONE] Crawler'
    puts '================================'
  end

  private

  def build_threads(raw_threads)
    threads = []
    raw_threads.each do |raw_thread|
      threads << BBS::Thread.new(dat: raw_thread.dat, subdomain: raw_thread.subdomain, board: raw_thread.board, subject: raw_thread.name)
    end
    threads
  end

  def build_thread(raw_thread)
    BBS::Thread.new(dat: raw_thread.dat, subdomain: raw_thread.subdomain, board: raw_thread.board, subject: raw_thread.name)
  end

  def get_comments(thread)
    comments = []
    thread.comments.each do |comment|
      comments << BBS::Comment.new(number: comment.number,
                                   name: comment.name,
                                   mail: comment.mail,
                                   date: comment.date,
                                   cid: comment.id,
                                   comment: comment.message,
                                   thread: thread)
    end
  end

  def get_thread(key)
    Itest5ch::Board.find('liveanarchy').threads.find { |thread| thread.dat == key }
  end
end