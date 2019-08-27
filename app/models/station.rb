class Station < ApplicationRecord
  belongs_to :prefecture
  belongs_to :station_line

  has_many :station_joins
end
