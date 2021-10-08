class Cat < ApplicationRecord
  validates :color, :birth_date, :description, :name, :sex, presence: true
  validates :sex, length: { maximum: 1 }
  validates :color, inclusion: { in: ['calico', 'rust', 'black', 'grey', 'white', 'brown'] }
  
  def age
    2021 - self.birth_date.year
  end
end
