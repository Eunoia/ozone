class AddIndexes < ActiveRecord::Migration
  def change
    add_index :parcels, :geom, using: :gist
    add_index :districts, :geom, using: :gist
  end
end
