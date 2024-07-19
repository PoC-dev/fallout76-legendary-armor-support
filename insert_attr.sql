-- This ist just a translation table between IDs and legendary attributes text.
INSERT INTO attr (attrid, attrtxt_de, attrtxt_short_de, attrtxt_en, attrtxt_short_en) VALUES
(100, '+0,5% Heilung (HP)', '[Regenerierend]', 'Slowly regenerate health while not in combat', '[Regenerating]'),
(101, '+10 Schadens- und Energieresistenz bei Mutation', '[Des Mutanten]', '+10 Damage Resistance and Energy Resistance if you are mutated', '[Mutant''s]'),
(102, '+40 Schadensresistenz bei Nacht', '[Nachtaktiv]', 'Damage and Energy Resistance increase at night', '[Nocturnal]'),
(103, '-15% Schaden durch Ghule', '[Des Ghultöters]', '-15% damage from ghouls', '[Ghoul Slayer''s]'),
(104, '-15% Schaden durch Verbrannte', '[Des Fanatikers]', '-15% damage from Scorched', '[Zealot''s]'),
(105, '-15% Schaden durch Menschen', '[Des Killers]', '-15% damage from Humans', '[Assassin''s]'),
(106, '-15% Schaden durch Mirelurks/Insekten', '[Des Kammerjägers]', '-15% damage from Mirelurks and bugs', '[Exterminator''s]'),
(107, '-15% Schaden durch Roboter', '[Des Problemlösers]', '-15% damage from robots', '[Troubleshooter''s]'),
(108, '-15% Schaden durch Tiere', '[Des Jägers]', '-15% damage from animals', '[Hunter''s]'),
(109, '-6% Schaden ohne Hunger+Durst', '[Des Vielfraßes]', 'Increases Damage Reduction up to 6% as you fill your hunger and thirst meters', '[Overeater''s]'),
(110, '-90% Gewicht', '[Schwerelos]', 'Weighs 90% less and does not count as armor for the Chameleon mutation', '[Weightless]'),
(111, 'Max +3 auf alle SPECIALs bei wenig Gesundheit', '[Unnachgiebig]', 'Gain up to +3 to all stats (except END) when low health', '[Unyielding]'),
(112, 'Max +35 Schadensresistenz bei guter Gesundheit', '[Der Vorhut]', 'Grants up to +35 Energy Resistance and Damage Resistance, the higher your health', '[Vanguard''s]'),
(113, 'Max +35 Schadensresistenz bei wenig Gesundheit', '[Stärkend]', 'Grants up to +35 Energy Resistance and Damage Resistance, the lower your health', '[Bolstering]'),
(114, 'Nahkampfschaden = Unsichtbar (alle 30s)', '[Getarnt]', 'Being hit in melee generates a Stealth Field once per 30 seconds', '[Cloaking]'),
(115, 'Unsichtbar beim Stillstehen', '[Chamäleon]', 'Blend with the environment while sneaking and not moving', '[Chameleon]'),
(116, 'Verwendet automatisch alle 60 Sekunden ein Stimpak, wenn du getroffen wirst und deine Gesundheit bei 25% oder weniger liegt', '[Auto-Stim]', 'Automatically use a Stimpak when hit while health is 25% or less, once every 60 seconds', '[Auto Stim]'),
(117, 'Max +20 Schadensresistenz (Ballistisch,Energie) je mehr Kronkorken', '[Des Aristokraten]', 'Grants up to +20 Energy Resistance and Damage Resistance, the higher your caps', '[Aristocrat''s]'),
(118, 'Wenn du ausgeschaltet bist, erhältst einmal pro Minute eine Chance von 50%, dich mit einem Stimpak selbst wiederzubeleben', '[Lebensrettend]', 'When incapacitated, gain a 50% chance to revive yourself with a Stimpak, once every minute', '[Life Saving]'),
(119, '-15% Schaden durch Supermutanten', '[Des Mutantentöters]', '-15% damage from Super Mutants', '[Mutant Slayer''s]'),
(200, '+1A', NULL, '+1 Agility', NULL),
(201, '+1E', NULL, '+1 Endurance', NULL),
(202, '+1L', NULL, '+1 Luck', NULL),
(203, '+1P', NULL, '+1 Perception', NULL),
(204, '+1S', NULL, '+1 Strength', NULL),
(205, '+25 Feuerresistenz', NULL, '+25 Fire Resistance', NULL),
(206, '+25 Giftresistenz', NULL, '+25 Poison Resistance', NULL),
(207, '+25 Kryoresistenz', NULL, '+25 Cryo Resistance', NULL),
(208, '+25 Strahlungsresistenz', NULL, '+25 Radiation Resistance', NULL),
(209, '+5% AP-Regeneration', NULL, 'Increases Action Point refresh speed', NULL),
(210, '-10% Zunahme von Hunger und Durst', NULL, 'Hunger and Thirst grow 10% slower', NULL),
(211, '-25% Erkrankungschance', NULL, '+25% Environmental Disease Resistance', NULL),
(212, '-7% Schaden durch Explosionen', NULL, 'Receive 7% less explosion damage', NULL),
(213, '+1C', NULL, '+1 Charisma', NULL),
(214, '+1I', NULL, '+1 Intelligence', NULL),
(300, '+2 Schlossknackbereich', NULL, 'Increases size of sweet-spot while picking locks', NULL),
(301, '+5% Effektivität von Stimpacks, RadAway und RadX', NULL, 'Stimpaks, RadAway, and Rad-X are 5% more effective', NULL),
(302, '-15% Körperteilschaden', NULL, 'Receive 15% less limb damage', NULL),
(303, '-15% Schaden beim Blocken', NULL, 'Reduces damage while blocking by 15%', NULL),
(304, '-20% Gewicht von Munition', NULL, 'Ammo weight reduced by 20%', NULL),
(305, '-20% Gewicht von Nahrung und Chems', NULL, 'Food, drink, and chem weights reduced by 20%', NULL),
(306, '-20% Gewicht von Schrott', NULL, 'Junk item weights reduced by 20%', NULL),
(307, '-20% Gewicht von Waffen', NULL, 'Weapon weights reduced by 20%', NULL),
(308, '-25% Geräusche beim Schleichen/Entdeckungschance', NULL, 'Become harder to detect while sneaking', NULL),
(309, '-50% Fallschaden', NULL, 'Reduces falling damage by 50%', NULL),
(310, '+0,25% Regeneration von Strahlungsschaden', NULL, 'Slowly regen radiation damage while not in combat', NULL),
(311, '+5% Chance, Nahkampfangreifern 4x12 Energieschaden/s zuzufügen', NULL, '5% chance to deal 100 Energy DMG to melee attackers', NULL),
(312, '+5% Chance, Nahkampfangreifern 4x12 Feuerschaden/s zuzufügen', NULL, '5% chance to deal 100 Fire DMG to melee attackers', NULL),
(313, '+5% Chance, Nahkampfangreifern 4x12 Giftschaden/s zuzufügen', NULL, '5% chance to deal 100 Poison DMG to melee attackers', NULL),
(314, '+5% Chance, Nahkampfangreifern 4x12 Kälteschaden/s zuzufügen', NULL, '5% chance to deal 100 Frost DMG to melee attackers', NULL),
(315, '+50% Haltbarkeit', NULL, 'Breaks 50% slower', NULL),
(316, '+75% Chance auf -15% Schaden beim Sprinten', NULL, '75% chance to reduce damage by 15% while sprinting', NULL),
(317, '+75% Chance auf -15% Schaden beim Stillstehen', NULL, '75% chance to reduce damage by 15% while standing still', NULL),
(318, 'Unterwasser-Atmung', NULL, 'Grants the ability to breathe underwater', NULL);
