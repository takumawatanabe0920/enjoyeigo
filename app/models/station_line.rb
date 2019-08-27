class StationLine < ApplicationRecord
  belongs_to :company
  has_many :station

  has_many :station_joins

  has_many :station_line_prefectures
end
