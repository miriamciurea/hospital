class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  belongs_to :specialization, optional: true
  has_many :appointments

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :doctor, inclusion: { in: [true, false] }
  validates :specialization, presence: true, if: :doctor?

  private

  def doctor?
    doctor
  end

end
