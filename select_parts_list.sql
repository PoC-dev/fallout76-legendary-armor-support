-- List parts as text instead of numeric IDs.
SELECT attr_1star.attrtxt_short_en, parts_name_en AS shortname,
  attr_1star.attrtxt_en AS attr_1star,
  attr_2star.attrtxt_en AS attr_2star,
  attr_3star.attrtxt_en AS attr_3star
FROM armor_per_user
LEFT JOIN armor_parts ON (
  armor_per_user.parts_id = armor_parts.parts_id
)
LEFT JOIN attr attr_1star ON (
  attrid_1star = attr_1star.attrid
  AND attrid_1star >= 100
  AND attrid_1star < 200
)
LEFT JOIN attr attr_2star ON (
  attrid_2star = attr_2star.attrid
  AND attrid_2star >= 200
  AND attrid_2star < 300
)
LEFT JOIN attr attr_3star ON (
  attrid_3star = attr_3star.attrid
  AND attrid_3star >= 300
  AND attrid_3star < 400
)
WHERE armor_per_user.user='poc'
  AND armor_set=1
ORDER BY attrtxt_short_en, shortname
