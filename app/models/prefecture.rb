class Prefecture < ApplicationRecord
  acts_as_nested_set
  has_many :stations

  belongs_to :teacher, optional: true
end
