class Event < ApplicationRecord
    has_and_belongs_to_many :artists
    # belongs_to :venues
end