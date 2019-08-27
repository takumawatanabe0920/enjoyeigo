class Company < ApplicationRecord
  has_one :station_line, dependent: :destroy, autosave: true
  accepts_nested_attributes_for :station_line
end
