This collection of SQLs should aid a user in selecting a set of pieces from given armor in the Fallout 76 game with the best possible selection of subjectively most desired so called legendary attributes. Those grant certain more or less helpful additional effects to the player character than just protection from damage.

The specific reason to come up with this was my discovery that crafting Secret Service Armor parts in Fallout 76 did not consume rare legendary cores, but only one legendary module per crafted part. Parts thus are relatively cheap to create and lightweight enough to keep in my stash box in large amounts. But how to deduce what I perceive the best set of armor with all the attributes I crave the most?

Well, I'm owning a computer! Let it compute instead of me scratching my head and trying out seemingly random combinations over and over.

Many thanks to a *please-don't-mention-me* friend of mine for refining my initial tries of an SQL based solution for the given problem.

All files are released to the public domain.

## About Legendary Armor Attributes
Legendary attributes are grouped into primary, secondary and tertiary. This is reflected in the *attr* table:
- Primary (one star) attributes have attribute IDs from 100..199
- Secondary (two stars) attributes have attribute IDs from 200..299
- Tertiary (three stars) attributes have attribute IDs from 300..399

The set of legendary attributes is randomly assigned to a given piece at acquisition time (crafting/looting). Up to three different sets of over a dozen of attributes for each "star group" provide up to 5700 possible combinations of legendary effects. See here for details: [Fallout-Wiki: Legendary Armor Effects](https://fallout.fandom.com/wiki/Fallout_76_legendary_armor_effects).

## Database
To not overly limit usage to certain platforms, or come up with the need of installing a DBMS, the whole thing is based on Sqlite3, but has been developed and tested with MariaDB 5.5.

Table definitions can be found in *tabledef-mariadb.sql* and *tabledef-sqlite.sql* respectively. The definition(s) can simply be copy-pasted into an appropriate prompt of the respective DMBS, or fed to stdin.

The *attr* and *armor_parts* tables are not user specific and must be filled with the content derived from the game data, and provided for convenience, while *armor_per_user* and *prio_per_user* are, and have to be customized by the user. Example content is provided, though.

Create and populate database for SQLite:
```
cat tabledef-sqlite.sql insert_* |sqlite3 fallout76legendary.sqlite
```
Create and populate database for MariaDB:
```
mysqladmin create fallout76legendary
cat tabledef-mysql.sql insert_* |mysql fallout76legendary
```

## Usage
The user is required to enter his existing collection of armor parts into the *armor_per_user* table. The *armor_set* is used to group a set of given amor. Example: The game doesn't permit to combine regular armor with power armor. This can be used to further limit mixing armor of different classes (e. g. leather armor with combat armor), because both classes do not provide a similar level of player character protection. Protection is the basic purpose of wearing armor, but not related to legendary effects.

**Note:** The translation data in the *attr* and *armor_parts* tables is available in German and English language columns, postfixed *_de* and *_en* respectively. Adjust the selection SQLs accordingly. Default is English for a larger audience's convenience. Pull requests for additional languages are welcome!

Next, the user is required to extract all legendary attributes from the *attr* tables, assign them a relative priority (e. g. from 0 to 100), and populate the *prio_per_user* table with the result.
- To have an attribute considered in any case, assign it a value larger than the sum of the biggest value for each attribute category, e. g. 400
- It's valid to assign the same priority value to multiple entries
- Use the same step value between attribute priorities. Unfortunately, none of the three attribute group's count divides evenly by 100. Using varying steps will affect the eventual result in hard to comprehend ways. Your mileage may vary.

The following SQL can be used to list attributes not considered:
```
SELECT attrid, attrtxt_en FROM attr
  WHERE attrid NOT IN (
    SELECT attrid FROM prio_per_user
      WHERE user='poc'
);
```
The result should be empty, meaning you have considered all attributes.

SQL for listing priorities:
```
SELECT attrprio, attrid, attrtxt_en FROM prio_per_user
 LEFT JOIN attr USING (attrid)
 WHERE user='poc'
  AND attrid >= 100
  AND attrid < 200
 ORDER BY attrprio DESC;
```
- Use >= 100 and < 200 for Tier-1 (1-Star) attributes
- Use >= 200 and < 300 for Tier-2 (2-Star) attributes
- Use >= 300 and < 400 for Tier-3 (3-Star) attributes

Finally, the run the SQL in *select_parts_set.sql* to evaluate the best set of armor. It is using a mathematical concept called [Cartesian Product](https://en.wikipedia.org/wiki/Cartesian_product) to first explode given data to any possible combination (of armor parts), and subsequently limit the output to one row: The highest scoring set of armor. Note: The *user* clause must be changed to the appropriate user being set in the tables.

Legendary attributes stack. If the player character wears multiple pieces granting the same effect, the effect is stronger. Most often, it's desirable to have as many different high-priority effects as possible instead. This grants a larger number and more diverse range of effects. Thus, if a given legendary effect has already been chosen for a given part, the same effect should be excluded from consideration for subsequent parts, granting parts with lesser effect priority to "bubble up" in the selection process. The last `WHERE` block at the end of the SQL is there to eliminate said duplicates.

For SQLite, use:
```
sqlite3 fallout76legendary.sqlite < select_parts_set.sql
```
For MariaDB, use:
```
mysql fallout76legendary < select_parts_set.sql
```
You can adjust the following parameters to your liking:
- `LIMIT` in the last line is set to 1. Set to higher values to get more but less optimal armor sets as output.
- Unfortunately, the resulting output is extremely wide, because an entire set of armor with its defining legendary attributes is output per row. If you're using MariaDB, add a `\G` immediately after the `LIMIT` to change tabular output to a much easier to read line-oriented output. Example:
```
*************************** 1. row ***************************
            Part:
attrtxt_short_en: [Mutant's]
       part_name: Torso
   attrtxt_1star: +10 Damage Resistance and Energy Resistance if you are mutated
   attrtxt_2star: Hunger and Thirst grow 10% slower
   attrtxt_3star: 5% chance to deal 100 Fire DMG to melee attackers
            Part:
attrtxt_short_en: [Troubleshooter's]
       part_name: Left Arm
   attrtxt_1star: -15% damage from robots
   attrtxt_2star: +25 Cryo Resistance
   attrtxt_3star: Ammo weight reduced by 20%
            Part:
attrtxt_short_en: [Regenerating]
       part_name: Right Arm
   attrtxt_1star: Slowly regenerate health while not in combat
   attrtxt_2star: +25 Fire Resistance
   attrtxt_3star: Receive 15% less limb damage
            Part:
attrtxt_short_en: [Assassin's]
       part_name: Left Leg
   attrtxt_1star: -15% damage from Humans
   attrtxt_2star: +25 Poison Resistance
   attrtxt_3star: Food, drink, and chem weights reduced by 20%
            Part:
attrtxt_short_en: [Bolstering]
       part_name: Right Leg
   attrtxt_1star: Grants up to +35 Energy Resistance and Damage Resistance, the lower your health
   attrtxt_2star: +25 Radiation Resistance
   attrtxt_3star: Slowly regen radiation damage while not in combat
          Scores:
     score_torso: 187
  score_left_arm: 234
 score_right_arm: 556
  score_left_leg: 257
 score_right_leg: 553
           score: 1787
```
Interestingly, SQLite almost instantly outputs the result, while MariaDB chews on the data for nearly 20 seconds before generating any output.

----
poc@pocnet.net 2024-07-19
