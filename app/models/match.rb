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

  def self.print_students
    # get_students.each do |u|
    #   puts "#{u.name} pairs with #{User.available_students(u).sample.name}"
    # end
    u = User.third
    puts "#{u.name} pairs with #{User.available_students(u).sample.name}"
  end

  scope :get_students, -> { User.students }
end
