class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :matches

  scope :students, -> { where(admin: false) }

  scope :get_students, ->(user) { students.where.not(id: user) }

  scope :get_user_by_id, ->(user_id) { Match.get_students.find_by id: user_id }

  def get_other_students(user, students)
    @other_students = get_students - user.previous_matches

  end

  def save_history(student_id)
    history << student_id
    save
  end

end
