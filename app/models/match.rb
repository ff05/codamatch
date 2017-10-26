class Match < ApplicationRecord
  DATES = (Date.new(2017, 10, 30)..Date.new(2017, 12, 14))

  belongs_to :user

  validates :date, presence: true
  validates :student1, presence: true
  validates :student2, presence: true

  def self.make_pairs
    @students = get_students.to_a
    DATES.each do |d|
      @game_count = @students.count / 2
      set_dummy
      for i in 1..@game_count
        Match.create!(date: d, student1: @students[i-1].id, student2: @students[@students.count-i].id, user: @students[i-1])
      end

      @students.insert(1, @students.pop)
    end
  end

  def self.set_dummy
    get_students.ids << 'DUMMY' if is_odd?
  end

  def self.is_odd?
    get_students.size
  end

  scope :get_students, -> { User.students.where(admin: false) }

  scope :get_other_students, ->(user) { get_students.where.not(id: user) }

  scope :get_ids, ->(users) { users.ids }

  scope :get_user_by_id, ->(user_id) { get_students.where(id: user_id) }

  scope :get_matches_by_student, ->(user_id) { Match.where(student1: user_id) }
end
