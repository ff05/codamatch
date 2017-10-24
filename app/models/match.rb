class Match < ApplicationRecord
  DAYS = (Date.new(2017, 10, 30)..Date.new(2017, 12, 14))

  belongs_to :user

  validates :date, presence: true
  validates :student1, presence: true
  validates :student2, presence: true

  # def self.cycle_matches
  #   DAYS.each do |day|
  #     get_students.each do |student|
  #       User.available_students(student)
  #       student1 = student.id
  #       student2 = User.get_random_student_id
  #       match = new(date: day, student1: student1, student2: student2)
  #     end
  #   end
  #
  # end

  def self.make_pairs
    get_students.each do |user|
      av = available_students(user)
      partner = pick_student(av, user)
      match = new(date: Time.now.to_date, student1: user, student2: partner)
      match.save
    end
  end

  def available_students(student)
    User.available_students(student)
  end

  def pick_student(students, student)
    students.delete(student)
  end

  scope :get_students, -> { User.students }
end
