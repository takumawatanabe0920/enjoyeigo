class Prefecture < ApplicationRecord

  has_many :stations, ->{ order(:id) }

  belongs_to :teacher, optional: true
end
