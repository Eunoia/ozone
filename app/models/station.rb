class Station < ActiveRecord::Base
	def as_point
		"ST_GeomFromText('#{geom.to_s}')"
	end

	def as_latlng
		geom.to_s[/\((.+)\)/,1].split(' ').reverse.join(', ')
	end

	def name
		station.titleize
	end
end
