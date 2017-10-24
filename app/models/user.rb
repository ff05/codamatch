class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :matches

  scope :students, -> { where(admin: false) }

  scope :available_students, ->(user) { students.where.not(id: user) }

  

end
