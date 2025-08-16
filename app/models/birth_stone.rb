class BirthStone < ApplicationRecord
  # Validations
  validates :month, presence: true, uniqueness: true
  validates :crystal, presence: true
  validates :colour, presence: true
  validates :origin, presence: true
  validates :properties, presence: true
  validates :associated_stones, presence: true
  
  # Optional fields
  # extra_details and picture are optional
  
  # Class methods
  def self.find_by_month(month_number)
    month_names = {
      1 => "January", 2 => "February", 3 => "March", 4 => "April",
      5 => "May", 6 => "June", 7 => "July", 8 => "August",
      9 => "September", 10 => "October", 11 => "November", 12 => "December"
    }
    
    month_name = month_names[month_number.to_i]
    find_by(month: month_name) if month_name
  end
end
