ActiveRecord::Base.transaction do
  thread = BBS::Thread.create!(subdomain: 'agree', board: 'liveanarchy', dat: '1579941515', subject: '早朝アナーキー')

  comment1 = BBS::Comment.create!(number: 1,
                       name: '【*^▲^*】',
                       mail: '',
                       date: Time.parse('Fri, 24 Jan 2020 21:39:51 UTC +00:00'),
                       comment: 'おっはー！',
                       thread: thread,
                       cid: '')
  comment2 = BBS::Comment.create!(number: 2,
                       name: '【*^▲^*】',
                       mail: '',
                       date: Time.parse('Fri, 24 Jan 2020 21:40:05 UTC +00:00'),
                       comment: 'よっうー！',
                       thread: thread,
                       cid: '')
  comment3 = BBS::Comment.create!(number: 3,
                       name: '【*^▲^*】',
                       mail: '',
                       date: Time.parse('Fri, 24 Jan 2020 21:40:19 UTC +00:00'),
                       comment: 'ええな',
                       thread: thread,
                       cid: '')
  comment4 = BBS::Comment.create!(number: 4,
                       name: '【*^▲^*】',
                       mail: '',
                       date: Time.parse('Fri, 24 Jan 2020 21:41:02 UTC +00:00'),
                       comment: 'おやすみー！',
                       thread: thread,
                       cid: '')
  comment5 = BBS::Comment.create!(number: 5,
                       name: '【*^▲^*】',
                       mail: '',
                       date: Time.parse('Fri, 24 Jan 2020 21:42:43 UTC +00:00'),
                       comment: 'ねないで',
                       thread: thread,
                       cid: '')
  comment6 = BBS::Comment.create!(number: 6,
                       name: '【*^▲^*】',
                       mail: '',
                       date: Time.parse('Fri, 24 Jan 2020 21:43:36 UTC +00:00'),
                       comment: 'ガァララ・ス・リープ',
                       thread: thread,
                       cid: '')
  comment7 = BBS::Comment.create!(number: 7,
                       name: '【*^▲^*】',
                       mail: '',
                       date: Time.parse('Fri, 24 Jan 2020 21:44:45 UTC +00:00'),
                       comment: 'よく起きてんな',
                       thread: thread,
                       cid: '')
  thread.update!(first_comment_id: comment1.id, last_comment_id: comment7.id)

end
