class Genre < ApplicationRecord
  has_ancestry
  has_many :dresses
end
