class Patient < ApplicationRecord
  has_many :appointments

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :address, presence: true
  validates :telephone, presence: true
  validates :problem, presence: true
end
