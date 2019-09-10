class Prefecture < ApplicationRecord

  has_many :stations

  belongs_to :teacher, optional: true
end
