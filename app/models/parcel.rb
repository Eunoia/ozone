class Parcel < ActiveRecord::Base
	def as_point
		"ST_GeomFromText('#{geom.to_s}')"
	end
	
	def center_as_latlng
		geom.centroid.to_s[/\((.+)\)/,1].split(' ').reverse.join(', ')
	end

	def as_geojson
		RGeo::GeoJSON.encode(geom).to_json
	end
	def zone
		sql =<<SQL
			SELECT
				*
			FROM
				districts d
			WHERE
				ST_CoveredBy(
					 #{as_point},
					 d.geom


					-- d.geom,
					-- #{as_point}
				)
SQL
		@x = ActiveRecord::Base.connection.execute(sql)
		@geo_json = @x.values
	end
end


# ST_Boundary, ST_ContainsProperly, ST_Covers,ST_CoveredBy, ST_Equals,ST_Within

