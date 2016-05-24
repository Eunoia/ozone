class StationController < ApplicationController
  def show
  	@station = Station.find(params[:id])
  	sql =<<SQL
		  	SELECT row_to_json(fc)
				 FROM ( SELECT 'FeatureCollection' As type, array_to_json(array_agg(f)) As features
				 FROM (SELECT 'Feature' As type
				    , ST_AsGeoJSON(p.geom)::json As geometry
				    , row_to_json((SELECT l FROM (SELECT d.znlabel, p.gid) As l
				      )) As properties
				   FROM parcels p
				LEFT JOIN
					districts d
				ON
					ST_Contains(d.geom, p.geom)
				WHERE
					ST_DWithin(p.geom::geography, #{@station.as_point}::geography, 804) ) As f )  As fc;

SQL
		puts @sql
		@sql = sql
		@x = ActiveRecord::Base.connection.execute(sql)
		@geo_json = @x.values[0][0].gsub('\"', '"')
  end

  def index
  	@stations = Station.where(gid: 4..11)
  end
end
