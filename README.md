# OZONE
--------
Let's look at Oakland's zoning!

## Setup

### Database
1. Download [Postgres.app](http://postgresapp.com/)
2. Create the database `createdb ozone_development`
3. Run migrations `rake db:migrate`
3. Import the shapefile into Postgres. `psql -d ozone_development -f districts.sql`

## Questions

What zone takes up the most space?
`District.group("basezone").sum("area").sort_by(&:last)[-1]`
> M-40 - Heavy Industry

How many zones are in Oakland?
`District.uniq("znlabel").pluck("znlabel").count`
> 127

What are the different zones in Oakland?
`District.uniq("znlabel").pluck("znlabel").sort`
> "C-40", "C-45", "C-45/S-4", "CBD-C", "CBD-P", "CBD-P/CH", "CBD-P/S-7", "CBD-R", "CBD-R/S-7", "CBD-X", "CBD-X/S-7", "CC-1", "CC-2", "CC-2/D-BR", "CC-2/S-7", "CC-3", "CIX-1", "CIX-1/S-19", "CIX-2", "CIX-2/S-19", "CN-1", "CN-2", "CN-2/D-BR", "CN-2/D-KP-3", "CN-2/S-12", "CN-3", "CN-3/D-KP-1", "CN-3/S-12", "CN-3/S-7", "CN-4", "CR-1", "D-KP-1", "D-KP-2", "D-KP-3", "D-KP-4", "D-OTN", "HBX-1", "HBX-2", "HBX-3", "IG", "IG/S-19", "IO", "M-20/S-4", "M-30", "M-40", "M-40/S-4", "OS (AF)", "OS (AMP)", "OS (CP)", "OS (LP)", "OS (LP)/S-10", "OS (LP)/S-4", "OS (NP)", "OS (NP)/S-10", "OS (NP)/S-12", "OS (NP)/S-20", "OS (NP)/S-4", "OS (PMP)", "OS (RCA)", "OS (RCA)/S-10", "OS (RCA)/S-10/S-11", "OS (RCA)/S-11", "OS (RCA)/S-4", "OS (RSP)", "OS (SU)", "OS (SU)/S-4", "OS(CP)/S-20", "OS(LP)/S-4", "OS(NP)/S-20", "OS(PMP)", "R-80", "RD-1", "RD-1/S-20", "RD-2", "RD-2/S-20", "RH-1", "RH-1/S-10", "RH-1/S-10/S-11", "RH-1/S-11", "RH-2", "RH-2/S-10", "RH-2/S-10/S-11", "RH-2/S-11", "RH-3", "RH-3/S-10", "RH-3/S-10/S-11", "RH-3/S-11", "RH-4", "RH-4/S-10", "RH-4/S-10/S-11", "RH-4/S-11", "RM-1", "RM-1/S-12", "RM-2", "RM-2/C", "RM-2/S-10", "RM-2/S-20", "RM-2/S-7", "RM-3", "RM-3/C", "RM-3/D-BR", "RM-3/S-12", "RM-3/S-20", "RM-4", "RM-4/C", "RM-4/C/S-20", "RM-4/D-BR", "RM-4/S-12", "RM-4/S-20", "RU-1", "RU-1/S-12", "RU-1/S-20", "RU-2", "RU-2/S-12", "RU-3", "RU-3/D-BR", "RU-3/S-12", "RU-3/S-20", "RU-3/S-7/S-12", "RU-4", "RU-4/D-BR", "RU-5", "S-1", "S-15", "S-2", "S-3", "Wood Street"
