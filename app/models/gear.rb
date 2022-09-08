class Gear < ApplicationRecord
    has_many :chests
    has_many :characters, through: :chests
end
