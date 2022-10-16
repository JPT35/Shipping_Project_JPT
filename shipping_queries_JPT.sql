USE shipping;

SELECT * FROM container;

SELECT * FROM ports;

SELECT * FROM ship;

SELECT containerID, shipName
FROM container
WHERE containerID LIKE 'AAAB%'
ORDER BY shipName ASC;


#Calculating volume of containers, grouped by container ID and ordered by total volume Acsending
SELECT (heightInFeet * widthInFeet * lengthInFeet) AS container_volume, containerID
FROM container
GROUP BY containerID
ORDER BY container_volume ASC;

#Aggregrate Grouping 
SELECT SUM(weightInPounds)AS total_load_weight, shipName
FROM container
GROUP BY shipName
ORDER BY total_load_weight DESC;

#Subqueries
SELECT containerID, shipName
FROM container
WHERE shipName IN (
	SELECT shipName
    FROM ship
    WHERE shipName = 'MOL Enterprise');
    
#Joins
SELECT containerID, p.portName,  s.shipName
FROM container c
JOIN  ship s ON s.shipName = c.shipName
JOIN  ports p ON s.portName = p.portName
ORDER BY portName ASC;

SELECT containerID, captainName,  s.shipName, p.cityLocated
FROM container c
JOIN  ship s ON s.shipName = c.shipName
JOIN  ports p ON s.cityLocated = p.cityLocated
ORDER BY captainName ASC;

SELECT  p.portName,containerID, SUM(weightInPounds) AS totalWeight, s.shipName
FROM container c
JOIN  ship s ON s.shipName = c.shipName
JOIN  ports p ON s.portName = p.portName
GROUP BY containerID
ORDER BY totalWeight ASC;

SELECT containerID, heightInFeet, p.portName,  s.shipName
FROM container c
JOIN  ship s ON s.shipName = c.shipName
JOIN  ports p ON s.portName = p.portName
ORDER BY heightInFeet DESC;

SELECT (heightInFeet * widthInFeet * lengthInFeet) AS container_volume, s.shipName
FROM container c
JOIN  ship s ON s.shipName = c.shipName
ORDER BY container_volume ASC;

SELECT captainName, s.shipName, CONCAT(weightInPounds,"lbs"," ", containerID) AS containerAndWeight
FROM ship s, container c
WHERE weightInPounds > 8000;

SELECT  weightInPounds, CONCAT(captainName,":"," ","Captain of: "," ", s.shipName, " ","Crew Memebers: "," ",numberOfCrew)AS transporter
FROM ship s, container c
WHERE weightInPounds > 8000
ORDER BY captainName DESC;

SELECT  CONCAT(captainName," ", containerID) AS inPosessionOF, c.shipName
FROM ship s, container c
WHERE s.shipName = c.shipName
ORDER BY captainName ASC;














