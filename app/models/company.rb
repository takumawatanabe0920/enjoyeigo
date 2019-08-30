class Company < ApplicationRecord
  has_many :station_lines, dependent: :destroy
end
