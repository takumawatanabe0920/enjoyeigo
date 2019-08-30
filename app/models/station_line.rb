class StationLine < ApplicationRecord
  belongs_to :company, optional: true
  has_many :station

  belongs_to :teacher, optional: true
end
