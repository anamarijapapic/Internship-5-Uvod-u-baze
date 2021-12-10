CREATE DATABASE Hospital

USE Hospital


CREATE TABLE PatientWards (
	WardNumber int PRIMARY KEY
)

CREATE TABLE OperatingRooms (
	OperatingRoomNumber int PRIMARY KEY
)

CREATE TABLE Patients (
	Oib nvarchar(11) PRIMARY KEY CHECK (LEN(Oib) = 11),
	Name nvarchar(50) NOT NULL,
	Surname nvarchar(50) NOT NULL,
	DateOfBirth datetime2 NOT NULL,
	PlaceOfBirth nvarchar(50) NOT NULL,
	Address nvarchar(50) NOT NULL,
	PlaceOfResidence nvarchar(50) NOT NULL,
	PhoneNumber nvarchar(50) NOT NULL,
	WardNumber int FOREIGN KEY REFERENCES PatientWards(WardNumber) NOT NULL,
	DateOfCheckIn datetime2 NOT NULL
)

CREATE TABLE Nurses (
	Oib nvarchar(11) PRIMARY KEY CHECK (LEN(Oib) = 11),
	Name nvarchar(50) NOT NULL,
	Surname nvarchar(50) NOT NULL,
	DateOfBirth datetime2 NOT NULL,
	PlaceOfBirth nvarchar(50) NOT NULL,
	Address nvarchar(50) NOT NULL,
	PlaceOfResidence nvarchar(50) NOT NULL,
	PhoneNumber nvarchar(50) NOT NULL,
	WardNumber int FOREIGN KEY REFERENCES PatientWards(WardNumber),
	OperatingRoomNumber int FOREIGN KEY REFERENCES OperatingRooms(OperatingRoomNumber)
)

CREATE TABLE Specializations (
	Id int IDENTITY(1,1) PRIMARY KEY,
	NameOfSpecialization nvarchar(50) NOT NULL UNIQUE
)

CREATE TABLE Surgeons (
	Oib nvarchar(11) PRIMARY KEY CHECK (LEN(Oib) = 11),
	Name nvarchar(50) NOT NULL,
	Surname nvarchar(50) NOT NULL,
	DateOfBirth datetime2 NOT NULL,
	PlaceOfBirth nvarchar(50) NOT NULL,
	Address nvarchar(50) NOT NULL,
	PlaceOfResidence nvarchar(50) NOT NULL,
	PhoneNumber nvarchar(50) NOT NULL,
	SpecializationId int FOREIGN KEY REFERENCES Specializations(Id) NOT NULL
)

CREATE TABLE SurgeryTypes (
	Id int IDENTITY(1,1) PRIMARY KEY,
	NameOfSurgeryType nvarchar(50) NOT NULL UNIQUE
)

CREATE TABLE Surgeries (
	Id int IDENTITY(1,1) PRIMARY KEY,
	SurgeryType int FOREIGN KEY REFERENCES SurgeryTypes(Id) NOT NULL,
	PatientOib nvarchar(11) FOREIGN KEY REFERENCES Patients(Oib) NOT NULL,
	SurgeonOib nvarchar(11) FOREIGN KEY REFERENCES Surgeons(Oib) NOT NULL,
	DateAndTimeOfSurgery datetime2 NOT NULL,
	OperatingRoomNumber int FOREIGN KEY REFERENCES OperatingRooms(OperatingRoomNumber) NOT NULL,
)


INSERT INTO PatientWards(WardNumber) VALUES
(4),
(7),
(104),
(107),
(204),
(207)

INSERT INTO OperatingRooms(OperatingRoomNumber) VALUES
(1),
(5),
(101),
(105)

INSERT INTO Patients(Oib, Name, Surname, DateOfBirth, PlaceOfBirth, Address, PlaceOfResidence, PhoneNumber, WardNumber, DateOfCheckIn) VALUES
('00541223698', 'Ivan', 'Mažuraniæ', '1963-11-1', 'Rijeka', 'Korzo 48', 'Rijeka', '0998563214', 4, '2021-12-7'),
('76320088142', 'Marija', 'Juriæ', '1980-4-27', 'Zagreb', 'Mažuraniæevo šetalište 15', 'Split', '0926668745', 4, '2021-12-7'),
('31248907511', 'Antun', 'Matoš', '1992-2-2', 'Split', 'Zrinsko Frankopanska 21', 'Split', '0992634875', 7, '2021-12-7'),
('08975521113', 'Ivana', 'Brliæ', '1970-9-10', 'Split', 'Zagrebaèka 2', 'Split', '0912258961', 7, '2021-12-8'),
('42221639875', 'Petar', 'Preradoviæ', '2000-7-3', 'Split', 'Put Supavla 1', 'Split', '0917613540', 7, '2021-12-8'),
('68395776030', 'Dinko', 'Šimunoviæ', '1985-12-12', 'Split', 'Zvonimirova 11', 'Solin', '0985682413', 104, '2021-12-8'),
('48963005872', 'Vesna', 'Parun', '1977-8-15', 'Šibenik', 'Marmontova ulica 13', 'Split', '0971178452', 104, '2021-12-8'),
('11904370761', 'Ranko', 'Marinkoviæ', '1964-5-17', 'Split', 'Cvjetni trg 1', 'Zagreb', '0955557368', 107, '2021-12-9'),
('33337005961', 'Marko', 'Maruliæ', '1999-6-22', 'Split', 'Ulice slobode 30', 'Split', '0913035977', 204, '2021-12-9'),
('52520087255', 'Janko', 'Poliæ', '1996-11-2', 'Split', 'Držiæeva 7', 'Solin', '0950796338', 204, '2021-12-9')

INSERT INTO Nurses(Oib, Name, Surname, DateOfBirth, PlaceOfBirth, Address, PlaceOfResidence, PhoneNumber, WardNumber, OperatingRoomNumber) VALUES
('96336897545', 'Ana', 'Aniæ', '1983-3-10', 'Split', 'Šoltanska 1', 'Split', '0922856413', 4, 1),
('06504498311', 'Iva', 'Iviæ', '1990-9-14', 'Zadar', 'Vukovarska 109', 'Split', '09128827445', NULL, 1),
('22001988006', 'Petra', 'Petriæ', '1973-1-23', 'Split', 'Solinska 56', 'Split', '0916784521', 7, NULL),
('88912007830', 'Mara', 'Mariæ', '1996-10-17', 'Zagreb', 'Braèka 4', 'Split', '0954201122', NULL, 5), 
('20305576891', 'Luce', 'Luèiæ', '1988-6-30', 'Split', 'Viška 20', 'Split', '0997102867', 104, 101)

INSERT INTO Specializations(NameOfSpecialization) VALUES
('Ortopedija i traumatologija'),
('Plastièna, rekonstrukcijska i estetska kirurgija'),
('Neurokirurgija'),
('Vaskularna kirurgija'),
('Kardijalna kirurgija')

INSERT INTO Surgeons(Oib, Name, Surname, DateOfBirth, PlaceOfBirth, Address, PlaceOfResidence, PhoneNumber, SpecializationId) VALUES
('34102766550', 'Vlaho', 'Bukovac', '1978-4-1', 'Zagreb', 'Gunduliæeva 33a', 'Split', '0982476110', 1),
('06098813211', 'Emanuel', 'Vidoviæ', '1986-11-16', 'Split', 'Narodni trg 6', 'Split', '0925250042', 2),
('17485962300', 'Ivan', 'Meštroviæ', '1982-1-6', 'Split', 'Tolstojeva 16', 'Split', '0996207848', 3),
('52000813976', 'Slava', 'Raškaj', '1980-5-25', 'Zagreb', 'Šenoina 80', 'Zagreb', '0997830121', 4),
('22687903125', 'Miroslav', 'Kraljeviæ', '1983-8-20', 'Gospiæ', 'Teslina 4', 'Rijeka', '0918132207', 5)

INSERT INTO SurgeryTypes(NameOfSurgeryType) VALUES
('amputacija ekstremiteta'),
('zbrinjavanje ozljeda tetiva i mišiæa'),
('obrada opekline'),
('intradermalni šav rane'),
('zbrinjavanje ozljeda neurokranija'),
('operacija tumora'),
('operacija karotida'),
('preparacija velikih žila'),
('drenaža toraksa'),
('ugradnja pacemakera')

INSERT INTO Surgeries(SurgeryType, PatientOib, SurgeonOib, DateAndTimeOfSurgery, OperatingRoomNumber) VALUES
(1, '00541223698', '34102766550', '2021-12-8 8:30:00', 1),
(3, '76320088142', '06098813211', '2021-12-8 9:00:00', 5),
(5, '76320088142', '17485962300', '2021-12-8 12:00:00', 101),
(7, '31248907511', '52000813976', '2021-12-8 12:00:00', 105),
(9, '08975521113', '22687903125', '2021-12-8 16:00:00', 1),
(2, '42221639875', '34102766550', '2021-12-9 11:00:00', 1),
(4, '68395776030', '06098813211', '2021-12-9 11:00:00', 5),
(6, '48963005872', '17485962300', '2021-12-9 14:00:00', 101),
(8, '11904370761', '52000813976', '2021-12-10 8:00:00', 105),
(10, '33337005961', '22687903125', '2021-12-10 10:30:00', 1),
(1, '33337005961', '34102766550', '2021-12-10 12:00:00', 5),
(3, '52520087255', '06098813211', '2021-12-10 15:30:00', 5)


SELECT * FROM Surgeries WHERE CAST(DateAndTimeOfSurgery AS date) = '2021-12-8' ORDER BY DateAndTimeOfSurgery

SELECT Name, Surname FROM Surgeons WHERE PlaceOfBirth != 'Split'

UPDATE Nurses SET WardNumber = 204 WHERE WardNumber = 4
SELECT * FROM Nurses

SELECT Oib, Name, Surname FROM Patients WHERE WardNumber = 7 ORDER BY Surname DESC

SELECT * FROM Surgeries WHERE CAST(DateAndTimeOfSurgery AS date) = CAST(GETDATE() AS date)