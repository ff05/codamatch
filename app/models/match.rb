class Match < ApplicationRecord
  DAYS = (Date.new(2017, 10, 30)..Date.new(2017, 12, 14))

  belongs_to :user

  validates :date, presence: true
  validates :student1, presence: true
  validates :student2, presence: true

  # def self.make_pairs
  #   get_students.each do |user|
  #     user.available_students(user)
  #     other = other_all.sample
  #     match = create!(date: Date.new(2017, 10, 30), student1: user.id, student2: other.id)
  #     user.save_previous_matches(other.id)
  #   end
  # end
  def self.make_pairs
    (1..10).each do |day|
      users_ids = Match.get_ids(Match.get_students)
      users_ids.each do |user_id|
        user1 = Match.get_user_by_id(user_id)
        user2 = Match.get_other_students(user_id).sample
        user2_id = user2.id
        puts user2_id
        # user_ids(delete)
        # Match.create!(Date.new(2017, 10, 30), User.user_id, student2)
      end
    end
  end

  scope :get_students, -> { User.students.where(admin: false) }

  scope :get_other_students, ->(user) { get_students.where.not(id: user) }

  scope :get_ids, ->(users) { users.ids }

  scope :get_user_by_id, ->(user_id) { get_students.where(id: user_id) }
end
