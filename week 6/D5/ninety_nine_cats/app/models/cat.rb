class Cat < ApplicationRecord
  validates :color, :birth_date, :description, :name, :sex, presence: true
end
