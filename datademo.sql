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

