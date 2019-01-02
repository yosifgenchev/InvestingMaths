class Stock < ApplicationRecord
	has_many :stats

	validates_uniqueness_of :symbol
end
