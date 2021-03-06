USE [master]
GO
/****** Object:  Database [TT_QLKHO]    Script Date: 26/05/2019 1:46:45 CH ******/
CREATE DATABASE [TT_QLKHO]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'TT_QLKHO', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\TT_QLKHO.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'TT_QLKHO_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\TT_QLKHO_log.ldf' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [TT_QLKHO] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [TT_QLKHO].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [TT_QLKHO] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [TT_QLKHO] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [TT_QLKHO] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [TT_QLKHO] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [TT_QLKHO] SET ARITHABORT OFF 
GO
ALTER DATABASE [TT_QLKHO] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [TT_QLKHO] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [TT_QLKHO] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [TT_QLKHO] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [TT_QLKHO] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [TT_QLKHO] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [TT_QLKHO] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [TT_QLKHO] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [TT_QLKHO] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [TT_QLKHO] SET  DISABLE_BROKER 
GO
ALTER DATABASE [TT_QLKHO] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [TT_QLKHO] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [TT_QLKHO] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [TT_QLKHO] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [TT_QLKHO] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [TT_QLKHO] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [TT_QLKHO] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [TT_QLKHO] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [TT_QLKHO] SET  MULTI_USER 
GO
ALTER DATABASE [TT_QLKHO] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [TT_QLKHO] SET DB_CHAINING OFF 
GO
ALTER DATABASE [TT_QLKHO] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [TT_QLKHO] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [TT_QLKHO] SET DELAYED_DURABILITY = DISABLED 
GO
USE [TT_QLKHO]
GO
/****** Object:  UserDefinedFunction [dbo].[login]    Script Date: 26/05/2019 1:46:45 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[login] (@user VARCHAR(250),@pass VARCHAR(250))
RETURNS int
AS BEGIN
	 DECLARE @Work int
   select @Work = quyen from DANG_NHAP where username = @user and pass = @pass

    RETURN @work
END
GO
/****** Object:  UserDefinedFunction [dbo].[login_user]    Script Date: 26/05/2019 1:46:45 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create FUNCTION [dbo].[login_user] (@user VARCHAR(250),@pass VARCHAR(250))
RETURNS int
AS BEGIN
	 DECLARE @Work int
   select @Work = quyen from DANG_NHAP where username = @user and pass = @pass

    RETURN @work
END
GO
/****** Object:  Table [dbo].[CT_PHIEUNHAP]    Script Date: 26/05/2019 1:46:45 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CT_PHIEUNHAP](
	[MA_CTPN] [int] IDENTITY(1,1) NOT NULL,
	[MA_PN] [int] NULL,
	[MA_SP] [int] NULL,
	[SOLUONG] [int] NULL,
	[DONGIA] [float] NULL,
 CONSTRAINT [PK_CT_PHIEUNHAP] PRIMARY KEY CLUSTERED 
(
	[MA_CTPN] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CT_PHIEUXUAT]    Script Date: 26/05/2019 1:46:45 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CT_PHIEUXUAT](
	[MA_CTPX] [int] IDENTITY(1,1) NOT NULL,
	[MA_PX] [int] NULL,
	[MA_SP] [int] NULL,
	[SOLUONG] [int] NULL,
	[DONGIA] [float] NULL,
 CONSTRAINT [PK_CT_PHIEUXUAT] PRIMARY KEY CLUSTERED 
(
	[MA_CTPX] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DANG_NHAP]    Script Date: 26/05/2019 1:46:45 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DANG_NHAP](
	[username] [nchar](10) NOT NULL,
	[pass] [nchar](10) NOT NULL,
	[quyen] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NHACUNGCAP]    Script Date: 26/05/2019 1:46:45 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NHACUNGCAP](
	[MA_NCC] [int] IDENTITY(1,1) NOT NULL,
	[TEN_NCC] [nvarchar](100) NULL,
	[DIACHI_NCC] [nvarchar](100) NULL,
	[SDT_NCC] [int] NULL,
	[WEBSITE_NCC] [char](50) NULL,
 CONSTRAINT [PK_NHACUNGCAP] PRIMARY KEY CLUSTERED 
(
	[MA_NCC] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NHANVIEN]    Script Date: 26/05/2019 1:46:45 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NHANVIEN](
	[MA_NV] [int] IDENTITY(1,1) NOT NULL,
	[TEN_NV] [nvarchar](100) NULL,
	[SDT_NV] [int] NULL,
	[EMAIL_NV] [char](100) NULL,
 CONSTRAINT [PK_NHANVIEN] PRIMARY KEY CLUSTERED 
(
	[MA_NV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PHIEUNHAP]    Script Date: 26/05/2019 1:46:45 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PHIEUNHAP](
	[MA_PN] [int] IDENTITY(1,1) NOT NULL,
	[MA_NV] [int] NULL,
	[MA_NCC] [int] NULL,
	[NGAYNHAP] [date] NULL,
 CONSTRAINT [PK_PHIEUNHAP] PRIMARY KEY CLUSTERED 
(
	[MA_PN] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PHIEUXUAT]    Script Date: 26/05/2019 1:46:45 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PHIEUXUAT](
	[MA_PX] [int] IDENTITY(1,1) NOT NULL,
	[MA_NV] [int] NULL,
	[NGAYXUAT] [date] NULL,
 CONSTRAINT [PK_PHIEUXUAT] PRIMARY KEY CLUSTERED 
(
	[MA_PX] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SANPHAM]    Script Date: 26/05/2019 1:46:45 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SANPHAM](
	[MA_SP] [int] IDENTITY(1,1) NOT NULL,
	[TEN_SP] [nvarchar](100) NULL,
	[MA_NCC] [int] NULL,
	[THONGSO_KT] [nvarchar](100) NULL,
	[GIA] [float] NULL,
	[SOLUONG] [int] NULL,
 CONSTRAINT [PK_SANPHAM] PRIMARY KEY CLUSTERED 
(
	[MA_SP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[v_CTPhieuXuat]    Script Date: 26/05/2019 1:46:45 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

---------------------------------------------------Xuất kho-----------------------------------------------------------------------------
CREATE VIEW [dbo].[v_CTPhieuXuat]
AS
SELECT MA_CTPX,MA_PX,CT_PHIEUXUAT.MA_SP,CT_PHIEUXUAT.SOLUONG,DONGIA,dbo.SANPHAM.TEN_SP FROM dbo.CT_PHIEUXUAT, dbo.SANPHAM where SANPHAM.MA_SP = CT_PHIEUXUAT.MA_SP

GO
/****** Object:  View [dbo].[v_PhieuXuat]    Script Date: 26/05/2019 1:46:45 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[v_PhieuXuat]
AS
SELECT MA_PX,PHIEUXUAT.MA_NV,TEN_NV,NGAYXUAT FROM dbo.PHIEUXUAT,dbo.NHANVIEN WHERE NHANVIEN.MA_NV=PHIEUXUAT.MA_NV

GO
/****** Object:  View [dbo].[v_XuatKho]    Script Date: 26/05/2019 1:46:45 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[v_XuatKho]
AS
SELECT v_CTPhieuXuat.MA_PX,MA_NV,TEN_NV,NGAYXUAT,MA_CTPX,MA_SP,SOLUONG,DONGIA,TEN_SP FROM dbo.v_PhieuXuat LEFT JOIN dbo.v_CTPhieuXuat ON v_CTPhieuXuat.MA_PX = v_PhieuXuat.MA_PX

GO
/****** Object:  View [dbo].[V_THANHTIEN]    Script Date: 26/05/2019 1:46:45 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

----------------------------------Proc-------------
CREATE VIEW [dbo].[V_THANHTIEN]
AS
		SELECT MA_SP, SUM(dbo.CT_PHIEUXUAT.SOLUONG*DONGIA) AS THANHTIEN ,SUM(SOLUONG) AS TONGSL
		FROM CT_PHIEUXUAT
		GROUP BY MA_SP

GO
/****** Object:  View [dbo].[v_thongke]    Script Date: 26/05/2019 1:46:45 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[v_thongke] 
AS 
	SELECT dbo.SANPHAM.MA_SP, TEN_SP , TONGSL ,NGAYXUAT, DONGIA, THANHTIEN
	FROM dbo.SANPHAM, dbo.PHIEUXUAT, dbo.CT_PHIEUXUAT, dbo.V_THANHTIEN
	WHERE dbo.SANPHAM.MA_SP = dbo.CT_PHIEUXUAT.MA_SP AND dbo.PHIEUXUAT.MA_PX = dbo.CT_PHIEUXUAT.MA_PX AND dbo.SANPHAM.MA_SP = dbo.V_THANHTIEN.Ma_sp 

GO
ALTER TABLE [dbo].[PHIEUNHAP] ADD  DEFAULT (getdate()) FOR [NGAYNHAP]
GO
ALTER TABLE [dbo].[PHIEUXUAT] ADD  DEFAULT (getdate()) FOR [NGAYXUAT]
GO
ALTER TABLE [dbo].[CT_PHIEUNHAP]  WITH CHECK ADD  CONSTRAINT [PK_PHIEUNHAP_FK_CT_PHIEUNHAP] FOREIGN KEY([MA_PN])
REFERENCES [dbo].[PHIEUNHAP] ([MA_PN])
GO
ALTER TABLE [dbo].[CT_PHIEUNHAP] CHECK CONSTRAINT [PK_PHIEUNHAP_FK_CT_PHIEUNHAP]
GO
ALTER TABLE [dbo].[CT_PHIEUNHAP]  WITH CHECK ADD  CONSTRAINT [PK_SANPHAM_FK_CT_PHIEUNHAP] FOREIGN KEY([MA_SP])
REFERENCES [dbo].[SANPHAM] ([MA_SP])
GO
ALTER TABLE [dbo].[CT_PHIEUNHAP] CHECK CONSTRAINT [PK_SANPHAM_FK_CT_PHIEUNHAP]
GO
ALTER TABLE [dbo].[CT_PHIEUXUAT]  WITH CHECK ADD  CONSTRAINT [PK_PHIEUXUAT_FK_CT_PHIEUXUAT] FOREIGN KEY([MA_PX])
REFERENCES [dbo].[PHIEUXUAT] ([MA_PX])
GO
ALTER TABLE [dbo].[CT_PHIEUXUAT] CHECK CONSTRAINT [PK_PHIEUXUAT_FK_CT_PHIEUXUAT]
GO
ALTER TABLE [dbo].[CT_PHIEUXUAT]  WITH CHECK ADD  CONSTRAINT [PK_SANPHAM_FK_CT_PHIEUXUAT] FOREIGN KEY([MA_SP])
REFERENCES [dbo].[SANPHAM] ([MA_SP])
GO
ALTER TABLE [dbo].[CT_PHIEUXUAT] CHECK CONSTRAINT [PK_SANPHAM_FK_CT_PHIEUXUAT]
GO
ALTER TABLE [dbo].[PHIEUNHAP]  WITH CHECK ADD  CONSTRAINT [PK_NHACUNGCAP_FK_PHIEUNHAP] FOREIGN KEY([MA_NCC])
REFERENCES [dbo].[NHACUNGCAP] ([MA_NCC])
GO
ALTER TABLE [dbo].[PHIEUNHAP] CHECK CONSTRAINT [PK_NHACUNGCAP_FK_PHIEUNHAP]
GO
ALTER TABLE [dbo].[PHIEUNHAP]  WITH CHECK ADD  CONSTRAINT [PK_NHANVIEN_FK_PHIEUNHAP] FOREIGN KEY([MA_NV])
REFERENCES [dbo].[NHANVIEN] ([MA_NV])
GO
ALTER TABLE [dbo].[PHIEUNHAP] CHECK CONSTRAINT [PK_NHANVIEN_FK_PHIEUNHAP]
GO
ALTER TABLE [dbo].[PHIEUXUAT]  WITH CHECK ADD  CONSTRAINT [PK_NHANVIEN_FK_PHIEUXUAT] FOREIGN KEY([MA_NV])
REFERENCES [dbo].[NHANVIEN] ([MA_NV])
GO
ALTER TABLE [dbo].[PHIEUXUAT] CHECK CONSTRAINT [PK_NHANVIEN_FK_PHIEUXUAT]
GO
ALTER TABLE [dbo].[SANPHAM]  WITH CHECK ADD  CONSTRAINT [PK_NHACUNGCAP_FK_SANPHAM] FOREIGN KEY([MA_NCC])
REFERENCES [dbo].[NHACUNGCAP] ([MA_NCC])
GO
ALTER TABLE [dbo].[SANPHAM] CHECK CONSTRAINT [PK_NHACUNGCAP_FK_SANPHAM]
GO
/****** Object:  StoredProcedure [dbo].[DeleteCTPhieuXuatXuatKho]    Script Date: 26/05/2019 1:46:45 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[DeleteCTPhieuXuatXuatKho]
@mapx INT,
@mact INT
AS
BEGIN
	DECLARE @soluong INT,@idsp INT
	SELECT @idsp=MA_SP,@soluong=SOLUONG FROM dbo.CT_PHIEUXUAT WHERE MA_CTPX=@mact
	DELETE FROM dbo.CT_PHIEUXUAT WHERE MA_CTPX = @mact
	UPDATE dbo.SANPHAM SET SOLUONG=SOLUONG+@soluong WHERE MA_SP=@idsp
	IF (SELECT COUNT(*) FROM dbo.CT_PHIEUXUAT WHERE MA_PX=@mapx)=0
	DELETE FROM dbo.PHIEUXUAT WHERE MA_PX=@mapx
END

GO
/****** Object:  StoredProcedure [dbo].[DeletePhieuXuatXuatKho]    Script Date: 26/05/2019 1:46:45 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[DeletePhieuXuatXuatKho]
@maphieuxuat INT
AS
BEGIN
	DECLARE @mactphieuxuat INT
	WHILE (SELECT COUNT(*) FROM dbo.CT_PHIEUXUAT WHERE MA_PX=@maphieuxuat) <> 0
	BEGIN
		SET @mactphieuxuat = (SELECT TOP 1 (MA_CTPX) FROM dbo.CT_PHIEUXUAT WHERE MA_PX=@maphieuxuat)
		EXEC dbo.DeleteCTPhieuXuatXuatKho @mapx = @maphieuxuat,  @mact = @mactphieuxuat
	END
END

GO
/****** Object:  StoredProcedure [dbo].[SP_CTPhieuNhap_Delete]    Script Date: 26/05/2019 1:46:45 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[SP_CTPhieuNhap_Delete]
	@maChiTietPhieuNhap int
as
begin
	delete CT_PHIEUNHAP
	where MA_CTPN = @maChiTietPhieuNhap
end

GO
/****** Object:  StoredProcedure [dbo].[SP_CTPhieuNhap_GetAll]    Script Date: 26/05/2019 1:46:45 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-------------------Chi tiết phiếu nhập-----------------

create procedure [dbo].[SP_CTPhieuNhap_GetAll] 
	@maPhieuNhap int
as
begin
	select * from CT_PHIEUNHAP
	where MA_PN = @maPhieuNhap
end

GO
/****** Object:  StoredProcedure [dbo].[SP_CTPhieuNhap_Insert]    Script Date: 26/05/2019 1:46:45 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[SP_CTPhieuNhap_Insert]
	@maPhieuNhap int,
	@maSanPham int,
	@soLuong int,
	@donGia float
as
begin
	UPDATE dbo.SANPHAM 
	SET SOLUONG = SOLUONG + @soLuong, GIA = @donGia
	WHERE MA_SP = @maSanPham 
	INSERT into CT_PHIEUNHAP(MA_PN, MA_SP, SOLUONG, DONGIA)
	values(@maPhieuNhap, @maSanPham, @soLuong, @donGia)
end

GO
/****** Object:  StoredProcedure [dbo].[SP_CTPhieuNhap_Search]    Script Date: 26/05/2019 1:46:45 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[SP_CTPhieuNhap_Search]
	@searchValue nvarchar(50),
	@maChiTietPhieuNhap int
as
begin
	select * from CT_PHIEUNHAP
	where MA_CTPN like N'%'+ @searchValue + '%'
	or MA_PN like N'%'+ @searchValue + '%'
	or MA_SP like N'%'+ @searchValue + '%'
	or SOLUONG like N'%'+ @searchValue + '%'
	or DONGIA like N'%'+ @searchValue + '%'
	and MA_CTPN = @maChiTietPhieuNhap
end

GO
/****** Object:  StoredProcedure [dbo].[SP_CTPhieuNhap_Update]    Script Date: 26/05/2019 1:46:45 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[SP_CTPhieuNhap_Update]
	@maChiTietPhieuNhap int,
	@maPhieuNhap int,
	@maSanPham int,
	@soLuong int,
	@donGia float
as
begin
	update CT_PHIEUNHAP
	set MA_SP = @maSanPham, MA_PN = @maPhieuNhap, SOLUONG = @soLuong, DONGIA = @donGia
	where MA_CTPN = @maChiTietPhieuNhap
end

GO
/****** Object:  StoredProcedure [dbo].[SP_NHANVIEN_DELETE]    Script Date: 26/05/2019 1:46:45 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

------TẠO PROC DELETE
CREATE PROC [dbo].[SP_NHANVIEN_DELETE]
	@MANV INT
AS
BEGIN
	DELETE dbo.NHANVIEN WHERE MA_NV = @MANV
END

GO
/****** Object:  StoredProcedure [dbo].[SP_NHANVIEN_GETALL]    Script Date: 26/05/2019 1:46:45 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-----------------------------------------------------------BẢNG NHÂN VIÊN--------------------------------------------------------------------------
-------TẠO PROC GETALL
CREATE PROC [dbo].[SP_NHANVIEN_GETALL]
AS
BEGIN
	SELECT MA_NV, TEN_NV, SDT_NV, EMAIL_NV
	FROM dbo.NHANVIEN
END

GO
/****** Object:  StoredProcedure [dbo].[SP_NHANVIEN_INSERT]    Script Date: 26/05/2019 1:46:45 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-------TẠO PROC INSERT
CREATE PROC [dbo].[SP_NHANVIEN_INSERT]
	@TENNV NVARCHAR(100),
	@SDT INT,
	@EMAIL CHAR(100)
AS
BEGIN
	INSERT INTO dbo.NHANVIEN( TEN_NV, SDT_NV, EMAIL_NV )
	VALUES  ( @TENNV, -- TEN_NV - nvarchar(100)
	          @SDT, -- SDT_NV - int
	          @EMAIL  -- EMAIL_NV - char(100)
	          )
END

GO
/****** Object:  StoredProcedure [dbo].[SP_NHANVIEN_SEARCH]    Script Date: 26/05/2019 1:46:45 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

---TẠO PROC SEARCH
CREATE PROC [dbo].[SP_NHANVIEN_SEARCH]
	@SEARCHVALUE NVARCHAR(100)
AS
BEGIN
	SELECT MA_NV, TEN_NV, SDT_NV, EMAIL_NV
	FROM dbo.NHANVIEN
	WHERE (dbo.NHANVIEN.MA_NV LIKE N'%' + @SEARCHVALUE +'%')
		OR (dbo.NHANVIEN.TEN_NV LIKE N'%' + @SEARCHVALUE + '%')
		OR (dbo.NHANVIEN.SDT_NV LIKE N'%' + @SEARCHVALUE + '%')
		OR (dbo.NHANVIEN.EMAIL_NV LIKE N'%' + @SEARCHVALUE + '%')
END

GO
/****** Object:  StoredProcedure [dbo].[SP_NHANVIEN_UPDATE]    Script Date: 26/05/2019 1:46:45 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

------TẠO PROC UPDATE
CREATE PROC [dbo].[SP_NHANVIEN_UPDATE]
	@MANV INT,
	@TENNV NVARCHAR(100),
	@SDT INT,
	@EMAIL CHAR(100)
AS
BEGIN
	UPDATE dbo.NHANVIEN
	SET TEN_NV = @TENNV, SDT_NV = @SDT, EMAIL_NV = @EMAIL
	WHERE MA_NV = @MANV
END

GO
/****** Object:  StoredProcedure [dbo].[SP_PhieuNhap_Delete]    Script Date: 26/05/2019 1:46:45 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[SP_PhieuNhap_Delete]
	@maPhieuNhap int
as
begin
	delete CT_PHIEUNHAP 
	where MA_PN = @maPhieuNhap
	delete PHIEUNHAP 
	where MA_PN = @maPhieuNhap
end

GO
/****** Object:  StoredProcedure [dbo].[SP_PhieuNhap_GetAll]    Script Date: 26/05/2019 1:46:45 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




----------------------Phiếu nhập---------------------------------
create procedure [dbo].[SP_PhieuNhap_GetAll]
as
begin
	select * from PHIEUNHAP
end

GO
/****** Object:  StoredProcedure [dbo].[SP_PhieuNhap_Insert]    Script Date: 26/05/2019 1:46:45 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[SP_PhieuNhap_Insert]
	@maNhanVien int,
	@maNhaCungCap int,
	@ngayNhap date
as
begin
	insert into PHIEUNHAP(MA_NV, MA_NCC, NGAYNHAP)
	values(@maNhanVien, @maNhaCungCap, @ngayNhap)
end	

GO
/****** Object:  StoredProcedure [dbo].[SP_PhieuNhap_Search]    Script Date: 26/05/2019 1:46:45 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[SP_PhieuNhap_Search]
	@searchValue nvarchar(50)
as
begin
	select * from PHIEUNHAP
	where MA_PN like N'%' + @searchValue +'%'
	or MA_NV like N'%' + @searchValue +'%'
	or MA_NCC like N'%' + @searchValue +'%'
	or NGAYNHAP like N'%' + @searchValue +'%'
end

GO
/****** Object:  StoredProcedure [dbo].[SP_PhieuNhap_Update]    Script Date: 26/05/2019 1:46:45 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[SP_PhieuNhap_Update]
	@maPhieuNhap int,
	@maNhanVien int,
	@maNhaCungCap int,
	@ngayNhap date
as
begin
	update PHIEUNHAP 
	set MA_NV = @maNhanVien, MA_NCC = @maNhaCungCap, NGAYNHAP = @ngayNhap
	where MA_PN = @maPhieuNhap
end

GO
/****** Object:  StoredProcedure [dbo].[SP_SANPHAM_DELETE]    Script Date: 26/05/2019 1:46:45 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--tạo thủ tục xóa:
CREATE PROC [dbo].[SP_SANPHAM_DELETE]
	@MASP INT
AS
BEGIN
	DELETE dbo.SANPHAM WHERE MA_SP = @MASP
END

GO
/****** Object:  StoredProcedure [dbo].[SP_SANPHAM_GETALL]    Script Date: 26/05/2019 1:46:45 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

------------------------------------------------Bảng Sản Phẩm------------------
CREATE PROC [dbo].[SP_SANPHAM_GETALL]
AS
BEGIN
	SELECT *
	FROM dbo.SANPHAM
END

GO
/****** Object:  StoredProcedure [dbo].[SP_SANPHAM_INSERT]    Script Date: 26/05/2019 1:46:45 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


--tạo thủ tục thêm:
CREATE PROC [dbo].[SP_SANPHAM_INSERT]
	@TENSP NVARCHAR(100),
	@MANCC CHAR(100),
	@THONGSOKT NVARCHAR(100),
	@GIA FLOAT,
	@SOLUONG CHAR(100)
	
AS
BEGIN
	INSERT INTO dbo.SANPHAM( TEN_SP,MA_NCC,THONGSO_KT,GIA,SOLUONG)
	VALUES  ( @TENSP, 
	          @MANCC,
	          @THONGSOKT,
			  @GIA,
			  @SOLUONG  
	          )
END

GO
/****** Object:  StoredProcedure [dbo].[SP_SANPHAM_SEARCH]    Script Date: 26/05/2019 1:46:45 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

---TẠO PROC SEARCH
CREATE PROC [dbo].[SP_SANPHAM_SEARCH]
	@SEARCHVALUE NVARCHAR(100)
AS
BEGIN
	SELECT MA_SP, TEN_SP, MA_NCC,THONGSO_KT,GIA,SOLUONG
	FROM dbo.SANPHAM
	WHERE (dbo.SANPHAM.MA_SP LIKE N'%' + @SEARCHVALUE +'%')
		OR (dbo.SANPHAM.TEN_SP LIKE N'%' + @SEARCHVALUE + '%')
		OR (dbo.SANPHAM.MA_NCC LIKE N'%' + @SEARCHVALUE + '%')
		OR (dbo.SANPHAM.THONGSO_KT LIKE N'%' + @SEARCHVALUE + '%')
		OR (dbo.SANPHAM.GIA LIKE N'%' + @SEARCHVALUE + '%')
		OR (dbo.SANPHAM.SOLUONG LIKE N'%' + @SEARCHVALUE + '%')
END

GO
/****** Object:  StoredProcedure [dbo].[SP_SANPHAM_UPDATE]    Script Date: 26/05/2019 1:46:45 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--tạo thủ tục update
CREATE PROC [dbo].[SP_SANPHAM_UPDATE]
	@MASP INT,
	@TENSP NVARCHAR(100),
	@MANCC INT,
	@THONGSOKT NVARCHAR(100),
	@GIA FLOAT,
	@SOLUONG INT
AS
BEGIN
	UPDATE dbo.SANPHAM
	SET TEN_SP = @TENSP,MA_NCC  = @MANCC ,THONGSO_KT = @THONGSOKT, GIA = @GIA, SOLUONG = @SOLUONG
	WHERE MA_SP = @MASP
END

GO
/****** Object:  StoredProcedure [dbo].[THONGKE_GETALL]    Script Date: 26/05/2019 1:46:45 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[THONGKE_GETALL](@TUNGAY DATE, @DENNGAY DATE)
AS
	BEGIN
		SELECT * FROM dbo.v_thongke WHERE NGAYXUAT IN (SELECT NGAYXUAT FROM dbo.CT_PHIEUXUAT WHERE NGAYXUAT BETWEEN @TUNGAY AND @DENNGAY)
	END

GO
/****** Object:  StoredProcedure [dbo].[usp_DANGNHAP]    Script Date: 26/05/2019 1:46:45 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[usp_DANGNHAP]
@USERNAME NVARCHAR(10),@PASSWORD NVARCHAR(10)
AS
BEGIN
SELECT *FROM dbo.DANG_NHAP WHERE Username=@USERNAME AND Password =@PASSWORD
END 

GO
/****** Object:  StoredProcedure [dbo].[USP_DeleteNCC]    Script Date: 26/05/2019 1:46:45 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-------XOA-------
CREATE PROC [dbo].[USP_DeleteNCC]
   @MANCC INT
AS
BEGIN
DELETE dbo.NHACUNGCAP WHERE MA_NCC = @MANCC
END 

GO
/****** Object:  StoredProcedure [dbo].[USP_GetallNCC]    Script Date: 26/05/2019 1:46:45 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

------------GET ALL-------------
CREATE PROC [dbo].[USP_GetallNCC]
AS
BEGIN
	SELECT MA_NCC, TEN_NCC,DIACHI_NCC, SDT_NCC, WEBSITE_NCC
	FROM dbo.NHACUNGCAP
END

GO
/****** Object:  StoredProcedure [dbo].[USP_GetDSNCC]    Script Date: 26/05/2019 1:46:45 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



------------------------BẢNG NHÀ CUNG CẤP--------------------------------
CREATE PROC [dbo].[USP_GetDSNCC] AS 
SELECT NHACUNGCAP.MA_NCC,TEN_NCC,DIACHI_NCC,SDT_NCC,WEBSITE_NCC
FROM dbo.NHACUNGCAP JOIN dbo.SANPHAM  ON NHACUNGCAP.MA_NCC=SANPHAM.MA_NCC

GO
/****** Object:  StoredProcedure [dbo].[USP_GetListXuatKho]    Script Date: 26/05/2019 1:46:45 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[USP_GetListXuatKho]
AS
SELECT * FROM dbo.v_PhieuXuat LEFT JOIN dbo.v_CTPhieuXuat ON v_CTPhieuXuat.MA_PX = v_PhieuXuat.MA_PX

GO
/****** Object:  StoredProcedure [dbo].[USP_InsertNCC]    Script Date: 26/05/2019 1:46:45 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

------THEM-----------
CREATE PROC [dbo].[USP_InsertNCC]
	@TENNCC NVARCHAR(100),
	@DIACHINCC NVARCHAR(100),
	@SDTNCC INT,
	@WEBSITENCC char(100)
AS
BEGIN
INSERT dbo.NHACUNGCAP ( TEN_NCC,DIACHI_NCC,SDT_NCC,WEBSITE_NCC)
VALUES  (@TENNCC,@DIACHINCC,@SDTNCC,@WEBSITENCC)
END

GO
/****** Object:  StoredProcedure [dbo].[USP_SearchNCC]    Script Date: 26/05/2019 1:46:45 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

----------TIM KIEM-----------
CREATE PROC [dbo].[USP_SearchNCC]
  @SEARCHVALUE NVARCHAR(100)
AS 
BEGIN
    SELECT MA_NCC,TEN_NCC,DIACHI_NCC,SDT_NCC,WEBSITE_NCC
	FROM dbo.NHACUNGCAP
	WHERE (dbo.NHACUNGCAP.MA_NCC LIKE N'%' + @SEARCHVALUE + '%')
	    OR (dbo.NHACUNGCAP.TEN_NCC LIKE N'%' + @SEARCHVALUE + '%')
		OR (dbo.NHACUNGCAP.DIACHI_NCC LIKE N'%' + @SEARCHVALUE + '%')
		OR (dbo.NHACUNGCAP.SDT_NCC LIKE N'%' + @SEARCHVALUE + '%')
		OR (dbo.NHACUNGCAP.WEBSITE_NCC LIKE N'%' + @SEARCHVALUE + '%')
END

GO
/****** Object:  StoredProcedure [dbo].[USP_SearchPhieuXuat]    Script Date: 26/05/2019 1:46:45 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[USP_SearchPhieuXuat]
@search NVARCHAR(100)
AS
BEGIN
	SELECT * FROM dbo.v_XuatKho 
	WHERE 
	NGAYXUAT LIKE N'%' + @search + '%' OR TEN_NV LIKE N'%' + @search + '%' OR TEN_SP LIKE N'%' + @search + '%'
	OR SOLUONG LIKE N'%' + @search + '%' OR DONGIA LIKE N'%' + @search + '%' OR MA_PX LIKE N'%' + @search + '%' 
	OR MA_CTPX LIKE N'%' + @search + '%' 
END

GO
/****** Object:  StoredProcedure [dbo].[USP_ThemPhieuXuat]    Script Date: 26/05/2019 1:46:45 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[USP_ThemPhieuXuat]
	@mapx INT,
	@manv INT,
	@ngayxuat DATE,
	@tensp NVARCHAR(100),
	@soluong INT
AS
BEGIN
	DECLARE @id INT,@idsp INT,@gia FLOAT,@soluongton INT
	SELECT @idsp=MA_SP FROM dbo.SANPHAM WHERE TEN_SP=@tensp
	SELECT @gia=GIA FROM dbo.SANPHAM WHERE MA_SP=@idsp
	SELECT @soluongton = SOLUONG FROM dbo.SANPHAM
	IF (@soluongton < @soluong) RETURN 0
	ELSE
	BEGIN
		IF (SELECT COUNT(*) FROM dbo.PHIEUXUAT WHERE MA_PX = @mapx) = 0
		BEGIN
			INSERT dbo.PHIEUXUAT ( MA_NV, NGAYXUAT ) VALUES  ( @manv, @ngayxuat)
			SELECT @id=SCOPE_IDENTITY()
		END
		ELSE SET @id = @mapx
		IF (@soluongton > @soluong)
		BEGIN
			IF (SELECT COUNT(*) FROM dbo.CT_PHIEUXUAT WHERE MA_SP=@idsp AND MA_PX=@mapx) = 0
			BEGIN
				INSERT dbo.CT_PHIEUXUAT ( MA_PX, MA_SP, SOLUONG, DONGIA )VALUES  ( @id, @idsp, @soluong, @gia )
				UPDATE dbo.SANPHAM SET SOLUONG=SOLUONG-@soluong WHERE TEN_SP = @tensp
			END
			ELSE
			BEGIN
				UPDATE dbo.CT_PHIEUXUAT SET SOLUONG=SOLUONG+@soluong WHERE MA_PX=@mapx AND MA_SP=@idsp
			END
		END
	END
END

GO
/****** Object:  StoredProcedure [dbo].[USP_UpdateNCC]    Script Date: 26/05/2019 1:46:45 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-------SUA----------
CREATE PROC [dbo].[USP_UpdateNCC]
  @MANCC INT,
  @TENNCC NVARCHAR(100),
  @DIACHINCC NVARCHAR(100),
  @SDTNCC INT,
  @WEBSITENCC CHAR(50)

AS
BEGIN
	UPDATE dbo.NHACUNGCAP SET TEN_NCC=@TENNCC,DIACHI_NCC=@DIACHINCC,SDT_NCC=@SDTNCC,WEBSITE_NCC=@WEBSITENCC WHERE MA_NCC=@MANCC
END

GO
/****** Object:  StoredProcedure [dbo].[USP_UpdatePhieuXuat]    Script Date: 26/05/2019 1:46:45 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[USP_UpdatePhieuXuat]
	@mapx INT,
	@mact INT,
	@manv INT,
	@ngayxuat DATE,
	@tensp NVARCHAR(100),
	@soluong INT
AS
BEGIN
	DECLARE @masp INT,@soluongxuat INT,@maspct INT, @dongia FLOAT,@soluongton INT
	SELECT @masp=MA_SP,@dongia = GIA,@soluongton=SOLUONG FROM dbo.SANPHAM WHERE TEN_SP=@tensp
	IF (@soluongton + (SELECT SOLUONG FROM dbo.CT_PHIEUXUAT WHERE MA_CTPX=@mact) < @soluong OR @soluong=0) RETURN 0
	ELSE
	BEGIN
		SELECT @maspct=MA_SP,@soluongxuat=SOLUONG FROM dbo.CT_PHIEUXUAT WHERE MA_CTPX=@mact
		UPDATE dbo.PHIEUXUAT SET MA_NV=@manv,NGAYXUAT=@ngayxuat WHERE MA_PX=@mapx
		IF ( @maspct <> @masp)
		BEGIN
			UPDATE dbo.SANPHAM SET SOLUONG=SOLUONG+@soluongxuat WHERE MA_SP=@maspct
			UPDATE dbo.CT_PHIEUXUAT SET MA_SP = @masp , SOLUONG = @soluong WHERE MA_CTPX=@mact
			UPDATE dbo.SANPHAM SET SOLUONG = SOLUONG - @soluong WHERE MA_SP=@masp
		END
		ELSE
		BEGIN
			UPDATE dbo.SANPHAM SET SOLUONG = SOLUONG + @soluongxuat - @soluong WHERE MA_SP=@masp
			UPDATE dbo.CT_PHIEUXUAT SET SOLUONG = @soluong WHERE MA_CTPX=@mact
		END
		UPDATE dbo.CT_PHIEUXUAT SET DONGIA = @dongia WHERE MA_CTPX = @mact
	END
END

GO
USE [master]
GO
ALTER DATABASE [TT_QLKHO] SET  READ_WRITE 
GO
