class Prefecture < ApplicationRecord
  has_many :stations

  has_many :station_line_prefectures
end
