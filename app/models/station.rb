class Station < ActiveRecord::Base

	def name
		station.titleize
	end
end
