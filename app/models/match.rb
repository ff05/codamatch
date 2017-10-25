class Match < ApplicationRecord
  DAYS = (Date.new(2017, 10, 30)..Date.new(2017, 12, 14))

  belongs_to :user

  validates :date, presence: true
  validates :student1, presence: true
  validates :student2, presence: true

  def self.make_pairs
    users_ids = Match.get_ids(Match.get_students)
    (1..10).each do |day|
      users_ids2 = users_ids.dup
      users_ids2.each do |user_id|
        # next if user1.matched_today?
        user1 = User.get_user_by_id(user_id)
        user2 = Match.get_other_students(user_id).sample
        user2_id = user2.id
        user1.save_history(user2_id)
        user_ids2.delete(user_id)
        
        # Match.create!(Date.new(2017, 10, 30), User.user_id, student2)
      end
    end
  end

  def set_days
    Match.get_students
  end

  scope :get_students, -> { User.students.where(admin: false) }

  scope :get_other_students, ->(user) { get_students.where.not(id: user) }

  scope :get_ids, ->(users) { users.ids }

end
