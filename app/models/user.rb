class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :matches

  scope :students, -> { where(admin: false) }

  scope :get_students, ->(user) { students.where.not(id: user) }

  scope :get_names, ->(user_id) { students.where(id: user_id).pluck :name }

  scope :get_name, ->(user) { User.where(id: user).pluck :name }

  def get_other_students(user, students)
    @other_students = get_students - user.previous_matches

  end

  def save_previous_matches(match) # Match is a student id
    previous_matches << match
    save
  end

  def is_admin?
    self.admin
  end

end
