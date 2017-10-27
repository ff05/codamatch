class Match < ApplicationRecord
  FIRST_DATE = Date.today
  LAST_DATE = Date.today + 6.days
  DATES = (FIRST_DATE..LAST_DATE)

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

  scope :get_matches, -> { Match.all }

  scope :get_matches_by_date, ->(date) { Match.where(date: date) }

  scope :get_previous_matches, ->(date) { Match.where("date < ?", date) }

  scope :get_dates, -> { Match.dates }

  scope :matches_per_user, ->(user) { Match.where("student1 = ? OR student2 = ?", user.to_s, user.to_s) }

  scope :match_today, ->(date) { Match.where(date: date) }
end
