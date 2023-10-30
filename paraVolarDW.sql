

create database paraVolar
go

use paraVolar
go



---Table: DimAirline

create table DimAirline(
   AirlineKey           int                  not null,
   AirlineId            int                  null,
   Code                 char(75)              null,
   Descripcion          char(100)             null,
   constraint pk_DimAirline primary key (AirlineKey)
)
go


---Table: DimDate

create table DimDate(
   DateKey              int                  not null,
   DateId               int                  null,
   Year                char(4)              null,
   Quarter             char(2)              null,
   Month               char(2)              null,
   DayOfMonth          char(2)              null,  
   DayOfWeek           char(2)              null,
   FligtDate           char(10)             null,
   constraint pk_DimDate primary key (DateKey)
)
go


---Table: DimDestination 

create table DimDestination (
   DestinationKey              int                  not null,
   DestinationAirpotId         int                  null,
   Destination                 char(75)             null,
   DestinationCityName         char(75)             null,
   DestinationState            char(75)             null,
   constraint pk_DimDestination primary key (DestinationKey)
)
go


---Table: DimOrigin

create table DimOrigin (
   OriginKey            int                  not null,
   OriginAirportId      int                  null,
   Origin               char(75)             null,
   OriginCityName       char(75)             null,
   OriginStateName      char(75)             null,
   constraint pk_DimOrigin primary key (OriginKey)
)
go


---Table: FlightFact

create table FlightFact (
   FlightKey            int                  not null,
   AirlineKey           int                  null,
   DateKey              int                  null,
   DestinationKey       int                  null,
   OriginKey            int                  null,
   Cancelled             char(75)             null,
   Diverted             char(75)             null,
   DepDelay            char(75)             null,
   SecurityDelay        char(75)             null,
   ArrDelay             char(75)             null,
   CarrierDelay             char(75)             null,
   WeatherDelay             char(75)             null,
   NASDelay             char(75)             null,
   LateAircraftDelay             char(75)             null,
   constraint pk_FlightFact primary key (FlightKey)

)
go

create nonclustered index RELATIONSHIP_1_FK on FlightFact (AirlineKey ASC)
go


create nonclustered index RELATIONSHIP_2_FK on FlightFact (DateKey ASC)
go


create nonclustered index RELATIONSHIP_3_FK on FlightFact (OriginKey ASC)
go

create nonclustered index RELATIONSHIP_4_FK on FlightFact (DestinationKey ASC)
go

alter table FlightFact
   add constraint fk_FlightFact_Relations_DimAirline foreign key (AirlineKey)
      references DimAirline (AirlineKey)
go

alter table FlightFact
   add constraint fk_FlightFact_Relations_DimDate foreign key (DateKey)
      references DimDate (DateKey)
go

alter table FlightFact
   add constraint fk_FlightFact_Relations_DimOrigin foreign key (OriginKey)
      references DimOrigin (OriginKey)
go

alter table FlightFact
   add constraint fk_FlightFact_Relations_DimDestination foreign key (DestinationKey)
      references DimDestination (DestinationKey)
go


