UPDATE creature_template SET mindmg = mindmg * 7, maxdmg = maxdmg * 7 WHERE unit_class != 0 AND attackpower != 0;
UPDATE creature_template SET mindmg = (mindmg - (mindmg MOD 1)) WHERE (mindmg MOD 1) < 0.5 AND (mindmg MOD 1) > 0;
UPDATE creature_template SET mindmg = (maxdmg - (maxdmg MOD 1)) WHERE (maxdmg MOD 1) < 0.5 AND (maxdmg MOD 1) > 0;
UPDATE creature_template SET mindmg = (mindmg - (mindmg MOD 1) + 1) WHERE (mindmg MOD 1) > 0;
UPDATE creature_template SET maxdmg = (maxdmg - (maxdmg MOD 1) + 1) WHERE (maxdmg MOD 1) > 0;