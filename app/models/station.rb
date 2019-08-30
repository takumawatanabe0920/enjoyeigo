class Station < ApplicationRecord
  belongs_to :prefecture, optional: true
  belongs_to :station_line, optional: true
  belongs_to :teacher, optional: true

end
