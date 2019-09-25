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