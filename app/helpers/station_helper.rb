module StationHelper
	def static_map(marker)
		root = 'https://maps.googleapis.com/maps/api/staticmap'
		key = 'AIzaSyBtxj21zNBckjM1RCBV8hpb8dRXyEngkcE'
		"#{root}?markers=#{marker}&zoom=14&size=320x320&key=#{key}"
	end
end
