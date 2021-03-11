CREATE DATABASE BAITHI
USE BAITHI
CREATE TABLE PHIM(
	MAPHIM char(4),
	TENPHIM varchar(50),
	DAODIEN varchar(30),
	IMDB float,
	PRIMARY KEY (MAPHIM))
CREATE TABLE GHE(
	MAGHE char(4),
	RAP int,
	LOAIGHE varchar(20),
	SOGHE varchar(4),
    TRANGTHAI varchar(20),
	PRIMARY KEY (MAGHE))
CREATE TABLE DATVE(
	MADV varchar(20),
	MAPHIM char(4),
	NGAYDAT smalldatetime,
	TONGCONG money,
	PRIMARY KEY (MADV))
CREATE TABLE CTDV(
	MADV varchar(20),
	MAGHE char(4),
    GIAGHE money,
	PRIMARY KEY (MADV,MAGHE))
ALTER TABLE CTDV ADD
CONSTRAINT FK_CT_DV FOREIGN KEY (MADV) REFERENCES DATVE(MADV),
CONSTRAINT FK_CT_G FOREIGN KEY (MAGHE) REFERENCES GHE(MAGHE)
--NHAP DU LIEU
--PHIM
INSERT INTO PHIM VALUES ('P327','Wonder Woman 1984 (2020)','Patty Jenkins',7.0)
INSERT INTO PHIM VALUES ('P853','Demon Slayer the Movie: Mugen Train (2020)', 'Haruo Sotozaki', 8.3)
INSERT INTO PHIM VALUES ('P162','Tenet (2020)', 'Christopher Nolan', 7.6)
--GHE 
INSERT INTO GHE VALUES ('G40',2,'VIP','G11','Còn trống')
INSERT INTO GHE VALUES ('G73',4,'Thường','B07','Đã đặt')
INSERT INTO GHE VALUES ('G84',7,'Đôi','O05','Còn trống')
--DATVE
INSERT INTO DATVE VALUES ('DV2jas9hf', 'P327', 15/11/2020, 150000)
INSERT INTO DATVE VALUES ('DV893jf9r', 'P162', 25/12/2020, 240000)
INSERT INTO DATVE VALUES ('DV0x010ke', 'P327', 26/10/2020, 145000)
--CTDV
INSERT INTO CTDV VALUES ('DV2jas9hf', 'G40', 80000)
INSERT INTO CTDV VALUES ('DV2jas9hf', 'G73', 70000)
INSERT INTO CTDV VALUES ('DV0x010ke', 'G84', 145000)
--3. Hiện thực ràng buộc toàn vẹn sau: Rạp từ 1 đến 6 không có loại ghế Đôi (1đ).
CREATE TRIGGER TRG_RAP_GHEDOI ON GHE
FOR INSERT,UPDATE 
AS 
BEGIN 
	--SO SANH
	IF EXISTS (
		SELECT *
		FROM INSERTED, GHE
		WHERE INSERTED.MAGHE = GHE.MAGHE AND INSERTED.RAP >= 1 AND INSERTED.RAP <= 6 AND INSERTED.LOAIGHE = 'Đôi'
	)
	BEGIN
		--BAO LOI 
		RAISERROR('LOI: LOAI GHE KHONG HOP LE!', 16, 1);
		--KHOI PHUC LAI TRANG THAI TRUOC DO
		ROLLBACK TRANSACTION
	END
	ELSE
	BEGIN
		--THONG BAO HOP LE
		PRINT('THEM MOI GHE THANH CONG!')
	END
END 
--4. Hiện thực ràng buộc toàn vẹn sau: Mỗi mã đặt vé không được đặt quá 10 ghế đơn (Loại ghế là Thường hoặc VIP) (2đ).
CREATE TRIGGER TRG_CTDV ON CTDV
FOR INSERT,UPDATE 
AS 
BEGIN 
	--SO SANH
	IF EXISTS (
		SELECT *
		FROM INSERTED, CTDV,GHE
		WHERE INSERTED.MADV = CTDV.MADV AND GHE.MAGHE = CTDV.MAGHE AND (GHE.LOAIGHE IN( 'Thường' ,'VIP'))
        AND 
	)
	BEGIN
		--BAO LOI 
		RAISERROR('LOI: LOAI GHE KHONG HOP LE!', 16, 1);
		--KHOI PHUC LAI TRANG THAI TRUOC DO
		ROLLBACK TRANSACTION
	END
	ELSE
	BEGIN
		--THONG BAO HOP LE
		PRINT('THEM MOI GHE THANH CONG!')
	END
END 
--5. Tìm thông tin các ghế được đặt của các phim có số điểm IMDb lớn hơn hoặc bằng 7.5,
-- kết quả được sắp xếp tăng dần theo số ghế (1đ).
SELECT * 
FROM (GHE G JOIN CTDV CT ON G.MAGHE = CT.MAGHE) JOIN DATVE DV ON DV.MADV = CT.MADV JOIN PHIM P ON P.MAPHIM = DV.MAPHIM
WHERE P.IMDB >= 7.5
ORDER BY G.SOGHE

--6. Tìm ghế được đặt để xem nhiều phim nhất trong năm 2020 (1đ).
SELECT TOP 1 CT.MAGHE, COUNT(CT.MAGHE) AS SL
FROM CTDV CT JOIN DATVE DV ON CT.MADV = DV.MADV
WHERE YEAR(DV.NGAYDAT) = '2020' 
GROUP BY CT.MAGHE
ORDER BY SL ASC

--8. Tìm phim mà tất cả các ghế VIP đều được đặt (1đ).
SELECT MAPHIM
FROM CTDV JOIN DATVE ON CTDV.MADV = DATVE.MADV JOIN GHE ON CTDV.MAGHE = GHE.MAGHE
WHERE GHE.LOAIGHE = 'VIP'

SELECT MAPHIM
FROM PHIM

