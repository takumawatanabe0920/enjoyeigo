class StationJoin < ApplicationRecord
  belongs_to :station
  belongs_to :station_line
end
