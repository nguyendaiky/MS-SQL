--------------------------------Lab1--------------------------------
--#PHAN I--
--1--
--Tao Database--
CREATE DATABASE QLBH
USE QLBH
--Table KHACHHANG--
CREATE TABLE KHACHHANG(
	MAKH char(4),
	HOTEN varchar(40),
	DCHI varchar(50),
	SODT varchar(20),
	NGSINH smalldatetime,
	NGDK smalldatetime,
	DOANHSO money,
	PRIMARY KEY (MAKH))
--Table NHANVIEN--
CREATE TABLE NHANVIEN(
	MANV char(4),
	HOTEN varchar(40),
	SODT varchar(20),
	NGVL smalldatetime,
	PRIMARY KEY (MANV))
--Table SANPHAM--
CREATE TABLE SANPHAM(
	MASP char(4),
	TENSP varchar(40),
	DVT varchar(20),
	NUOCSX varchar(40),
	GIA money,
	PRIMARY KEY (MASP))
--Table HOADON--
CREATE TABLE HOADON(
	SOHD int,
	NGHD smalldatetime,
	MAKH char(4),
	MANV char(4),
	TRIGIA money,
	PRIMARY KEY (SOHD))
--Table CTHD--
CREATE TABLE CTHD(
	SOHD int,
	MASP char(4),
	SL int,
	PRIMARY KEY (SOHD,MASP))
--Tao Foreign Key--
ALTER TABLE HOADON ADD
CONSTRAINT FK_HD_KH FOREIGN KEY (MAKH) REFERENCES KHACHHANG(MAKH),
CONSTRAINT FK_HD_NV FOREIGN KEY (MANV) REFERENCES NHANVIEN(MANV)
ALTER TABLE CTHD ADD
CONSTRAINT FK_CTHD_HD FOREIGN KEY (SOHD) REFERENCES HOADON(SOHD),
CONSTRAINT FK_CTHD_SP FOREIGN KEY (MASP) REFERENCES SANPHAM(MASP)
--2--
ALTER TABLE SANPHAM ADD GHICHU varchar(20)
--3--
ALTER TABLE KHACHHANG ADD LOAIKH tinyint
--4--
ALTER TABLE SANPHAM ALTER COLUMN GHICHU varchar(100)
--5--
ALTER TABLE SANPHAM DROP COLUMN GHICHU
--6--
ALTER TABLE KHACHHANG ADD
CONSTRAINT CK_KH_LOAIKH CHECK(LOAIKH IN ('Vang lai','Thuong xuyen','Vip',NULL))
--7--
ALTER TABLE SANPHAM ADD
CONSTRAINT CK_SP_DVT CHECK(DVT IN ('cay','hop','cai','quyen','chuc'))
--8--
ALTER TABLE SANPHAM ADD
CONSTRAINT CK_SP_GIA CHECK(GIA >= 500)
--9--
ALTER TABLE CTHD ADD
CONSTRAINT CK_CTHD_SL CHECK(SL >=1)
--10--
ALTER TABLE KHACHHANG ADD
CONSTRAINT CK_KH_NGDK CHECK(NGDK > NGSINH)
--------------------------------Lab2--------------------------------
SET DATEFORMAT dmy
--II. Ngôn ngữ thao tác dữ liệu
--1. Nhập dữ liệu cho các quan hệ
-- Thêm gữ liệu vào bảng
	-- Bảng NHANVIEN
INSERT INTO NHANVIEN VALUES('NV01','Nguyen Nhu Nhut','0927345678','13/4/2006')
INSERT INTO NHANVIEN VALUES('NV02','Le Thi Phi Yen','0987567390','21/4/2006')
INSERT INTO NHANVIEN VALUES('NV03','Nguyen Van B','0997047382','27/4/2006')
INSERT INTO NHANVIEN VALUES('NV04','Ngo Thanh Tuan','0913758498','24/6/2006')
INSERT INTO NHANVIEN VALUES('NV05','Nguyen Thi Truc Thanh','0918590387','20/7/2006')
	--Bảng KHACHHANG
INSERT INTO KHACHHANG VALUES('KH01','Nguyen Van A','731 Tran Hung Dao, Q5, TpHCM','08823451','22/10/1960','22/07/2006',13060000,NULL)
INSERT INTO KHACHHANG VALUES('KH02','Tran Ngoc Han','23/5 Nguyen Trai, Q5, TpHCM','0908256478','3/4/1974','30/07/2006',280000,NULL)
INSERT INTO KHACHHANG VALUES('KH03','Tran Ngoc Linh','45 Nguyen Canh Chan, Q1, TpHCM','0938776266','12/6/1980','05/08/2006',3860000,NULL)
INSERT INTO KHACHHANG VALUES('KH04','Tran Minh Long','50/34 Le Dai Hanh, Q10, TpHCM','0917325476','9/3/1965','02/10/2006',250000,NULL)
INSERT INTO KHACHHANG VALUES('KH05','Le Nhat Minh','34 Truong Dinh, Q3, TpHCM','08246108','10/3/1950','28/10/2006',21000,NULL)
INSERT INTO KHACHHANG VALUES('KH06','Le Hoai Thuong','227 Nguyen Van Cu, Q5, TpHCM','08631738','31/12/1981','24/11/2006',915000,NULL)
INSERT INTO KHACHHANG VALUES('KH07','Nguyen Van Tam','32/3 Tran Binh Trong, Q5, TpHCM','0916783565','6/4/1971','01/12/2006',12500,NULL)
INSERT INTO KHACHHANG VALUES('KH08','Phan Thi Thanh','45/2 An Duong Vuong, Q5, TpHCM','0938435756','10/1/1971','13/12/2006',365000,NULL)
INSERT INTO KHACHHANG VALUES('KH09','Le Ha Vinh','873 Le Hong Phong, Q5, TpHCM','08654763','3/9/1979','14/01/2007',70000,NULL)
INSERT INTO KHACHHANG VALUES('KH10','Ha Duy Lap','34/34B Nguyen Trai, Q1, TpHCM','08768904','2/5/1983','16/01/2007',67500,NULL)
	-- Bảng SANPHAM
INSERT INTO SANPHAM VALUES('BC01','But chi','cay','Singapore',3000)
INSERT INTO SANPHAM VALUES('BC02','But chi','cay','Singapore',5000)
INSERT INTO SANPHAM VALUES('BC03','But chi','cay','Viet Nam',3500)
INSERT INTO SANPHAM VALUES('BC04','But chi','hop','Viet Nam',30000)
INSERT INTO SANPHAM VALUES('BB01','But bi','cay','Viet Nam',5000)
INSERT INTO SANPHAM VALUES('BB02','But bi','cay','Trung Quoc',7000)
INSERT INTO SANPHAM VALUES('BB03','But bi','hop','Thai Lan',100000)
INSERT INTO SANPHAM VALUES('TV01','Tap 100 giay mong','quyen','Trung Quoc',2500)
INSERT INTO SANPHAM VALUES('TV02','Tap 200 giay mong','quyen','Trung Quoc',4500)
INSERT INTO SANPHAM VALUES('TV03','Tap 100 giay tot','quyen','Viet Nam',3000)
INSERT INTO SANPHAM VALUES('TV04','Tap 200 giay tot','quyen','Viet Nam',5500)
INSERT INTO SANPHAM VALUES('TV05','Tap 100 trang','chuc','Viet Nam',23000)
INSERT INTO SANPHAM VALUES('TV06','Tap 200 trang','chuc','Viet Nam',53000)
INSERT INTO SANPHAM VALUES('TV07','Tap 100 trang','chuc','Trung Quoc',34000)
INSERT INTO SANPHAM VALUES('ST01','So tay 500 trang','quyen','Trung Quoc',40000)
INSERT INTO SANPHAM VALUES('ST02','So tay loai 1','quyen','Viet Nam',55000)
INSERT INTO SANPHAM VALUES('ST03','So tay loai 2','quyen','Viet Nam',51000)
INSERT INTO SANPHAM VALUES('ST04','So tay','quyen','Thai Lan',55000)
INSERT INTO SANPHAM VALUES('ST05','So tay mong','quyen','Thai Lan',20000)
INSERT INTO SANPHAM VALUES('ST06','Phan viet bang','hop','Viet Nam',5000)
INSERT INTO SANPHAM VALUES('ST07','Phan khong bui','hop','Viet Nam',7000)
INSERT INTO SANPHAM VALUES('ST08','Bong bang','cai','Viet Nam',1000)
INSERT INTO SANPHAM VALUES('ST09','But long','cay','Viet Nam',5000)
INSERT INTO SANPHAM VALUES('ST10','But long','cay','Trung Quoc',7000)
	-- Bảng HOADON
INSERT INTO HOADON VALUES(1001,'20060723','KH01','NV01',320000)
INSERT INTO HOADON VALUES(1002,'20060812','KH01','NV02',840000)
INSERT INTO HOADON VALUES(1003,'20060823','KH02','NV01',100000)
INSERT INTO HOADON VALUES(1004,'20060901','KH02','NV01',180000)
INSERT INTO HOADON VALUES(1005,'20061020','KH01','NV02',3800000)
INSERT INTO HOADON VALUES(1006,'20061016','KH01','NV03',2430000)
INSERT INTO HOADON VALUES(1007,'20061028','KH03','NV03',510000)
INSERT INTO HOADON VALUES(1008,'20061028','KH01','NV03',440000)
INSERT INTO HOADON VALUES(1009,'20061028','KH03','NV04',200000)
INSERT INTO HOADON VALUES(1010,'20061101','KH01','NV01',5200000)
INSERT INTO HOADON VALUES(1011,'20061104','KH04','NV03',250000)
INSERT INTO HOADON VALUES(1012,'20061130','KH05','NV03',21000)
INSERT INTO HOADON VALUES(1013,'20061212','KH06','NV01',5000)
INSERT INTO HOADON VALUES(1014,'20061231','KH03','NV02',3150000)
INSERT INTO HOADON VALUES(1015,'20070101','KH06','NV01',910000)
INSERT INTO HOADON VALUES(1016,'20070101','KH07','NV02',12500)
INSERT INTO HOADON VALUES(1017,'20070102','KH08','NV03',35000)
INSERT INTO HOADON VALUES(1018,'20070113','KH08','NV03',330000)
INSERT INTO HOADON VALUES(1019,'20070113','KH01','NV03',30000)
INSERT INTO HOADON VALUES(1020,'20070114','KH09','NV04',70000)
INSERT INTO HOADON VALUES(1021,'20070116','KH10','NV03',67500)
INSERT INTO HOADON VALUES(1022,'20070116',Null,'NV03',7000)
INSERT INTO HOADON VALUES(1023,'20070117',Null,'NV01',330000)
	-- Bảng CTHD
INSERT INTO CTHD VALUES(1001,'TV02',10)
INSERT INTO CTHD VALUES(1001,'ST01',5)
INSERT INTO CTHD VALUES(1001,'BC01',5)
INSERT INTO CTHD VALUES(1001,'BC02',10)
INSERT INTO CTHD VALUES(1001,'ST08',10)
INSERT INTO CTHD VALUES(1002,'BC04',20)
INSERT INTO CTHD VALUES(1002,'BB01',20)
INSERT INTO CTHD VALUES(1002,'BB02',20)
INSERT INTO CTHD VALUES(1003,'BB03',10)
INSERT INTO CTHD VALUES(1004,'TV01',20)
INSERT INTO CTHD VALUES(1004,'TV02',10)
INSERT INTO CTHD VALUES(1004,'TV03',10)
INSERT INTO CTHD VALUES(1004,'TV04',10)
INSERT INTO CTHD VALUES(1005,'TV05',50)
INSERT INTO CTHD VALUES(1005,'TV06',50)
INSERT INTO CTHD VALUES(1006,'TV07',20)
INSERT INTO CTHD VALUES(1006,'ST01',30)
INSERT INTO CTHD VALUES(1006,'ST02',10)
INSERT INTO CTHD VALUES(1007,'ST03',10)
INSERT INTO CTHD VALUES(1008,'ST04',8)
INSERT INTO CTHD VALUES(1009,'ST05',10)
INSERT INTO CTHD VALUES(1010,'TV07',50)
INSERT INTO CTHD VALUES(1010,'ST07',50)
INSERT INTO CTHD VALUES(1010,'ST08',100)
INSERT INTO CTHD VALUES(1010,'ST04',50)
INSERT INTO CTHD VALUES(1010,'TV03',100)
INSERT INTO CTHD VALUES(1011,'ST06',50)
INSERT INTO CTHD VALUES(1012,'ST07',3)
INSERT INTO CTHD VALUES(1013,'ST08',5)
INSERT INTO CTHD VALUES(1014,'BC02',80)
INSERT INTO CTHD VALUES(1014,'BB02',100)
INSERT INTO CTHD VALUES(1014,'BC04',60)
INSERT INTO CTHD VALUES(1014,'BB01',50)
INSERT INTO CTHD VALUES(1015,'BB02',30)
INSERT INTO CTHD VALUES(1015,'BB03',7)
INSERT INTO CTHD VALUES(1016,'TV01',5)
INSERT INTO CTHD VALUES(1017,'TV02',1)
INSERT INTO CTHD VALUES(1017,'TV03',1)
INSERT INTO CTHD VALUES(1017,'TV04',5)
INSERT INTO CTHD VALUES(1018,'ST04',6)
INSERT INTO CTHD VALUES(1019,'ST05',1)
INSERT INTO CTHD VALUES(1019,'ST06',2)
INSERT INTO CTHD VALUES(1020,'ST07',10)
INSERT INTO CTHD VALUES(1021,'ST08',5)
INSERT INTO CTHD VALUES(1021,'TV01',7)
INSERT INTO CTHD VALUES(1021,'TV02',10)
INSERT INTO CTHD VALUES(1022,'ST07',1)
INSERT INTO CTHD VALUES(1023,'ST04',6)
--2. Tao quan he SANPHAM1 từ SANPHAM, KHACHHANG1 từ KHACHHANG
SELECT * INTO KHACHHANG1 FROM KHACHHANG
SELECT * INTO SANPHAM1 FROM SANPHAM
--3. Cập nhật giá tăng 5% đối với những sản phẩm do “Thai Lan” sản xuất (cho quan hệ SANPHAM1)
UPDATE SANPHAM1 
SET GIA = 1.05*GIA
WHERE NUOCSX = 'Thai Lan'
--4. Cập nhật giá giảm 5% đối với những sản phẩm do “Trung Quoc” sản xuất có giá từ 10.000 trở xuống (cho quan hệ SANPHAM1).
UPDATE SANPHAM1
SET GIA = 0.95*GIA
WHERE NUOCSX = 'Trung Quoc' AND GIA <= 10000
--5. Cập nhật giá trị LOAIKH là “Vip” đối với những khách hàng đăng ký thành viên trước ngày 1/1/2007 có doanh số từ 10.000.000 trở lên hoặc khách hàng đăng ký thành viên từ 1/1/2007 trở về sau có doanh số từ 2.000.000 trở lên (cho quan hệ KHACHHANG1).
ALTER TABLE KHACHHANG1
ALTER COLUMN LOAIKH varchar(10)
UPDATE dbo.KHACHHANG1
SET LOAIKH = 'Vip'
WHERE (NGDK<'1/1/2007' AND DOANHSO >= 10000000) OR (NGDK>= '1/1/2007' AND DOANHSO >= 2000000)
-----------------------
--III. Ngôn ngữ truy vấn dữ liệu
--1. In ra danh sách các sản phẩm (MASP,TENSP) do “Trung Quoc” sản xuất.
SELECT MASP, TENSP
FROM SANPHAM
WHERE NUOCSX = 'Trung Quoc'
--2. In ra danh sách các sản phẩm (MASP, TENSP) có đơn vị tính là “cay”, ”quyen”.
SELECT MASP, TENSP
FROM SANPHAM
--WHERE DVT ='cay' OR DVT ='quyen'
WHERE DVT IN ('cay','quyen')
--3. In ra danh sách các sản phẩm (MASP,TENSP) có mã sản phẩm bắt đầu là “B” và kết thúc là “01”.
SELECT MASP, TENSP
FROM SANPHAM
WHERE MASP LIKE 'B%01'
--4. In ra danh sách các sản phẩm (MASP,TENSP) do “Trung Quốc” sản xuất có giá từ 30.000 đến 40.000.
SELECT MASP, TENSP 
FROM SANPHAM 
--WHERE NUOCSX = 'Trung Quoc' AND (GIA>=30000 AND GIA<=40000)
WHERE NUOCSX='Trung Quoc' AND GIA BETWEEN 30000 AND 40000
--5. In ra danh sách các sản phẩm (MASP,TENSP) do “Trung Quoc” hoặc “Thai Lan” sản xuất có giá từ 30.000 đến 40.000.
SELECT MASP, TENSP
FROM SANPHAM 
WHERE (NUOCSX='Trung Quoc' OR NUOCSX='Thai Lan') AND GIA BETWEEN 30000 AND 40000
--6. In ra các số hóa đơn, trị giá hóa đơn bán ra trong ngày 1/1/2007 và ngày 2/1/2007.
SELECT SOHD, TRIGIA
FROM HOADON
WHERE NGHD='1/1/2007' OR NGHD='2/1/2007'
--7. In ra các số hóa đơn, trị giá hóa đơn trong tháng 1/2007, sắp xếp theo ngày (tăng dần) và trị giá của hóa đơn (giảm dần).
SELECT SOHD, TRIGIA
FROM HOADON
WHERE YEAR(NGHD)=2007 AND MONTH(NGHD)=1
ORDER BY NGHD, TRIGIA DESC
--8. In ra danh sách các khách hàng (MAKH, HOTEN) đã mua hàng trong ngày 1/1/2007.
SELECT KHACHHANG.MAKH, HOTEN
FROM KHACHHANG, HOADON
WHERE KHACHHANG.MAKH = HOADON.MAKH AND HOADON.NGHD = '1/1/2007'
--9. In ra số hóa đơn, trị giá các hóa đơn do nhân viên có tên “Nguyen Van B” lập trong ngày 28/10/2006.
SELECT HOADON.SOHD, HOADON.TRIGIA
FROM HOADON, NHANVIEN
WHERE HOADON.MANV=NHANVIEN.MANV AND NHANVIEN.HOTEN='Nguyen Van B' AND HOADON.NGHD='28/10/2006'
--10. In ra danh sách các sản phẩm (MASP,TENSP) được khách hàng có tên “Nguyen Van A” mua trong tháng 10/2006.
SELECT SANPHAM.MASP, SANPHAM.TENSP
FROM HOADON, SANPHAM, CTHD, KHACHHANG
WHERE HOADON.SOHD=CTHD.SOHD 
AND KHACHHANG.MAKH=HOADON.MAKH 
AND CTHD.MASP=SANPHAM.MASP 
AND KHACHHANG.HOTEN='Nguyen Van A' 
AND YEAR(NGHD)='2006' AND MONTH(NGHD)='10'
--11. Tìm các số hóa đơn đã mua sản phẩm có mã số “BB01” hoặc “BB02”.
SELECT SOHD
FROM CTHD
WHERE MASP IN ('BB01','BB02')
--------------------------------Lab3--------------------------------
--12. Tìm các số hóa đơn đã mua sản phẩm có mã số “BB01” hoặc “BB02”, mỗi sản phẩm mua với số lượng từ 10 đến 20.
SELECT DISTINCT SOHD 
FROM CTHD 
WHERE (MASP IN ('BB01','BB02') AND (SL BETWEEN 10 AND 20))
--13. Tìm các số hóa đơn mua cùng lúc 2 sản phẩm có mã số “BB01” và “BB02”, mỗi sản phẩm mua với số lượng từ 10 đến 20.
SELECT SOHD 
FROM CTHD 
WHERE MASP='BB01' AND SL BETWEEN 10 AND 20
UNION
SELECT SOHD
FROM CTHD
WHERE MASP='BB02' AND SL BETWEEN 10 AND 20
--14. In ra danh sách các sản phẩm (MASP,TENSP) do “Trung Quoc” sản xuất hoặc các sản phẩm được bán ra trong ngày 1/1/2007.
SELECT CT.MASP, SP.TENSP
FROM HOADON HD, SANPHAM SP, CTHD CT
WHERE (SP.NUOCSX='Trung Quoc' AND HD.SOHD=CT.SOHD AND CT.MASP=SP.MASP) OR (HD.NGHD = '1/1/2007')
--15. In ra danh sách các sản phẩm (MASP,TENSP) không bán được.
SELECT SANPHAM.MASP, SANPHAM.TENSP
FROM SANPHAM
WHERE MASP IN (
	SELECT SANPHAM.MASP FROM SANPHAM
	EXCEPT
	SELECT CTHD.MASP FROM CTHD)
--16. In ra danh sách các sản phẩm (MASP,TENSP) không bán được trong năm 2006.
SELECT SANPHAM.MASP, SANPHAM.TENSP 
FROM SANPHAM
WHERE MASP IN (
	SELECT SANPHAM.MASP FROM SANPHAM	
	EXCEPT 
	SELECT CTHD.MASP 
	FROM CTHD, HOADON
	WHERE CTHD.SOHD=HOADON.SOHD AND YEAR(NGHD)='2006'
)
--17. In ra danh sách các sản phẩm (MASP,TENSP) do “Trung Quoc” sản xuất không bán được trong năm 2006.
SELECT SANPHAM.MASP, SANPHAM.TENSP 
FROM SANPHAM
WHERE MASP IN (
	SELECT SANPHAM.MASP FROM SANPHAM	
	WHERE SANPHAM.NUOCSX = 'Trung Quoc'
	EXCEPT 
	SELECT CTHD.MASP 
	FROM CTHD, HOADON, SANPHAM
	WHERE CTHD.SOHD=HOADON.SOHD AND CTHD.MASP=SANPHAM.MASP AND YEAR(NGHD)='2006' AND SANPHAM.NUOCSX='Trung Quoc'
)
--18. Tìm số hóa đơn đã mua tất cả các sản phẩm do Singapore sản xuất.
SELECT SOHD
FROM HOADON
WHERE NOT EXISTS (
	SELECT *
	FROM SANPHAM
	WHERE NUOCSX='Singapore' AND NOT EXISTS (
		SELECT *
		FROM CTHD 
		WHERE CTHD.MASP = SANPHAM.MASP AND CTHD.SOHD = HOADON.SOHD
	)
)
--19. Tìm số hóa đơn trong năm 2006 đã mua ít nhất tất cả các sản phẩm do Singapore sản xuất.
USE QLBH
SELECT HD.SOHD
FROM HOADON HD
WHERE NOT EXISTS (
	SELECT CT.MASP
	FROM HOADON HD JOIN CTHD CT ON HD.SOHD = CT.SOHD
	WHERE YEAR(NGHD) = '2006' 
	EXCEPT 
	SELECT CT.MASP 
	FROM CTHD CT JOIN SANPHAM SP ON CT.MASP = SP.MASP
	WHERE SP.NUOCSX = 'Singapore'
)
--------------------------------Lab4-------------------------------- 
--20. Có bao nhiêu hóa đơn không phải của khách hàng đăng ký thành viên mua?
SELECT COUNT(*) AS SL
FROM HOADON 
WHERE NOT EXISTS (
	SELECT HD.MAKH
	FROM HOADON HD 
)
SELECT COUNT(MAKH)
FROM HOADON
WHERE MAKH = NULL
--21. Có bao nhiêu sản phẩm khác nhau được bán ra trong năm 2006.
SELECT COUNT(MASP) AS SL 
FROM SANPHAM
WHERE MASP IN (
	SELECT DISTINCT MASP 
	FROM CTHD,HOADON 
	WHERE CTHD.SOHD = HOADON.SOHD AND YEAR(NGHD) = '2006'
)
--22. Cho biết trị giá hóa đơn cao nhất, thấp nhất là bao nhiêu ?
SELECT MAX(TRIGIA) AS CAONHAT, MIN(TRIGIA) AS THAPNHAT
FROM HOADON 
--23. Trị giá trung bình của tất cả các hóa đơn được bán ra trong năm 2006 là bao nhiêu?
SELECT AVG(TRIGIA) 
FROM HOADON 
WHERE YEAR(NGHD) = '2006'
--24. Tính doanh thu bán hàng trong năm 2006.
SELECT SUM(TRIGIA)
FROM HOADON 
WHERE YEAR(NGHD) = '2006' 
--25. Tìm số hóa đơn có trị giá cao nhất trong năm 2006.
SELECT HD.SOHD
FROM HOADON HD
WHERE YEAR(NGHD)='2006' AND HD.TRIGIA >= ALL (
	SELECT TRIGIA
	FROM HOADON HD2 
	WHERE YEAR(NGHD)='2006'
)
--26. Tìm họ tên khách hàng đã mua hóa đơn có trị giá cao nhất trong năm 2006.
SELECT TOP 1 WITH TIES K.MAKH, K.HOTEN 
FROM HOADON H, KHACHHANG K 
WHERE YEAR(NGHD) = '2006' AND K.MAKH = H.MAKH
ORDER BY TRIGIA DESC
--27. In ra danh sách 3 khách hàng đầu tiên (MAKH, HOTEN) sắp xếp theo doanh số giảm dần.
SELECT TOP 3 MAKH, HOTEN 
FROM KHACHHANG
ORDER BY DOANHSO DESC 
--28. In ra danh sách các sản phẩm (MASP, TENSP) có giá bán bằng 1 trong 3 mức giá cao nhất.
SELECT MASP, TENSP 
FROM SANPHAM 
WHERE GIA IN (
	SELECT TOP 3 GIA 
	FROM SANPHAM 
	ORDER BY GIA DESC 
)
--29. In ra danh sách các sản phẩm (MASP, TENSP) do “Thai Lan” sản xuất có giá bằng 1 trong 3 mức giá cao nhất (của tất cả các sản phẩm).
SELECT MASP, TENSP
FROM SANPHAM 
WHERE NUOCSX = 'Thai Lan' AND GIA IN (
	SELECT TOP 3 GIA 
	FROM SANPHAM 
	ORDER BY GIA DESC
)
--30. In ra danh sách các sản phẩm (MASP, TENSP) do “Trung Quoc” sản xuất có giá bằng 1 trong 3 mức giá cao nhất (của sản phẩm do “Trung Quoc” sản xuất).
SELECT TOP 3 MAKH, HOTEN, RANK() OVER(ORDER BY DOANHSO DESC) AS 'Xep Hang'
FROM KHACHHANG 
--31. * In ra danh sách khách hàng nằm trong 3 hạng cao nhất (xếp hạng theo doanh số).
SELECT TOP 3 MAKH, HOTEN 
FROM KHACHHANG 
ORDER BY DOANHSO DESC
--32. Tính tổng số sản phẩm do “Trung Quoc” sản xuất.
SELECT COUNT(MASP) AS TONGSOSANPHAM
FROM SANPHAM 
WHERE NUOCSX = 'Trung Quoc'
--33. Tính tổng số sản phẩm của từng nước sản xuất.
SELECT NUOCSX, COUNT(MASP) AS TONGSOSP 
FROM SANPHAM 
GROUP BY NUOCSX
--34. Với từng nước sản xuất, tìm giá bán cao nhất, thấp nhất, trung bình của các sản phẩm.
SELECT NUOCSX, MAX(GIA) AS CAO, MIN(GIA) AS THAP, AVG(GIA) AS TRUNGBINH 
FROM SANPHAM 
GROUP BY NUOCSX 
--35. Tính doanh thu bán hàng mỗi ngày.
SELECT NGHD, SUM(TRIGIA) AS DOANHTHU 
FROM HOADON 
GROUP BY NGHD 
--36. Tính tổng số lượng của từng sản phẩm bán ra trong tháng 10/2006.
SELECT MASP, SUM(SL) AS SOLUONGBAN 
FROM CTHD, HOADON 
WHERE CTHD.SOHD = HOADON.SOHD AND MONTH(NGHD) = '10' AND YEAR(NGHD) = '2006'
GROUP BY MASP
--37. Tính doanh thu bán hàng của từng tháng trong năm 2006.
SELECT MONTH(NGHD), SUM(TRIGIA) AS DOANHTHU
FROM HOADON
WHERE YEAR(NGHD)='2006'
GROUP BY MONTH(NGHD)
--38. Tìm hóa đơn có mua ít nhất 4 sản phẩm khác nhau.
SELECT SOHD
FROM CTHD
GROUP BY SOHD 
HAVING COUNT(MASP) >= 4 
--39. Tìm hóa đơn có mua 3 sản phẩm do “Viet Nam” sản xuất (3 sản phẩm khác nhau).
SELECT K.MAKH, K.HOTEN, COUNT(SOHD) AS SLMH 
FROM HOADON H, KHACHHANG K 
WHERE H.MAKH = K.MAKH 
GROUP BY K.MAKH, K.HOTEN 
HAVING COUNT(SOHD) >= ALL (
	SELECT COUNT(SOHD)
	FROM HOADON 
	GROUP BY MAKH 
)
--40. Tìm khách hàng (MAKH, HOTEN) có số lần mua hàng nhiều nhất. 
SELECT MAKH,COUNT(MAKH) SL INTO SOLANMUA
FROM HOADON 
GROUP BY MAKH
SELECT * FROM SOLANMUA
SELECT TOP 1 WITH TIES MAKH INTO LANNHIEUNHAT
FROM SOLANMUA 
ORDER BY SL DESC
SELECT KHACHHANG.MAKH, HOTEN 
FROM KHACHHANG JOIN LANNHIEUNHAT ON KHACHHANG.MAKH = LANNHIEUNHAT.MAKH
--41. Tháng mấy trong năm 2006, doanh số bán hàng cao nhất ?
SELECT TOP 1 MONTH(NGHD) AS THANG, SUM(TRIGIA) AS DOANHSO
FROM HOADON 
WHERE YEAR(NGHD)='2006'
GROUP BY MONTH(NGHD)
ORDER BY DOANHSO DESC 
--42. Tìm sản phẩm (MASP, TENSP) có tổng số lượng bán ra thấp nhất trong năm 2006.

--43. *Mỗi nước sản xuất, tìm sản phẩm (MASP,TENSP) có giá bán cao nhất.
SELECT NUOCSX, MASP, TENSP 
FROM SANPHAM SP 
WHERE MASP IN (
	SELECT TOP 1 WITH TIES MASP 
	FROM SANPHAM SP1
	WHERE SP.NUOCSX = SP1.NUOCSX AND 
	ORDER BY GIA DESC 
)
SELECT NUOCSX, MASP, TENSP 
FROM SANPHAM SP 
WHERE GIA = (
	SELECT MAX(GIA)
	FROM SP1 
	WHERE SP.NUOCSX = SP1.NUOCSX
)
--44. Tìm nước sản xuất sản xuất ít nhất 3 sản phẩm có giá bán khác nhau.
--45. *Trong 10 khách hàng có doanh số cao nhất, tìm khách hàng có số lần mua hàng nhiều nhất.
----------NOTE----------
--SELECT / DISTINCT / TOP (with ties)
--FORM join subquery 
--WHERE 
--GROUP BY 
--HAVING 
--ORDER BY 
------------THU TU THUC HIEN ------------
--FROM JOIN SUBQUERY 
--WHERE 
--GROUP BY 
--HAVING 
--SELECT 
--DISTINCT 
--ORDER BY 
--TOP  
-------------------
--WINDOW FUNCTION (TIM HIEU THEM)
--1. RANK 
--2. DENSERANK 
--3. ROWNUMBER