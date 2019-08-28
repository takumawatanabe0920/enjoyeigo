class Company < ApplicationRecord
  has_many :station_line, dependent: :destroy

end
