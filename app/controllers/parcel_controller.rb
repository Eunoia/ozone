class ParcelController < ApplicationController
  def show
  	@parcel = Parcel.find_by_gid(params[:id])
  end

  def index
  	Parcel.count
  end
end
