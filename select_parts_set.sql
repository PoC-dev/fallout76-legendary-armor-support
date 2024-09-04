-- This is the main analyzing SQL.
SELECT '' AS Part,
       torso.attrtxt_short_en,
       torso.part_name,
       torso.attrtxt_1star,
       torso.attrtxt_2star,
       torso.attrtxt_3star,
       '' AS Part,
       left_arm.attrtxt_short_en,
       left_arm.part_name,
       left_arm.attrtxt_1star,
       left_arm.attrtxt_2star,
       left_arm.attrtxt_3star,
       '' AS Part,
       right_arm.attrtxt_short_en,
       right_arm.part_name,
       right_arm.attrtxt_1star,
       right_arm.attrtxt_2star,
       right_arm.attrtxt_3star,
       '' AS Part,
       left_leg.attrtxt_short_en,
       left_leg.part_name,
       left_leg.attrtxt_1star,
       left_leg.attrtxt_2star,
       left_leg.attrtxt_3star,
       '' AS Part,
       right_leg.attrtxt_short_en,
       right_leg.part_name,
       right_leg.attrtxt_1star,
       right_leg.attrtxt_2star,
       right_leg.attrtxt_3star,
       '' AS Scores,
       torso.attrprio_1star + torso.attrprio_2star + torso.attrprio_3star score_torso,
       left_arm.attrprio_1star + left_arm.attrprio_2star + left_arm.attrprio_3star score_left_arm,
       right_arm.attrprio_1star + right_arm.attrprio_2star + right_arm.attrprio_3star score_right_arm,
       left_leg.attrprio_1star + left_leg.attrprio_2star + left_leg.attrprio_3star score_left_leg,
       right_leg.attrprio_1star + right_leg.attrprio_2star + right_leg.attrprio_3star score_right_leg,
       torso.attrprio_1star + torso.attrprio_2star + torso.attrprio_3star + left_arm.attrprio_1star + left_arm.attrprio_2star + left_arm.attrprio_3star + right_arm.attrprio_1star + right_arm.attrprio_2star + right_arm.attrprio_3star + left_leg.attrprio_1star + left_leg.attrprio_2star + left_leg.attrprio_3star + right_leg.attrprio_1star + right_leg.attrprio_2star + right_leg.attrprio_3star score
FROM
  (SELECT ap.parts_name_en AS part_name,
          apu.parts_id AS parts_id,
          apu.attrid_1star AS attrid_1star,
          ppu1.attrprio AS attrprio_1star,
          attr1.attrtxt_short_en AS attrtxt_short_en,
          attr1.attrtxt_en AS attrtxt_1star,
          apu.attrid_2star AS attrid_2star,
          ppu2.attrprio AS attrprio_2star,
          attr2.attrtxt_en AS attrtxt_2star,
          apu.attrid_3star AS attrid_3star,
          ppu3.attrprio AS attrprio_3star,
          attr3.attrtxt_en AS attrtxt_3star
   FROM armor_per_user apu
   INNER JOIN armor_parts ap ON ap.parts_id = apu.parts_id
   INNER JOIN prio_per_user ppu1 ON apu.attrid_1star = ppu1.attrid
   INNER JOIN attr attr1 ON apu.attrid_1star = attr1.attrid
   INNER JOIN prio_per_user ppu2 ON apu.attrid_2star = ppu2.attrid
   INNER JOIN attr attr2 ON apu.attrid_2star = attr2.attrid
   INNER JOIN prio_per_user ppu3 ON apu.attrid_3star = ppu3.attrid
   INNER JOIN attr attr3 ON apu.attrid_3star = attr3.attrid
   WHERE ap.parts_name_en = 'Torso' AND apu.user='poc' AND armor_set=1) torso,

  (SELECT ap.parts_name_en AS part_name,
          apu.parts_id AS parts_id,
          apu.attrid_1star AS attrid_1star,
          ppu1.attrprio AS attrprio_1star,
          attr1.attrtxt_short_en AS attrtxt_short_en,
          attr1.attrtxt_en AS attrtxt_1star,
          apu.attrid_2star AS attrid_2star,
          ppu2.attrprio AS attrprio_2star,
          attr2.attrtxt_en AS attrtxt_2star,
          apu.attrid_3star AS attrid_3star,
          ppu3.attrprio AS attrprio_3star,
          attr3.attrtxt_en AS attrtxt_3star
   FROM armor_per_user apu
   INNER JOIN armor_parts ap ON ap.parts_id = apu.parts_id
   INNER JOIN prio_per_user ppu1 ON apu.attrid_1star = ppu1.attrid
   INNER JOIN attr attr1 ON apu.attrid_1star = attr1.attrid
   INNER JOIN prio_per_user ppu2 ON apu.attrid_2star = ppu2.attrid
   INNER JOIN attr attr2 ON apu.attrid_2star = attr2.attrid
   INNER JOIN prio_per_user ppu3 ON apu.attrid_3star = ppu3.attrid
   INNER JOIN attr attr3 ON apu.attrid_3star = attr3.attrid
   WHERE ap.parts_name_en = 'Left Arm' AND apu.user='poc' AND armor_set=1) left_arm,

  (SELECT ap.parts_name_en AS part_name,
          apu.parts_id AS parts_id,
          apu.attrid_1star AS attrid_1star,
          ppu1.attrprio AS attrprio_1star,
          attr1.attrtxt_short_en AS attrtxt_short_en,
          attr1.attrtxt_en AS attrtxt_1star,
          apu.attrid_2star AS attrid_2star,
          ppu2.attrprio AS attrprio_2star,
          attr2.attrtxt_en AS attrtxt_2star,
          apu.attrid_3star AS attrid_3star,
          ppu3.attrprio AS attrprio_3star,
          attr3.attrtxt_en AS attrtxt_3star
   FROM armor_per_user apu
   INNER JOIN armor_parts ap ON ap.parts_id = apu.parts_id
   INNER JOIN prio_per_user ppu1 ON apu.attrid_1star = ppu1.attrid
   INNER JOIN attr attr1 ON apu.attrid_1star = attr1.attrid
   INNER JOIN prio_per_user ppu2 ON apu.attrid_2star = ppu2.attrid
   INNER JOIN attr attr2 ON apu.attrid_2star = attr2.attrid
   INNER JOIN prio_per_user ppu3 ON apu.attrid_3star = ppu3.attrid
   INNER JOIN attr attr3 ON apu.attrid_3star = attr3.attrid
   WHERE ap.parts_name_en = 'Right Arm' AND apu.user='poc' AND armor_set=1) right_arm,

  (SELECT ap.parts_name_en AS part_name,
          apu.parts_id AS parts_id,
          apu.attrid_1star AS attrid_1star,
          ppu1.attrprio AS attrprio_1star,
          attr1.attrtxt_short_en AS attrtxt_short_en,
          attr1.attrtxt_en AS attrtxt_1star,
          apu.attrid_2star AS attrid_2star,
          ppu2.attrprio AS attrprio_2star,
          attr2.attrtxt_en AS attrtxt_2star,
          apu.attrid_3star AS attrid_3star,
          ppu3.attrprio AS attrprio_3star,
          attr3.attrtxt_en AS attrtxt_3star
   FROM armor_per_user apu
   INNER JOIN armor_parts ap ON ap.parts_id = apu.parts_id
   INNER JOIN prio_per_user ppu1 ON apu.attrid_1star = ppu1.attrid
   INNER JOIN attr attr1 ON apu.attrid_1star = attr1.attrid
   INNER JOIN prio_per_user ppu2 ON apu.attrid_2star = ppu2.attrid
   INNER JOIN attr attr2 ON apu.attrid_2star = attr2.attrid
   INNER JOIN prio_per_user ppu3 ON apu.attrid_3star = ppu3.attrid
   INNER JOIN attr attr3 ON apu.attrid_3star = attr3.attrid
   WHERE ap.parts_name_en = 'Left Leg' AND apu.user='poc' AND armor_set=1) left_leg,

  (SELECT ap.parts_name_en AS part_name,
          apu.parts_id AS parts_id,
          apu.attrid_1star AS attrid_1star,
          ppu1.attrprio AS attrprio_1star,
          attr1.attrtxt_short_en AS attrtxt_short_en,
          attr1.attrtxt_en AS attrtxt_1star,
          apu.attrid_2star AS attrid_2star,
          ppu2.attrprio AS attrprio_2star,
          attr2.attrtxt_en AS attrtxt_2star,
          apu.attrid_3star AS attrid_3star,
          ppu3.attrprio AS attrprio_3star,
          attr3.attrtxt_en AS attrtxt_3star
   FROM armor_per_user apu
   INNER JOIN armor_parts ap ON ap.parts_id = apu.parts_id
   INNER JOIN prio_per_user ppu1 ON apu.attrid_1star = ppu1.attrid
   INNER JOIN attr attr1 ON apu.attrid_1star = attr1.attrid
   INNER JOIN prio_per_user ppu2 ON apu.attrid_2star = ppu2.attrid
   INNER JOIN attr attr2 ON apu.attrid_2star = attr2.attrid
   INNER JOIN prio_per_user ppu3 ON apu.attrid_3star = ppu3.attrid
   INNER JOIN attr attr3 ON apu.attrid_3star = attr3.attrid
   WHERE ap.parts_name_en = 'Right Leg' AND apu.user='poc' AND armor_set=1) right_leg
   /* Exclude any duplicate attributes from the resulting set. */
WHERE torso.attrid_1star <> left_arm.attrid_1star
  AND torso.attrid_1star <> right_arm.attrid_1star
  AND torso.attrid_1star <> left_leg.attrid_1star
  AND torso.attrid_1star <> right_leg.attrid_1star
  AND left_arm.attrid_1star <> right_arm.attrid_1star
  AND left_arm.attrid_1star <> left_leg.attrid_1star
  AND left_arm.attrid_1star <> right_leg.attrid_1star
  AND right_arm.attrid_1star <> left_leg.attrid_1star
  AND right_arm.attrid_1star <> right_leg.attrid_1star
  AND left_leg.attrid_1star <> right_leg.attrid_1star
  AND torso.attrid_2star <> left_arm.attrid_2star
  AND torso.attrid_2star <> right_arm.attrid_2star
  AND torso.attrid_2star <> left_leg.attrid_2star
  AND torso.attrid_2star <> right_leg.attrid_2star
  AND left_arm.attrid_2star <> right_arm.attrid_2star
  AND left_arm.attrid_2star <> left_leg.attrid_2star
  AND left_arm.attrid_2star <> right_leg.attrid_2star
  AND right_arm.attrid_2star <> left_leg.attrid_2star
  AND right_arm.attrid_2star <> right_leg.attrid_2star
  AND left_leg.attrid_2star <> right_leg.attrid_2star
  AND torso.attrid_3star <> left_arm.attrid_3star
  AND torso.attrid_3star <> right_arm.attrid_3star
  AND torso.attrid_3star <> left_leg.attrid_3star
  AND torso.attrid_3star <> right_leg.attrid_3star
  AND left_arm.attrid_3star <> right_arm.attrid_3star
  AND left_arm.attrid_3star <> left_leg.attrid_3star
  AND left_arm.attrid_3star <> right_leg.attrid_3star
  AND right_arm.attrid_3star <> left_leg.attrid_3star
  AND right_arm.attrid_3star <> right_leg.attrid_3star
  AND left_leg.attrid_3star <> right_leg.attrid_3star
ORDER BY score DESC
LIMIT 1
