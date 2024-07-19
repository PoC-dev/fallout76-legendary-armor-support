-- This ist just a translation table between IDs and parts text.
CREATE TABLE armor_parts (
  parts_id int NOT NULL,
  parts_name_de text NOT NULL,
  parts_name_en text NOT NULL,
  PRIMARY KEY (parts_id)
);
-- This holds the user's collection of armor parts.
CREATE TABLE armor_per_user (
  user text NOT NULL,
  armor_set int NOT NULL,
  parts_id int NOT NULL,
  attrid_1star int NOT NULL,
  attrid_2star int NOT NULL,
  attrid_3star int NOT NULL
);
-- This ist just a translation table between IDs and legendary attributes text.
CREATE TABLE attr (
  attrid int NOT NULL,
  attrtxt_de text NOT NULL,
  attrtxt_short_de text DEFAULT NULL,
  attrtxt_en text NOT NULL,
  attrtxt_short_en text DEFAULT NULL,
  PRIMARY KEY (attrid)
);
-- This is reflecting an user's preference about the importance/desiredness of legendary attributes.
CREATE TABLE prio_per_user (
  user text NOT NULL,
  attrid int NOT NULL,
  attrprio int NOT NULL
);
