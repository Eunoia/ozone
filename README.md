# OZONE
--------
Let's look at Oakland's zoning!

## Setup

### Database
1. Download [Postgres.app](http://postgresapp.com/)
2. Create the database `createdb ozone_development`
3. Run migrations `rake db:migrate`
3. Import the shapefile into Postgres.

	`psql -d ozone_development -f districts.sql`
