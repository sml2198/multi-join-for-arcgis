-- For joining by multiple attributes in ArcMap
-- See here, Find What NYC Owns in NYC: http://www.sarahmakesmaps.com/blog/2014/7/11/finding-what-nyc-owns-in-nyc
-- One option is to do all this in ArcMap: Add "Borough_1" field to MNMapPLUTO and use field calculator 
-- to make "Borough_1"="1" where "Borough"="MN" to make borough identifier common - 1 for MN - among COP table and MapPLUTO layer -
-- Much faster to do this w SQL:
ALTER TABLE MNMapPLUTO
  ADD Borough_1 SMALLINT
INSERT INTO MNMapPLUTO
  (Borough_1)
  SELECT 1
  WHERE "Borough"="MN";
-- Then quickly run Make Query Layer tool with:
"COP.borough"="MapPLUTO.borough" AND "COP.block"="MapPLUTO.block" AND "COP.lot"="MapPLUTO.lot"
