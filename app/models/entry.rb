class Entry < ApplicationRecord
  belongs_to :messagable, polymorphic: true
  belongs_to :room
end
