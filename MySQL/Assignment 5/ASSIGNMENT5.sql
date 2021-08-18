-- Question 1: Tạo view có chứa danh sách nhân viên thuộc phòng ban sale
-- C1
CREATE VIEW Sale_persion AS
	SELECT *
	FROM Deparment AS d 
	JOIN `Account` AS a ON d.DeparmentID = a.DeparmentID
	WHERE DeparmentNAME = 'Sale';
    
-- C2 
SELECT a.FullName
FROM Deparment AS D
JOIN `Account` AS A ON D.DeparmentID = A.DeparmentID
WHERE D.DeparmentID = (	SELECT 	D1.DeparmentID
			FROM 	Deparment D1
			WHERE 	D1.DeparmentNAME = 'Sale');

-- Question 2: Tạo view có chứa thông tin các account tham gia vào nhiều group nhất
DROP VIEW IF EXISTS  Participants ;
CREATE VIEW Participants AS 
	SELECT G.GroupID ,G.GroupNAME,COUNT(AccountID)  AS SO_LUONG 
	FROM `Group` AS G 
	JOIN GroupAccount AS GA ON G.GroupID = GA.GroupID  
	GROUP BY GA.GroupID 
	ORDER BY  COUNT(AccountID) DESC  
	LIMIT 1;
	


-- Question 3: Tạo view có chứa câu hỏi có những content quá dài (content quá 300 từ được coi là quá dài) và xóa nó đi
DROP VIEW IF EXISTS Conten_tren_18_kitu ;
CREATE VIEW Conten_tren_18_kitu AS
SELECT * 
FROM Question
WHERE LENGTH(content)>10;

SELECT *
FROM Conten_tren_18_kitu;

DELETE 
FROM Conten_tren_18_kitu;

-- Question 4: Tạo view có chứa danh sách các phòng ban có nhiều nhân viên nhất

