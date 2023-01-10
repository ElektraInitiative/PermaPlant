CREATE TYPE tag AS ENUM (
  'Leaf crops',  -- German: Blattgemüse
  'Fruit crops', -- German: Fruchtpflanzen
  'Root crops', -- German: Wurzelpflanzen
  'Flowering crops', -- German: Blütenpflanzen
  'Herbs', -- German: Kräuter
  'Other' -- German: Sonstiges
);

CREATE TYPE quality AS ENUM (
  'Organic', -- German: Bio
  'Not organic', -- German: Nicht-Bio
  'Unknown' -- German: unbekannt
);

CREATE TYPE quantity AS ENUM (
  'Nothing', -- German: Nichts
  'Not enough', -- German: Nicht Genug
  'Enough' -- German: Genug
  'More than enough' -- Mehr als genug
);

CREATE TABLE varieties ( -- German: Sorten
  id SERIAL PRIMARY KEY,
  tag tag[] NOT NULL,
  species VARCHAR(255) NOT NULL,
  synonym VARCHAR(255),
  sowing_from smallint, -- January = 1, ... , December = 12
  sowing_to smallint,
  sowing_depth INTEGER, -- depth in cm
  germination_temperature INTEGER,
  prick_out BOOLEAN,
  transplant DATE,
  row_spacing INTEGER,
  plant_spacing INTEGER,
  germination_time SMALLINT, -- in days
  harvest_time DATE,
  location VARCHAR(255),
  care VARCHAR(255),
  height INTEGER,
  CHECK (sowing_from >= 1 sowing_from <= 12)
  CHECK (sowing_to >= 1 sowing_to <= 12)
);

CREATE TABLE seeds (
  id SERIAL PRIMARY KEY,
  tag tag[] NOT NULL,
  species VARCHAR(255) NOT NULL, -- German: Art
  plant_id INTEGER REFERENCES plants(id) NOT NULL,
  harvest_year SMALLINT NOT NULL,
  use_by DATE,
  origin VARCHAR(255),
  taste VARCHAR(255),
  yield VARCHAR(255),
  quantity quantity NOT NULL,
  quality quality,
  price money,
  generation INTEGER,
  notes TEXT
);
