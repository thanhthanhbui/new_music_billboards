class Bboard < ApplicationRecord
  has_many :artists
  has_many :songs
end
