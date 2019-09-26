-- Tạo CSDL QLVatTu
CREATE DATABASE datademo;
GO

-- Chuyển sang CSDL QLVatTu
USE datademo;
GO

-- Tạo bảng
---- Tạo bảng KHACHHANG
CREATE TABLE KHACHHANG (
	MAKH nvarchar(5) PRIMARY KEY,
	TENKH nvarchar(30) NOT NULL,
	DIACHI nvarchar(50),
	DT nvarchar(15),
	EMAIL nvarchar(30)
);
---- Tạo bảng VATTU
CREATE TABLE VATTU (
	MAVT nvarchar(5) PRIMARY KEY,
	TENVT nvarchar(30) NOT NULL,
	DVT nvarchar(20),
	GIAMUA int,
	SLTON int
);
---- Tạo bảng HOADON
CREATE TABLE HOADON (
	MAHD nvarchar(10) PRIMARY KEY,
	NGAY date,
	MAKH nvarchar(5) FOREIGN KEY REFERENCES KHACHHANG(MAKH),
	TONGTG int
);
---- Tạo bảng CHITIETHOADON
CREATE TABLE CHITIETHOADON (
	MAHD nvarchar(10) FOREIGN KEY REFERENCES HOADON(MAHD),
	MAVT nvarchar(5) FOREIGN KEY REFERENCES VATTU(MAVT),
	SL int,
	KHUYENMAI int,
	GIABAN int,
	CONSTRAINT PK_CHITIETHOADON PRIMARY KEY (MAHD, MAVT)	-- Tạo ràng buộc khóa chính cho 2+ thuộc tính
);

-- Thêm dữ liệu
---- Thêm dữ liệu vào bảng KHACHHANG (cách 1)
INSERT INTO KHACHHANG (MAKH, TENKH, DIACHI, DT, EMAIL) VALUES ('KH01', N'Nguyễn Thị Bé', N'Tân Bình', '8457895', 'bnt@yahoo.com');
INSERT INTO KHACHHANG (MAKH, TENKH, DIACHI, DT, EMAIL) VALUES ('KH02', N'Lê Hoàng Nam', N'Bình Chánh', '9878987', 'bnt@yahoo.com');
INSERT INTO KHACHHANG (MAKH, TENKH, DIACHI, DT, EMAIL) VALUES ('KH03', N'Trần Thị Chiêu', N'Tân Bình', '8457895', '');
INSERT INTO KHACHHANG (MAKH, TENKH, DIACHI, DT, EMAIL) VALUES ('KH04', N'Mai Thị Quế Anh', N'Bình Chánh', '', '');
INSERT INTO KHACHHANG (MAKH, TENKH, DIACHI, DT, EMAIL) VALUES ('KH05', N'Lê Văn Sang', N'Quận 10', '', 'sanglv@hcm.vnn.vn');
INSERT INTO KHACHHANG (MAKH, TENKH, DIACHI, DT, EMAIL) VALUES ('KH06', N'Trần Hoàng Khải', N'Tân Bình', '8457897', '');
---- Thêm dữ liệu vào bảng VATTU (cách 2)
INSERT INTO VATTU VALUES ('VT01', N'Xi măng', N'Bao', 50000, 5000);
INSERT INTO VATTU VALUES ('VT02', N'Cát', N'Khối', 45000, 50000);
INSERT INTO VATTU VALUES ('VT03', N'Gạch ống', N'Viên', 120, 800000);
INSERT INTO VATTU VALUES ('VT04', N'Gạch thẻ', N'Viên', 110, 800000);
INSERT INTO VATTU VALUES ('VT05', N'Đá lớn', N'Khối', 25000, 100000);
INSERT INTO VATTU VALUES ('VT06', N'Đá nhỏ', N'Khối', 33000, 100000);
INSERT INTO VATTU VALUES ('VT07', N'Lam gio', N'Cái', 15000, 50000);
---- Thêm dữ liệu vào bảng HOADON (cách 1)
INSERT INTO HOADON (MAHD, NGAY, MAKH) VALUES ('HD001', '2015-05-12', 'KH01');
INSERT INTO HOADON (MAHD, NGAY, MAKH) VALUES ('HD002', '2015-05-25', 'KH02');
INSERT INTO HOADON (MAHD, NGAY, MAKH) VALUES ('HD003', '2015-05-25', 'KH01');
INSERT INTO HOADON (MAHD, NGAY, MAKH) VALUES ('HD004', '2015-05-25', 'KH04');
INSERT INTO HOADON (MAHD, NGAY, MAKH) VALUES ('HD005', '2015-05-26', 'KH04');
INSERT INTO HOADON (MAHD, NGAY, MAKH) VALUES ('HD006', '2015-06-02', 'KH03');
INSERT INTO HOADON (MAHD, NGAY, MAKH) VALUES ('HD007', '2015-06-22', 'KH04');
INSERT INTO HOADON (MAHD, NGAY, MAKH) VALUES ('HD008', '2015-06-25', 'KH03');
INSERT INTO HOADON (MAHD, NGAY, MAKH) VALUES ('HD009', '2015-08-15', 'KH04');
INSERT INTO HOADON (MAHD, NGAY, MAKH) VALUES ('HD010', '2015-09-30', 'KH01');
INSERT INTO HOADON (MAHD, NGAY, MAKH) VALUES ('HD011', '2015-12-27', 'KH06');
INSERT INTO HOADON (MAHD, NGAY, MAKH) VALUES ('HD012', '2015-12-27', 'KH01');
---- Thêm dữ liệu vào bảng CHITIETHOADON (cách 1)
INSERT INTO CHITIETHOADON (MAHD, MAVT, SL, GIABAN) VALUES ('HD001', 'VT01', 5, 52000);
INSERT INTO CHITIETHOADON (MAHD, MAVT, SL, GIABAN) VALUES ('HD001', 'VT05', 10, 30000);
INSERT INTO CHITIETHOADON (MAHD, MAVT, SL, GIABAN) VALUES ('HD002', 'VT03', 10000, 150);
INSERT INTO CHITIETHOADON (MAHD, MAVT, SL, GIABAN) VALUES ('HD003', 'VT02', 20, 55000);
INSERT INTO CHITIETHOADON (MAHD, MAVT, SL, GIABAN) VALUES ('HD004', 'VT03', 50000, 150);
INSERT INTO CHITIETHOADON (MAHD, MAVT, SL, GIABAN) VALUES ('HD004', 'VT04', 20000, 120);
INSERT INTO CHITIETHOADON (MAHD, MAVT, SL, GIABAN) VALUES ('HD005', 'VT05', 10, 30000);
INSERT INTO CHITIETHOADON (MAHD, MAVT, SL, GIABAN) VALUES ('HD005', 'VT06', 15, 35000);
INSERT INTO CHITIETHOADON (MAHD, MAVT, SL, GIABAN) VALUES ('HD005', 'VT07', 20, 17000);
INSERT INTO CHITIETHOADON (MAHD, MAVT, SL, GIABAN) VALUES ('HD006', 'VT04', 10000, 120);
INSERT INTO CHITIETHOADON (MAHD, MAVT, SL, GIABAN) VALUES ('HD007', 'VT04', 20000, 125);
INSERT INTO CHITIETHOADON (MAHD, MAVT, SL, GIABAN) VALUES ('HD008', 'VT01', 100, 55000);
INSERT INTO CHITIETHOADON (MAHD, MAVT, SL, GIABAN) VALUES ('HD008', 'VT02', 20, 47000);
INSERT INTO CHITIETHOADON (MAHD, MAVT, SL, GIABAN) VALUES ('HD009', 'VT02', 25, 48000);
INSERT INTO CHITIETHOADON (MAHD, MAVT, SL, GIABAN) VALUES ('HD010', 'VT01', 25, 57000);
INSERT INTO CHITIETHOADON (MAHD, MAVT, SL, GIABAN) VALUES ('HD011', 'VT01', 20, 55000);
INSERT INTO CHITIETHOADON (MAHD, MAVT, SL, GIABAN) VALUES ('HD011', 'VT02', 20, 45000);
INSERT INTO CHITIETHOADON (MAHD, MAVT, SL, GIABAN) VALUES ('HD012', 'VT01', 20, 55000);
INSERT INTO CHITIETHOADON (MAHD, MAVT, SL, GIABAN) VALUES ('HD012', 'VT02', 10, 48000);
INSERT INTO CHITIETHOADON (MAHD, MAVT, SL, GIABAN) VALUES ('HD012', 'VT03', 10000, 150);

-- Câu 1: Liệt kê danh sách vật tư có trong cửa hàng. Gồm: Tất cả thuộc tính.
SELECT *
FROM VATTU

-- Câu 2: Liệt kê danh sách vật tư có trong cửa hàng. Gồm: Mã vật tư, tên vật tư.
SELECT MAVT, TENVT
FROM VATTU

-- Câu 3: Liệt kê danh sách vật tư có số lượng tồn từ 100.000 trở lên. Gồm: Tất cả thuộc tính.
SELECT *
FROM VATTU
WHERE SLTON >= 100000

-- Câu 4: Liệt kê danh sách vật tư có số lượng tồn từ 100.000 trở lên và giá mua từ 30.000 trở lên. Gồm: Tất cả thuộc tính.
SELECT *
FROM VATTU
WHERE SLTON >= 100000 AND GIAMUA >= 30000

-- Câu 5: Liệt kê những khách hàng sống ở Bình Chánh và Tân Bình. Gồm: Tên khách hàng, địa chỉ.
SELECT TENKH, DIACHI
FROM KHACHHANG
WHERE DIACHI = N'Bình Chánh' OR DIACHI = N'Tân Bình'

-- Câu 6: Đếm số lượng hóa đơn có trong hệ thống.
SELECT COUNT(*)
FROM HOADON

-- Câu 7: Đếm số lượng hóa đơn của khách hàng có mã là KH01.
SELECT COUNT(*)
FROM HOADON
WHERE MAKH = 'KH01'

-- Câu 8: Cho biết giá mua cao nhất trong bảng Vật tư.
SELECT MAX(GIAMUA)
FROM VATTU

-- Câu 9: Cho biết số lượng tồn kho ít nhất trong bảng Vật tư.
SELECT MIN(SLTON)
FROM VATTU

-- Câu 10: Tính tổng số lượng đã bán của vật tư có mã là VT01.
SELECT SUM(SL)
FROM CHITIETHOADON
WHERE MAVT = 'VT01'

-- Câu 11: Liệt kê danh sách hóa đơn được lập trong ngày 25/05/2015. Gồm: Tất cả thuộc tính.
SELECT *
FROM HOADON
WHERE NGAY = '2015-05-25'

-- Câu 12: Liệt kê danh sách hóa đơn được lập trong tháng 05 và tháng 06/2015. Gồm: Tất cả thuộc tính.
---- Cách 1: Dùng phép so sánh ngày
SELECT *
FROM HOADON
WHERE NGAY >= '2015-05-01' AND NGAY <= '2015-06-30'
---- Cách 2: Dùng toán tử BETWEEN
SELECT *
FROM HOADON
WHERE NGAY BETWEEN '2015-05-01' AND '2015-06-30'
---- Cách 3: Dùng hàm MONTH() và YEAR()
SELECT *
FROM HOADON
WHERE (MONTH(NGAY) = 5 OR MONTH(NGAY) = 6) AND YEAR(NGAY) = 2015

-- Câu 13: Tính tổng tiền hàng còn tồn kho. Ghi chú: Tổng tiền hàng vượt quá giới hạn số nguyên (INT) nên cần ép kiểu về số nguyên lớn (BIGINT) trước khi thực hiện tính toán.
SELECT SUM(CAST(SLTON AS BIGINT) * CAST(GIAMUA AS BIGINT))
FROM VATTU

-- Câu 14: Tính tổng tiền hàng còn tồn kho với các vật tư là gạch
SELECT SUM(SLTON * GIAMUA)
FROM VATTU
WHERE TENVT LIKE N'%Gạch%'

-- Câu 15: Tính tổng doanh số của cửa hàng.
SELECT SUM(SL)
FROM CHITIETHOADON

-- Câu 16: Tính tổng doanh thu của cửa hàng.
SELECT SUM(SL * GIABAN)
FROM CHITIETHOADON

-- Câu 17: Liệt kê danh sách khách hàng không có SĐT hoặc Email. Gồm: Tên khách hàng, ĐT, Email.
SELECT TENKH, DT, EMAIL
FROM KHACHHANG
WHERE DT = '' OR EMAIL = ''

-- Câu 18: Liệt kê danh sách khách hàng có tên lót là "Thị". Gồm: Tên khách hàng.
SELECT TENKH
FROM KHACHHANG
WHERE TENKH LIKE N'%Thị%'

-- Câu 19: Cho biết tổng tiền của hóa đơn HD005.
SELECT SUM(SL * GIABAN)
FROM CHITIETHOADON
WHERE MAHD = 'HD005'

-- Câu 20: Cho biết ngày gần nhất mà cửa hàng bán được hàng.
SELECT MAX(NGAY)
FROM HOADON

-- Câu 1. Cho biết thông tin khách hàng đã mua hóa đơn có mã là HD001. Gồm: Tên khách hàng, địa chỉ, SĐT, email.
SELECT TENKH, DIACHI, DT, EMAIL
FROM HOADON HD INNER JOIN KHACHHANG KH ON HD.MAKH = KH.MAKH
WHERE MAHD = 'HD001'

-- Câu 2. Liệt kê danh sách vật tư được mua trong hóa đơn HD005. Gồm: Tên vật tư, số lượng.
SELECT TENVT, SL
FROM CHITIETHOADON CTHD INNER JOIN VATTU VT ON CTHD.MAVT = VT.MAVT
WHERE MAHD = 'HD005'

-- Câu 3. Liệt kê danh sách hóa đơn của khách hàng Lê Hoàng Nam. Gồm: Mã hóa đơn, ngày mua.
SELECT MAHD, NGAY
FROM HOADON HD INNER JOIN KHACHHANG KH ON HD.MAKH = KH.MAKH
WHERE TENKH = N'Lê Hoàng Nam'

-- Câu 4. Liệt kê danh sách hóa đơn của các khách hàng ở Bình Chánh. Gồm: Mã hóa đơn, tên khách hàng, SĐT.
SELECT MAHD, TENKH, DT
FROM HOADON HD INNER JOIN KHACHHANG KH ON HD.MAKH = KH.MAKH
WHERE DIACHI = N'Bình Chánh'

-- Câu 5. Liệt kê danh sách khách hàng mua hàng trong ngày 25/05/2015. Gồm: Tên khách hàng.
SELECT TENKH
FROM HOADON HD INNER JOIN KHACHHANG KH ON HD.MAKH = KH.MAKH
WHERE NGAY = '2015-05-25'

-- Câu 6. Liệt kê danh sách vật tư được mua vào ngày 27/12/2015. Gồm: Tên vật tư.
SELECT DISTINCT TENVT	-- Từ khóa DISTINCT để loại bỏ các dòng kết quả trùng lặp
FROM
	HOADON HD INNER JOIN CHITIETHOADON CTHD ON HD.MAHD = CTHD.MAHD
			  INNER JOIN VATTU VT ON CTHD.MAVT = VT.MAVT
WHERE NGAY = '2015-12-27'

-- Câu 7. Tính tổng số lượng gạch đã bán (tính cả gạch ống và gạch thẻ).
SELECT SUM(SL) AS TONGSLGACH
FROM CHITIETHOADON CTHD INNER JOIN VATTU VT ON CTHD.MAVT = VT.MAVT
WHERE TENVT LIKE N'%Gạch%'

-- Câu 8. Tính tổng tiền mà khách hàng Mai Thị Quế Anh đã chi để mua hàng.
SELECT SUM(SL * GIABAN) AS TONGTIEN
FROM
	CHITIETHOADON CTHD INNER JOIN HOADON HD ON CTHD.MAHD = HD.MAHD
					   INNER JOIN KHACHHANG KH ON HD.MAKH = KH.MAKH
WHERE TENKH = N'Mai Thị Quế Anh'

-- Câu 9. Tính tổng tiền mà các khách hàng ở Tân Bình đã chi để mua hàng trong tháng 05/2015 và tháng 06/2015.
SELECT SUM(SL * GIABAN) AS TONGTIEN
FROM
	CHITIETHOADON CTHD INNER JOIN HOADON HD ON CTHD.MAHD = HD.MAHD
					   INNER JOIN KHACHHANG KH ON HD.MAKH = KH.MAKH
WHERE DIACHI = N'Tân Bình' AND NGAY BETWEEN '2015-05-01' AND '2015-06-30'

-- Câu 10. Liệt kê danh sách vật tư được mua bởi khách hàng Nguyễn Thị Bé. Gồm: Mã vật tư, tên vật tư, đơn vị tính.
SELECT DISTINCT VT.MAVT, TENVT, DVT
FROM
	VATTU VT INNER JOIN CHITIETHOADON CTHD ON VT.MAVT = CTHD.MAVT
			 INNER JOIN HOADON HD ON CTHD.MAHD = HD.MAHD
			 INNER JOIN KHACHHANG KH ON HD.MAKH = KH.MAKH
WHERE TENKH = N'Nguyễn Thị Bé'

--cau 1: liệt kê danh sách tất cả khách hàng. Gồm mã khách hàng,tên khách hàng,địa chỉ, điện thoại, email
SELECT *
FROM KHACHHANG
--CAU 2:	Liệt kê danh sách tất cả các vật tư. Gồm: Tên vật tư, giá mua, số lượng tồn.
SELECT TENVT,GIAMUA,SLTON
FROM VATTU
--CAU 3: 	Liệt kê danh sách các khách hàng có địa chỉ là "Tân Bình". Gồm: Mã khách hàng, tên khách hàng, địa chỉ, điện thoại và địa chỉ email.
SELECT *
FROM KHACHHANG
WHERE DIACHI = N'TÂN BÌNH'
--CAU 4: Liệt kê danh sách các khách hàng có địa chỉ là "Bình Chánh". Gồm: Mã khách hàng, tên khách hàng, địa chỉ, điện thoại và địa chỉ email.
SELECT *
FROM KHACHHANG
WHERE DIACHI = N'BÌNH CHÁNH'
--CAU 5:	Liệt kê danh sách các vật tư có giá mua từ 15.000 trở lên. Gồm: Tất cả thuộc tính.
FROM VATTU
WHERE GIAMUA > '15000'
--CAU 6:	Liệt kê danh sách các vật tư có lượng tồn trên 50.000. Gồm: Tất cả thuộc tính.
SELECT *
FROM VATTU
WHERE SLTON > '50000'
--CAU 7:	Liệt kê danh sách các khách hàng chưa có SĐT. Gồm: Mã khách hàng, tên khách hàng, địa chỉ và địa chỉ email.
SELECT MAKH,TENKH,DIACHI,EMAIL
FROM KHACHHANG
WHERE DT = ''
--CAU 8:	Liệt kê danh sách các khách hàng chưa có số điện thoại và cũng chưa có địa chỉ email. Gồm: Mã khách hàng, tên khách hàng, địa chỉ.
SELECT MAKH,TENKH,DIACHI
FROM KHACHHANG
WHERE DT ='' AND EMAIL =''
--CAU 9:	Liệt kê danh sách các khách hàng đã có số điện thoại và địa chỉ email. Gồm: Mã khách hàng, tên khách hàng, địa chỉ, điện thoại và địa chỉ email.
SELECT *
FROM KHACHHANG
WHERE DT !='' AND EMAIL !=''
--CAU 10:	Liệt kê danh sách tất cả các vật tư. Gồm: Mã vật tư, tên vật tư, đơn vị tính và giá mua.
SELECT MAVT,TENVT,DVT,GIAMUA
FROM VATTU
--CAU 11:	Liệt kê danh sách các vật tư có đơn vị tính là "Cái". Gồm: Mã vật tư, tên vật tư và giá mua.
SELECT MAVT,TENVT,GIAMUA
FROM VATTU
WHERE DVT =N'CÁI'
--CAU 12:	Liệt kê danh sách các vật tư có giá mua trên 25.000. Gồm: Mã vật tư, tên vật tư, đơn vị tính và giá mua
SELECT *
FROM VATTU
WHERE GIAMUA > '25000'
--CAU 13:	Liệt kê danh sách các vật tư là "Gạch" (tính tất cả các loại gạch). Gồm: Mã vật tư, tên vật tư, đơn vị tính và giá mua
SELECT *
FROM VATTU
WHERE TENVT LIKE N'%Gạch%'
--CAU 14:	Tính tổng số lượng gạch đã bán (tính tất cả các loại gạch)
SELECT SUM(SL) AS SLGACHBAN
FROM VATTU VT INNER JOIN CHITIETHOADON CTHD on VT.MAVT = CTHD.MAVT
WHERE  TENVT LIKE N'%Gạch%'
--CAU 15:	Liệt kê danh sách các vật tư có giá mua từ 20.000 đến 40.000. Gồm: Mã vật tư, tên vật tư, đơn vị tính và giá mua
SELECT *
FROM VATTU
WHERE GIAMUA BETWEEN 20000 AND 40000
--CAU 16:	Liệt kê danh sách hóa đơn. Gồm: Mã hoá đơn, ngày lập hoá đơn, tên khách hàng, địa chỉ khách hàng và số điện thoại
SELECT MAHD,NGAY,DIACHI,DT
FROM KHACHHANG KH INNER JOIN HOADON HD ON KH.MAKH = HD.MAKH
--CAU 17:	Liệt kê danh sách hóa đơn trong ngày 25/05/2015. Gồm: Mã hoá đơn, tên khách hàng, địa chỉ khách hàng và số điện thoại
SELECT MAHD,TENKH,DIACHI,DT
FROM KHACHHANG KH INNER JOIN HOADON HD ON KH.MAKH = HD.MAKH
--CAU 18:	Liệt kê danh sách hóa đơn được lập trong tháng 05/2015 và tháng 06/2015. Gồm: Mã hoá đơn, ngày lập hoá đơn, tên khách hàng, địa chỉ khách hàng và số điện thoại
SELECT MAHD,NGAY,TENKH,DIACHI,DT
FROM KHACHHANG KH INNER JOIN HOADON HD ON KH.MAKH = HD.MAKH
WHERE (MONTH(NGAY) = 5 OR MONTH(NGAY) = 6) AND YEAR(NGAY) = 2015
--CAU 19:	Liệt kê danh sách hóa đơn được mua bởi các khách hàng ở Tân Bình. Gồm: Mã hoá đơn, ngày lập hoá đơn, tên khách hàng, địa chỉ khách hàng và số điện thoại
SELECT MAHD,NGAY,TENKH,DIACHI,DT
FROM KHACHHANG KH INNER JOIN HOADON HD ON KH.MAKH = HD.MAKH
WHERE DIACHI = N'TÂN BÌNH'
--CAU 20:	Liệt kê danh sách những khách hàng đã mua hàng trong tháng 06/2015. Gồm: Tên khách hàng, số điện thoại và địa chỉ email
SELECT DISTINCT TENKH,DT,EMAIL
FROM KHACHHANG KH INNER JOIN HOADON HD ON KH.MAKH = HD.MAKH
WHERE (MONTH(NGAY) = 6 AND YEAR(NGAY) = 2015)
--CAU 21:	Liệt kê danh sách hóa đơn của khách hàng Lê Hoàng Nam và Mai Thị Quế Anh. Gồm: Mã hóa đơn, ngày lập hóa đơn, tên khách hàng
SELECT MAHD,NGAY,TENKH
FROM KHACHHANG INNER JOIN HOADON HD on KHACHHANG.MAKH = HD.MAKH
WHERE TENKH = N'Mai Thị Quế Anh' OR TENKH = N'Lê Hoàng Nam'
--CAU 22:	Liệt kê danh sách hóa đơn của các khách hàng ở Bình Chánh và Quận 10. Gồm: Mã hóa đơn, tên khách hàng, địa chỉ khách hàng
SELECT MAHD,TENKH,DIACHI
FROM KHACHHANG INNER JOIN HOADON HD on KHACHHANG.MAKH = HD.MAKH
WHERE DIACHI = N'Bình Chánh' or DIACHI = N'Quận 10'
--CAU 23:	Tính tổng tiền mà khách hàng Mai Thị Quế Anh đã chi để mua hàng.
SELECT SUM(GIABAN*SL) AS TONGTIEN
FROM KHACHHANG KH INNER JOIN HOADON HD on KH.MAKH = HD.MAKH
                  INNER JOIN CHITIETHOADON CTHD on HD.MAHD = CTHD.MAHD
WHERE TENKH = N'Mai Thị Quế Anh'
--CAU 24:	Tính tổng tiền mà các khách hàng ở Tân Bình đã chi để mua hàng trong tháng 05/2015 và tháng 06/2015
SELECT SUM(GIABAN*SL) AS TONGTIEN
FROM KHACHHANG KH INNER JOIN HOADON HD on KH.MAKH = HD.MAKH
                  INNER JOIN CHITIETHOADON CTHD on HD.MAHD = CTHD.MAHD
WHERE DIACHI = N'Tân Bình' AND (MONTH(NGAY) = 6 OR MONTH(NGAY) = 5 AND YEAR(NGAY) =2015 )
--CAU 25:	Liệt kê danh sách vật tư được mua bởi khách hàng Nguyễn Thị Bé. Gồm: Tên vật tư, đơn vị tính, số lượng tồn kho
SELECT TENVT,SL,DVT
FROM KHACHHANG KH INNER JOIN HOADON HD on KH.MAKH = HD.MAKH
                  INNER JOIN CHITIETHOADON CTHD on HD.MAHD = CTHD.MAHD
                  INNER JOIN VATTU VT on CTHD.MAVT = VT.MAVT
WHERE TENKH = N'Nguyễn Thị Bé'

--CAU 1: Liệt kê mã khách hàng và số lượng hóa đơn mỗi khách hàng đã mua
SELECT MAKH, COUNT(*) AS SLHD
FROM HOADON
GROUP BY MAKH

--CAU 2: Liệt kê ngày và số lượng hóa đơn đã lập của mỗi ngày
SELECT NGAY, COUNT(*)AS SLHD
FROM HOADON
GROUP BY NGAY

--CAU 3: Liệt kê mã vật tư và tổng số lượng đã bán của mỗi vật tư
SELECT MAVT, SUM(SL) AS TONGSL
FROM CHITIETHOADON
GROUP BY MAVT

--CAU 4: Liệt kê mã vật tư, tên vật tư và tổng số lượng đã bán của mỗi vật tư
SELECT VT.MAVT, TENVT, SUM(SL) AS TONGSL
FROM CHITIETHOADON CTHD INNER JOIN VATTU VT ON CTHD.MAVT = VT.MAVT
GROUP BY VT.MAVT, TENVT

--CAU 5: Liệt kê mã vật tư, tên vật tư và tổng số lượng đã bán của mỗi vật tư. Chỉ lấy những vật tư có tổng số lượng bán từ 100 trở lên
SELECT VT.MAVT, TENVT, SUM(SL) AS TONGSL
FROM CHITIETHOADON CTHD INNER JOIN VATTU VT ON CTHD.MAVT = VT.MAVT
GROUP BY VT.MAVT, TENVT
HAVING SUM(SL) >= 100

--CAU 6: Liệt kê mã vật tư, tên vật tư và tổng số lượng đã bán của mỗi loại gạch. Chỉ lấy những vật tư có tổng số lượng bán từ 60000 trở lên
SELECT VT.MAVT, TENVT, SUM(SL) AS TONGSL
FROM CHITIETHOADON CTHD INNER JOIN VATTU VT ON CTHD.MAVT = VT.MAVT
WHERE TENVT LIKE N'Gạch%'
GROUP BY VT.MAVT, TENVT
HAVING SUM(SL) >= 60000

--CAU 7: Liệt kê mã vật tư, tên vật tư và tổng số lượng đã bán của mỗi vật tư. Sắp xếp theo tổng số lượng giảm dần và mã vật tư tăng dần
SELECT VT.MAVT, TENVT, SUM(SL) AS TONGSL
FROM CHITIETHOADON CTHD INNER JOIN VATTU VT ON CTHD.MAVT = VT.MAVT
GROUP BY VT.MAVT, TENVT
ORDER BY TONGSL DESC, MAVT ASC

--CAU 8 Liệt kê mã vật tư, tên vật tư và tổng số lượng đã bán của mỗi vật tư. Sắp xếp theo tổng số lượng giảm dần và mã vật tư tăng dần. Chỉ lấy 3 dòng đầu tiên
SELECT TOP 3 VT.MAVT, TENVT, SUM(SL) AS TONGSL
FROM CHITIETHOADON CTHD INNER JOIN VATTU VT ON CTHD.MAVT = VT.MAVT
GROUP BY VT.MAVT, TENVT
ORDER BY TONGSL DESC, MAVT ASC

--cau 9: Liệt kê mã khách hàng, tên khách hàng và số lượng hóa đơn mỗi khách hàng đã mua. Chỉ lấy những khách hàng nào mua từ 2 hóa đơn trở lên
SELECT HD.MAKH,TENKH,COUNT(*) AS SLHD
FROM HOADON HD INNER JOIN KHACHHANG KH on HD.MAKH = KH.MAKH
GROUP BY HD.MAKH,TENKH
HAVING COUNT(*)>1

--CAU 10: Liệt kê mã khách hàng, tên khách hàng và số lượng hóa đơn mỗi khách hàng đã mua. Chỉ lấy những khách hàng nào mua từ 2 hóa đơn trở lên. Sắp xếp theo số lượng hóa đơn giảm dần, mã khách hàng tăng dần
SELECT HD.MAKH,TENKH,COUNT(*) AS SLHD
FROM HOADON HD INNER JOIN KHACHHANG KH on HD.MAKH = KH.MAKH
GROUP BY HD.MAKH,TENKH
HAVING COUNT(*)>1
ORDER BY SLHD DESC,HD.MAKH ASC

--CAU 11: Liệt kê mã hóa đơn và tổng tiền cho hóa đơn đó. Sắp xếp theo tổng tiền giảm dần
SELECT MAHD,SUM(GIABAN*SL) AS TONGTIEN
FROM CHITIETHOADON
GROUP BY MAHD
ORDER BY TONGTIEN DESC

--CAU 12: Liệt kê ngày và tổng doanh thu trong ngày đó. Sắp xếp theo ngày giảm dần
SELECT NGAY,SUM(SL*GIABAN) AS DOANHTHU
FROM HOADON HD INNER JOIN CHITIETHOADON C on HD.MAHD = C.MAHD
GROUP BY NGAY
ORDER BY NGAY ASC

--CAU 13: Liệt kê tên khách hàng, email, ĐT và tổng tiền đã mua của các khách hàng ở Tân Bình. Chỉ lấy những khách hàng mua trên 6tr. Sắp xếp theo tổng tiền giảm dần
SELECT TENKH,EMAIL,DT,SUM(SL*GIABAN) AS TONGTIEN
FROM KHACHHANG KH INNER JOIN HOADON HD on KH.MAKH = HD.MAKH
                  INNER JOIN CHITIETHOADON CTHD on HD.MAHD = CTHD.MAHD
WHERE DIACHI =N'Tân Bình'
GROUP BY TENKH, EMAIL, DT

