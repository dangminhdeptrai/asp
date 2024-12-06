﻿Use Master
GO
    IF exists(Select name From sys.databases Where name='shopgiay' )
    DROP Database shopgiay
GO
    Create Database shopgiay
GO

USE shopda;

CREATE TABLE CUAHANG(
	MaCH int primary key identity(1,1),
	Ten nvarchar(100) not null,
	DienThoai varchar(20),
	DiaChi nvarchar(100)
) 
GO

CREATE TABLE NHANHANG(
	MaNH int primary key identity(1,1),
	Ten nvarchar(100) not null
) 
GO

CREATE TABLE MATHANG(
	MaMH int primary key identity(1,1),
	Ten nvarchar(100) not null,
	GiaGoc int default 0,
	GiaBan int default 0,
	SoLuong smallint default 0,
	MoTa nvarchar(1000),
	HinhAnh varchar(255),
	MaNH int not null foreign key(MaNH) references NHANHANG(MaNH),
	LuotXem int default 0,
	LuotMua int default 0
) 
GO

CREATE TABLE NHANVIEN(
	MaNV int primary key identity(1,1),
	Ten nvarchar(100) not null,
	DienThoai varchar(20),
	Email varchar(50),
	MatKhau varchar(255)	
) 
GO

CREATE TABLE KHACHHANG(
	MaKH int primary key identity(1,1),
	Ten nvarchar(100) not null,
	DienThoai varchar(20),
	Email varchar(50),
	MatKhau varchar(255)
) 
GO

CREATE TABLE HOADON(
	MaHD int primary key identity(1,1),
	Ngay datetime default getdate(),
	TongTien int default 0,
	MaKH int not null foreign key(MaKH) references KHACHHANG(MaKH),
	TrangThai int default 0
) 
GO

CREATE TABLE CTHOADON(
	MaCTHD int primary key identity(1,1),
	MaHD int not null foreign key(MaHD) references HOADON(MaHD),	
	MaMH int not null foreign key(MaMH) references MATHANG(MaMH),
	DonGia int default 0,
	SoLuong smallint default 1,
	ThanhTien int
) 
GO

-- Dữ liệu bảng CUA_HANG
INSERT INTO CUAHANG(Ten, DienThoai, DiaChi) VALUES(N'Cửa hàng giày bóng đá NLDM','0296-3456789',N'99 Trần Hưng Đạo, P. Mỹ Xuyên, TP. Long Xuyên, An Giang');

-- Dữ liệu bảng LOAI_HANG
INSERT INTO NHANHANG(Ten) VALUES(N'Nike');
INSERT INTO NHANHANG(Ten) VALUES(N'Adidas');
INSERT INTO NHANHANG(Ten) VALUES(N'Puma');

-- Dữ liệu bảng MAT_HANG
INSERT INTO MATHANG(Ten,MoTa,GiaGoc,GiaBan,SoLuong,HinhAnh,MaNH,LuotXem,LuotMua) VALUES(N'Giày đá bóng Nike Tiempo Legend 10 Pro FG Mad Voltage - Metallic Silver/Black/Volt DV4333-001',N'Công nghệ FlyTouch Plus được coi là Chất liệu da tổng hợp nhẹ nhàng và mềm mại hơn da K, hứa hẹn mang đến khả năng kiểm soát bóng tốt hơn cho các cầu thủ khi thi đấu trên sân. FlyTouch Plus nhờ khả năng chống nước vượt trội, hỗ trợ tối đa khả năng giữ form giày, đồng thời vẫn giữ nguyên được đặc trưng vốn có của dòng Tiempo: siêu nhẹ và hỗ trợ tăng tốc tối đa. Đặc biệt, các đường gấp khúc ở đầu mũi giày và một phần đục lỗ ở trên logo Swoosh của Tiempo 9 sẽ bị loại bỏ, Tiempo 10 chỉ giữ lại thiết kế logo Swoosh và cấu trúc của lưỡi giày. Chứng tỏ rằng, giao diện của Tiempo 10 sẽ không có sự thay đổi quá nhiều so với những mẫu giày hiện tại. ',4439000,3490000,10,'n1.jpg',1,0,0);
INSERT INTO MATHANG(Ten,MoTa,GiaGoc,GiaBan,SoLuong,HinhAnh,MaNH,LuotXem,LuotMua) VALUES(N'Giày đá bóng Nike Phantom GX II Academy MG Mad Voltage - Metallic Silver/Black/Volt FD6723-003',N'Chất liệu da tổng hợp kết hợp lớp phủ Nikeskin hình xoắn ốc tạo nên điểm cuốn hút cho ngoại hình và giúp tăng cảm giác bóng ở bề mặt tiếp xúc. Lưỡi gà lệch chéo để giúp tăng diện tích mặt tiếp xúc bóng ở mu bàn chân, đây có thể coi là một ưu điểm xuất sắc giúp các cầu thủ cảm giác bóng và hỗ trợ sút bóng chuẩn xác hơn. Đây là thiết kế khác biệt hoàn toàn so với lưỡi gà của Mercurial và Tiempo. Khuôn đế được sử dụng công nghệ Nike Cyclone 360 hỗ trợ các cầu thủ trong quá trình bức tốc và chuyển hướng trên sân cỏ trở nên linh hoạt hơn.',2150000,2150000,20,'n2.jpg',1,0,0);
INSERT INTO MATHANG(Ten,MoTa,GiaGoc,GiaBan,SoLuong,HinhAnh,MaNH,LuotXem,LuotMua) VALUES(N'Giày đá bóng Nike Phantom Luna II Academy TF Mad Voltage - Metallic Silver/Black/Volt FJ2566-003',N'Chất liệu da tổng hợp kết hợp lớp phủ Nikeskin hình xoắn ốc tạo nên điểm cuốn hút cho ngoại hình và giúp tăng cảm giác bóng ở bề mặt tiếp xúc. Lưỡi gà lệch chéo để giúp tăng diện tích mặt tiếp xúc bóng ở mu bàn chân, đây có thể coi là một ưu điểm xuất sắc giúp các cầu thủ cảm giác bóng và hỗ trợ sút bóng chuẩn xác hơn. Đây là thiết kế khác biệt hoàn toàn so với lưỡi gà của Mercurial và Tiempo. Thiết cổ cao hỗ trợ cổ chân người chơi luôn trong trạng thái chắc chắn khi di chuyển cũng như ngăn những hạt cao su đen từ sân cỏ nhân tạo bay vào. Đinh TF đặc trưng của Nike giống với 2 dòng sản phẩm Mercurial. Đây có lẽ là thiết kế đinh TF tối ưu nhất ở thời điểm hiện tại.',3003000,2350000,20,'n3.jpg',1,0,0);
INSERT INTO MATHANG(Ten,MoTa,GiaGoc,GiaBan,SoLuong,HinhAnh,MaNH,LuotXem,LuotMua) VALUES(N'Giày đá bóng Nike Air Zoom Mercurial Vapor 16 Academy MG Mad Voltage - Volt/Black FQ8374-700',N'Chất liệu da tổng hợp NikeSkin mới được xử lý trở nên mềm và tăng tối đa khả năng cảm giác bóng cho người chơi. Cổ giày rời dễ chịu thoải mái, hỗ trợ người chơi có form chân bè dễ dàng mang vào. Phần đế của Nike Mercurial 2024 cũng được thiết kế lại hoàn toàn với cấu trúc đinh mới. Hai đinh ở trung tâm bàn chân được thay thế bằng các đường vân dập nổi độc đáo (Speed fins), trong khi đinh gót giữ nguyên thiết kế. Sự thay đổi này giúp tăng cường độ bám sân, hỗ trợ cầu thủ xoay trở linh hoạt và kiểm soát bóng tốt hơn.',2150000,2150000,20,'n5.jpg',1,0,0);
INSERT INTO MATHANG(Ten,MoTa,GiaGoc,GiaBan,SoLuong,HinhAnh,MaNH,LuotXem,LuotMua) VALUES(N'Giày đá bóng Nike Phantom GX II Pro TF Mad Voltage - Metallic Silver/Black/Volt FJ2583-003',N'Phần upper là điểm cải tiến lớn nhất ở phiên bản Phantom GX II này, nó được làm từ chất liệu sợi dệt Flyknit siêu mỏng và nhẹ, nhưng vẫn giữ được độ bền và đàn hồi cần thiết để tối ưu cho những pha di chuyển linh hoạt của người chơi trên sân cỏ. Phủ lên trên upper đó là công nghệ ACC (All Conditions Control) giúp người chơi có thể kiểm soát bóng tốt nhất trong mọi điều kiện thời tiết. Phần mũi giày có các vân vòng tròn được in dập nổi ở những vùng tiếp xúc bóng chủ yếu giúp tăng thêm độ xoáy cho những cú phất bóng và cứa lòng được Nike gọi là Công nghệ Strike Zone. Dây giày đặc trưng của dòng Phantom tiếp tục được duy trì với thiết kế lệch về phía má ngoài nhằm mở rộng diện tích sút và chuyền bóng.',4109000,2790000,20,'n6.jpg',1,0,0);
INSERT INTO MATHANG(Ten,MoTa,GiaGoc,GiaBan,SoLuong,HinhAnh,MaNH,LuotXem,LuotMua) VALUES(N'Giày đá bóng Nike Air Zoom Mercurial Superfly 10 Academy MG Mbappé Personal Edition - FQ8293-800',N'Chất liệu da tổng hợp NikeSkin mới được xử lý trở nên mềm và tăng tối đa khả năng cảm giác bóng cho người chơi. Thiết cổ cao hỗ trợ cổ chân người chơi luôn trong trạng thái chắc chắn khi di chuyển cũng như ngăn những hạt cao su đen từ sân cỏ nhân tạo bay vào. Phần đế của Nike Mercurial 2024 cũng được thiết kế lại hoàn toàn với cấu trúc đinh mới. Hai đinh ở trung tâm bàn chân được thay thế bằng các đường vân dập nổi độc đáo (Speed fins), trong khi đinh gót giữ nguyên thiết kế. Sự thay đổi này giúp tăng cường độ bám sân, hỗ trợ cầu thủ xoay trở linh hoạt và kiểm soát bóng tốt hơn.',3169000,2390000,20,'n7.jpg',1,0,0);;
INSERT INTO MATHANG(Ten,MoTa,GiaGoc,GiaBan,SoLuong,HinhAnh,MaNH,LuotXem,LuotMua) VALUES(N'Giày đá bóng Nike Air Zoom Mercurial Superfly 10 Academy MG Shadow - Black/Deep Jungle FQ1456-002',N'Chất liệu da tổng hợp NikeSkin mới được xử lý trở nên mềm và tăng tối đa khả năng cảm giác bóng cho người chơi. Thiết cổ cao hỗ trợ cổ chân người chơi luôn trong trạng thái chắc chắn khi di chuyển cũng như ngăn những hạt cao su đen từ sân cỏ nhân tạo bay vào. Phần đế của Nike Mercurial 2024 cũng được thiết kế lại hoàn toàn với cấu trúc đinh mới. Hai đinh ở trung tâm bàn chân được thay thế bằng các đường vân dập nổi độc đáo (Speed fins), trong khi đinh gót giữ nguyên thiết kế. Sự thay đổi này giúp tăng cường độ bám sân, hỗ trợ cầu thủ xoay trở linh hoạt và kiểm soát bóng tốt hơn.',2929000,2350000,20,'n8.jpg',1,0,0);
INSERT INTO MATHANG(Ten,MoTa,GiaGoc,GiaBan,SoLuong,HinhAnh,MaNH,LuotXem,LuotMua) VALUES(N'Giày đá bóng Nike Air Zoom Mercurial Vapor 16 Academy MG Shadow - Black/Deep Jungle FQ8374-002',N'Chất liệu da tổng hợp NikeSkin mới được xử lý trở nên mềm và tăng tối đa khả năng cảm giác bóng cho người chơi. Cổ giày rời dễ chịu thoải mái, hỗ trợ người chơi có form chân bè dễ dàng mang vào. Phần đế của Nike Mercurial 2024 cũng được thiết kế lại hoàn toàn với cấu trúc đinh mới. Hai đinh ở trung tâm bàn chân được thay thế bằng các đường vân dập nổi độc đáo (Speed fins), trong khi đinh gót giữ nguyên thiết kế. Sự thay đổi này giúp tăng cường độ bám sân, hỗ trợ cầu thủ xoay trở linh hoạt và kiểm soát bóng tốt hơn.',2669000,2150000,15,'n9.jpg',1,0,0);
INSERT INTO MATHANG(Ten,MoTa,GiaGoc,GiaBan,SoLuong,HinhAnh,MaNH,LuotXem,LuotMua) VALUES(N'Giày đá bóng Nike Air Zoom Mercurial Vapor 16 Academy TF Shadow - Black/Deep Jungle FQ8449-002',N'Chất liệu da tổng hợp NikeSkin mới được xử lý trở nên mềm và tăng tối đa khả năng cảm giác bóng cho người chơi. Thiết cổ cao hỗ trợ cổ chân người chơi luôn trong trạng thái chắc chắn khi di chuyển cũng như ngăn những hạt cao su đen từ sân cỏ nhân tạo bay vào. Phần đế đệm Airzoom êm ái và hạn chế phản lực bề mặt sân nhân tạo cứng tác động lên cổ chân và đầu gối. Khuôn đế Nike Grind được tái chế từ rác nhựa nằm trong dự án loại bỏ sự lãng phí, khép lại vòng đời của sản phẩm nike bảo vệ môi trường.  Giày đá bóng Nike Air Zoom Mercurial Vapor 16 Academy TF đã được nâng cấp bộ đinh dăm mới hình thoi, chắc chắn hơn nhưng vẫn đảm bảo tốc độ, di chuyển linh hoạt.',2629000,1990000,10,'n10.jpg',1,0,0);
INSERT INTO MATHANG(Ten,MoTa,GiaGoc,GiaBan,SoLuong,HinhAnh,MaNH,LuotXem,LuotMua) VALUES(N'Giày đá bóng adidas Predator Elite TF Vivid Horizon - Platin Metallic/Aurora Black/Turbo IF6373',N'Predator Elite TF gây ấn tượng khi sử dụng công nghệ tân tiến HybridTouch 2.0 với chất liệu sợi dệt nhân tạo để mang lại cảm giác thoải mái và vừa vặn như da lộn hỗ trợ tối đa trong việc kiểm soát bóng. Sự liên tục phát triển và cải tiến của thiết kế vân cao su 3D nổi Strikeskin tạo ra một dấu ấn đặc biệt, đặc trưng cho mỗi phiên bản của dòng giày Predator qua các năm, giúp tăng độ bám đáng kể cho các cú sút thêm chuẩn xác. Đế giữa Lightstrike dáng thấp và đế đinh bằng cao su tăng độ bám sân giúp người chơi dễ dàng xoay chuyển cũng như bức tốc. Lớp lót nhung êm ái ở gót giày. Đặc biệt chất liệu có chứa tối thiểu 20% thành phần tái chế.',3500000,2690000,20,'a1.jpg',2,0,0);
INSERT INTO MATHANG(Ten,MoTa,GiaGoc,GiaBan,SoLuong,HinhAnh,MaNH,LuotXem,LuotMua) VALUES(N'Giày đá bóng adidas F50 Pro TF Vivid Horizon - Turbo/Aurora Black/Platin Metallic IF1324',N'Upper làm từ sợi tổng hợp Fibertouch siêu mỏng và đàn hồi, mang đến sự thoải mái và cảm giác chạm bóng thật chân nhất cho người chơi. Phủ lên trên là công nghệ Sprintweb 3D được phủ ở những khu vực tiếp xúc bóng sẽ giúp tăng ma sát khi tiếp xúc với bóng, giúp người mang có thể dễ dàng kiểm soát và rê bóng tốt hơn. Lười gà rời với công nghệ Compression Fit Tunnel được làm mỏng nhưng chắc chắn tạo nên cảm giác vừa vặn nhất cho bàn chân người mang. Khung bọc gót TPU giúp bảo vệ gót chân, hạn chế tình trạng nhấc gót khi thi đấu ở cường độ cao. Đệm gót được làm bằng vải nhung hạn chế tình trạng phồng gót khi thi đấu. Sự kết hợp giữa đế giữa Lightstrike và đế ngoài bằng cao su Lug giúp đôi giày đàn hồi tốt.',3500000,2750000,10,'a2.jpg',2,0,0);
INSERT INTO MATHANG(Ten,MoTa,GiaGoc,GiaBan,SoLuong,HinhAnh,MaNH,LuotXem,LuotMua) VALUES(N'Giày đá bóng adidas Copa Gloro II TF - Lucid Blue/Footwear White/Solar Red IH7286',N'Cổ giày rời tạo nên sự chắc chắn hơn và phù hợp cho form chân bè dễ dàng mang vào. Điểm nhấn trên đôi giày này chính là lưỡi gà gập có thể cắt rời mang chút hoài niệm về Huyền thoại Copa Mundial. Với Upper được làm từ da bê mềm mại kết hợp cùng các đường may đôi mắt lưới giúp đôi giày ổn định và giữ form tốt sau thời gian dài sử dụng. Bộ đệm Lightstrike trang bị trên đôi Copa Gloro này giúp hạn chế phản lực từ bề mặt sân lên chân và gối. Gót có lớp đệm bằng vải nhung êm ái tránh bị phồng gót khi thi đấu ở cường độ cao. Đôi giày có chứa 20% làm từ vật liệu tái chế.',2500000,1950000,15,'a3.jpg',2,0,0);
INSERT INTO MATHANG(Ten,MoTa,GiaGoc,GiaBan,SoLuong,HinhAnh,MaNH,LuotXem,LuotMua) VALUES(N'Giày đá bóng adidas F50 League TF Reemergence - Solar Blue/Footwear White/Solar Pink IF1336',N'Upper làm từ sợi tổng hợp Fiberskin siêu mỏng và đàn hồi, mang đến sự thoải mái và cảm giác chạm bóng thật chân nhất cho người chơi. Phủ lên trên là công nghệ Sprintgrid được phủ ở những khu vực tiếp xúc bóng sẽ giúp tăng ma sát khi tiếp xúc với bóng, giúp người mang có thể dễ dàng kiểm soát và rê bóng tốt hơn. Khung bọc gót TPU giúp bảo vệ gót chân, hạn chế tình trạng nhấc gót khi thi đấu ở cường độ cao. Đệm gót được làm bằng vải nhung hạn chế tình trạng phồng gót khi thi đấu. Phần đế adidas F50 League TF được trang bị bộ đệm EVA siêu êm ái kết hợp ghép 2 mảng mặt đinh cao su trong tác biệt hoàn toàn. Điều này tăng độ êm trong từng bước di chuyển của người chơi trên bề mặt sân nhân tạo, giảm tối đa phản lực tác động lên các khớp chân, gối của người chơi.',2400000,1850000,20,'a4.jpg',2,0,0);
INSERT INTO MATHANG(Ten,MoTa,GiaGoc,GiaBan,SoLuong,HinhAnh,MaNH,LuotXem,LuotMua) VALUES(N'Giày đá bóng adidas F50 Messi League TF Triunfo Dorado - Gold Metallic/Core Black IG9282',N'Da tổng hợp Hybridtouch được mô phỏng theo da tự nhiên cho cảm giác siêu nhẹ và thoải mái. Phủ lên trên là công nghệ Sprintgrid được phủ ở những khu vực tiếp xúc bóng sẽ giúp tăng ma sát khi tiếp xúc với bóng, giúp người mang có thể dễ dàng kiểm soát và rê bóng tốt hơn. Khung bọc gót TPU giúp bảo vệ gót chân, hạn chế tình trạng nhấc gót khi thi đấu ở cường độ cao. Đệm gót được làm bằng vải nhung hạn chế tình trạng phồng gót khi thi đấu. Phần đế adidas F50 League TF được trang bị bộ đệm EVA siêu êm ái kết hợp ghép 2 mảng mặt đinh cao su trong tác biệt hoàn toàn. Điều này tăng độ êm trong từng bước di chuyển của người chơi trên bề mặt sân nhân tạo, giảm tối đa phản lực tác động lên các khớp chân, gối của người chơi.',2400000,1890000,20,'a5.jpg',2,0,0);
INSERT INTO MATHANG(Ten,MoTa,GiaGoc,GiaBan,SoLuong,HinhAnh,MaNH,LuotXem,LuotMua) VALUES(N'Giày đá bóng adidas F50 League TF Dark Spark - Core Black/Iron Metal/Gold Metallic IF1337',N'Upper làm từ sợi tổng hợp Fiberskin siêu mỏng và đàn hồi, mang đến sự thoải mái và cảm giác chạm bóng thật chân nhất cho người chơi. Phủ lên trên là công nghệ Sprintgrid được phủ ở những khu vực tiếp xúc bóng sẽ giúp tăng ma sát khi tiếp xúc với bóng, giúp người mang có thể dễ dàng kiểm soát và rê bóng tốt hơn. Khung bọc gót TPU giúp bảo vệ gót chân, hạn chế tình trạng nhấc gót khi thi đấu ở cường độ cao. Đệm gót được làm bằng vải nhung hạn chế tình trạng phồng gót khi thi đấu. Phần đế adidas F50 League TF được trang bị bộ đệm EVA siêu êm ái kết hợp ghép 2 mảng mặt đinh cao su trong tác biệt hoàn toàn. Điều này tăng độ êm trong từng bước di chuyển của người chơi trên bề mặt sân nhân tạo, giảm tối đa phản lực tác động lên các khớp chân, gối của người chơi.',2400000,1790000,10,'a6.jpg',2,0,0);
INSERT INTO MATHANG(Ten,MoTa,GiaGoc,GiaBan,SoLuong,HinhAnh,MaNH,LuotXem,LuotMua) VALUES(N'Giày đá bóng adidas F50 Elite FG Advancement - Footwear White/Solar Red/Lucid Blue IF8818',N'Lấy cảm hứng từ người tiền nhiệm, Adidas F50 có thân giày làm từ sợi tổng hợp Fibertouch siêu mỏng và nhẹ, mang đến sự thoải mái và cảm giác chạm bóng thật chân nhất cho người chơi. Phủ lên trên là công nghệ Sprintweb 3D được phủ ở những khu vực tiếp xúc bóng sẽ giúp tăng ma sát khi tiếp xúc với bóng, hỗ trợ cho những tình huống rê dắt bóng ở tốc độ cao. Đặc biệt, trên thế hệ F50 mới này, adidas đã trình làng công nghệ đế ngoài hoàn toàn mới với tên gọi Sprint Frame 360. Đế ngoài này sẽ bao gồm những đinh hình mũi tên ở giữa, và hình bán trụ ở phía ngoài nhằm tạo sự vững chắc cho bàn chân khi bứt tốc, hỗ trợ tốc độ đa khả năng tăng tốc. Lười gà rời với công nghệ Compression Fit Tunnel được làm mỏng nhưng chắc chắn tạo nên cảm giác vừa vặn nhất cho bàn chân người mang. ',5800000,3950000,20,'a7.jpg',2,0,0);
INSERT INTO MATHANG(Ten,MoTa,GiaGoc,GiaBan,SoLuong,HinhAnh,MaNH,LuotXem,LuotMua) VALUES(N'Giày đá bóng adidas Predator Elite TF Advancement - Lucid Blue/Footwear White/Solar Red IF6372',N'Predator Elite TF gây ấn tượng khi sử dụng công nghệ tân tiến HybridTouch 2.0 với chất liệu sợi dệt nhân tạo để mang lại cảm giác thoải mái và vừa vặn như da lộn hỗ trợ tối đa trong việc kiểm soát bóng. Sự liên tục phát triển và cải tiến của thiết kế vân cao su 3D nổi Strikeskin tạo ra một dấu ấn đặc biệt, đặc trưng cho mỗi phiên bản của dòng giày Predator qua các năm, giúp tăng độ bám đáng kể cho các cú sút thêm chuẩn xác. Đế giữa Lightstrike dáng thấp và đế đinh bằng cao su tăng độ bám sân giúp người chơi dễ dàng xoay chuyển cũng như bức tốc. Lớp lót nhung êm ái ở gót giày. Đặc biệt chất liệu có chứa tối thiểu 20% thành phần tái chế. Sản phẩm Adidas Predator được các cầu thủ nổi tiếng đại diện gồm có Jude Bellingham, Gundogan, Gavi...',3500000,2490000,20,'a8.jpg',2,0,0);
INSERT INTO MATHANG(Ten,MoTa,GiaGoc,GiaBan,SoLuong,HinhAnh,MaNH,LuotXem,LuotMua) VALUES(N'Giày đá bóng adidas Copa Pure 2 Elite TF Advancement - Footwear White/Lucid Blue/Solar Red',N'Cổ giày rời tạo nên sự chắc chắn hơn và phù hợp cho form chân bè dễ dàng mang vào. Phần upper làm từ chất liệu da bê cao cấp cho cảm giác banh tốt. Phần đế được tích hợp bộ đệm Lightstrike hỗ trợ êm ái, giảm chấn khi thi đấu. Gót có lớp đệm bằng vải nhung êm ái tránh bị phồng gót khi thi đấu ở cường độ cao.',3200000,2450000,20,'a9.jpg',2,0,0);
INSERT INTO MATHANG(Ten,MoTa,GiaGoc,GiaBan,SoLuong,HinhAnh,MaNH,LuotXem,LuotMua) VALUES(N'Giày đá bóng adidas Top Sala Competition IC - Shadow Red/Off White/Yellow IE7549',N'Chất liệu da tổng hợp ở phần sau giót giúp định hình form giày cứng cáp, chất liệu giả da (Simili) mềm mại ở phần mũi mang lại cảm giác êm ái và sự mềm mại trong những pha chạm bóng. Lưỡi gà rời giúp người chơi có Form chân thon lẫn chân bè dễ dàng xỏ vào. Bộ đệm LIGHTSTRIKE hỗ trợ sự êm ái cho người chơi, giúp phản ứng nhanh, linh động hóa từng bước chạy, giúp người chơi sẽ không phải bận tâm về những chấn thương khi chạy. Khuôn đế được thiết kế khoa học và bám sân, hỗ trợ người chơi dễ dàng xoay chuyển cũng như bức tốc. Trọng lượng giày được tối giản ở mức nhẹ nhất.',2000000,1890000,15,'a10.jpg',2,0,0);
INSERT INTO MATHANG(Ten,MoTa,GiaGoc,GiaBan,SoLuong,HinhAnh,MaNH,LuotXem,LuotMua) VALUES(N'Giày đá banh PUMA Future 7 Match TT Vol. Up - White-Luminous Melon-Bluemazing 108075-01',N'Upper được làm bằng da tổng hợp mềm mại nhưng không được phủ bóng, dây giày thông thường nên ngoại hình chỉ 8/10 so với phiên bản cao cấp Future Ultimate. Cấu trúc FUZIONFIT360 tân tiến kết hợp cùng dải băng mô phỏng công nghệ PWRTAPE trên phiên bản Ultimate co giãn, đàn hồi cực tốt được thiết kế zig-zag trên thân giày, tối ưu độ vừa vặn với mọi bàn chân, hỗ trợ hiệu quả cho quá trình di chuyển và tăng tốc. Kết cấu 3D Engineered Control Zone bao gồm các hạt được in dập nổi được phân bổ trên thân giày đặc biệt ở những nơi tiếp xúc bóng thường xuyên giúp dễ dàng kiểm soát khi sút và rê bóng ở những đường chuyền nhanh tốc độ.',2259000,1990000,15,'p1.jpg',3,0,0);
INSERT INTO MATHANG(Ten,MoTa,GiaGoc,GiaBan,SoLuong,HinhAnh,MaNH,LuotXem,LuotMua) VALUES(N'Giày đá banh PUMA Ultra 5 Pro Cage TT Formula - Lapis Lazuli/PUMA White/Sunset Glow 107889-01',N'PWRTAPE là khung hỗ trợ được làm từ chất liệu TPU, được bố trí ở phần upper của giày, giúp tăng cường sự ổn định cho bàn chân trong những pha di chuyển tốc độ cao. Khung hỗ trợ này được thiết kế để co giãn theo chuyển động của bàn chân, mang đến sự linh hoạt tối đa mà không làm giảm sự ổn định. Upper chất liệu vải siêu nhẹ, được thiết kế với cấu trúc 4 chiều, giúp giảm trọng lượng và ma sát, mang đến cảm giác thoải mái và linh hoạt tối đa. Bên trên được phủ lớp silicon GRIPCONTROL PRO giúp tăng độ bám, chất liệu này cũng có khả năng thoáng khí tốt, giúp giữ cho bàn chân luôn khô thoáng và thoải mái trong suốt trận đấu. Lót giày được thiết kế nhẹ, có thể tháo rời, được trang bị công nghệ Nano Grip, mang đến sự thoải mái và hỗ trợ tối ưu cho bàn chân.',3099000,2490000,20,'p2.jpg',3,0,0);
INSERT INTO MATHANG(Ten,MoTa,GiaGoc,GiaBan,SoLuong,HinhAnh,MaNH,LuotXem,LuotMua) VALUES(N'Giày đá banh PUMA Future 7 Pro Cage TT Formula - Bluemazing/PUMA White/Electric Peppermint 107923-01',N'Upper được làm bằng da tổng hợp mềm mại, độ đàn hồi cao Công nghệ Fuzionfit 360 , một điểm đặc biệt của dòng giày Future, tiếp tục làm nổi bật trong phiên bản này. Sự ôm chặt chân, thoải mái và linh hoạt được tối ưu hóa, cho phép giày phù hợp với mọi hình dạng bàn chân, mang đến cảm giác vừa vặn. Dải Pwrtape được đưa lên phía trên lưỡi gà với hình dạng chữ Y thay vì hình zig zag trước đó giúp tạo ra cảm giác ôm sát hoàn toàn, giúp đôi giày có thể fit vừa vặn với bàn chân các cầu thủ khi mang. Phiên bản nâng cấp lần này còn giới thiệu thêm công nghệ vân nổi 3D độc đáo Pwrprint ở những vị trí tiếp xúc bóng giúp gia tăng sự ổn định và nâng cao khả năng kiểm soát bóng khi người chơi xử lý ở tốc độ cao.',3099000,2490000,20,'p3.jpg',3,0,0);
INSERT INTO MATHANG(Ten,MoTa,GiaGoc,GiaBan,SoLuong,HinhAnh,MaNH,LuotXem,LuotMua) VALUES(N'Giày đá banh PUMA Future 7 Match TT Formula - Bluemazing/PUMA White/Electric Peppermint 107937-01',N'Upper được làm bằng da tổng hợp mềm mại nhưng không được phủ bóng, dây giày thông thường nên ngoại hình chỉ 8/10 so với phiên bản cao cấp Future Ultimate. Cấu trúc FUZIONFIT360 tân tiến kết hợp cùng dải băng mô phỏng công nghệ PWRTAPE trên phiên bản Ultimate co giãn, đàn hồi cực tốt được thiết kế zig-zag trên thân giày, tối ưu độ vừa vặn với mọi bàn chân, hỗ trợ hiệu quả cho quá trình di chuyển và tăng tốc. Kết cấu 3D Engineered Control Zone bao gồm các hạt được in dập nổi được phân bổ trên thân giày đặc biệt ở những nơi tiếp xúc bóng thường xuyên giúp dễ dàng kiểm soát khi sút và rê bóng ở những đường chuyền nhanh tốc độ. Hệ thống đinh TF ở mặt đế ngoài sở hữu cấu trúc hình chữ Z đặc trưng cải thiện độ bám sân và cho phép xoay chuyển, thay đổi phương hướng dễ dàng linh hoạt.',2259000,1990000,15,'p4.jpg',3,0,0);
INSERT INTO MATHANG(Ten,MoTa,GiaGoc,GiaBan,SoLuong,HinhAnh,MaNH,LuotXem,LuotMua) VALUES(N'Giày đá bóng PUMA Ultra Ultimate TT Forever Faster - Sun Stream/PUMA Black/Sunset Glow 107745-03',N'Sản phẩm được các cầu thủ nổi tiếng đại diện gồm có Antoine Griezmann, Kingsley Coman....Cổ thun liền được làm bằng lưới dệt cao cấp mang lại sự chắc chắn và mang lại sự linh hoạt cho người chơi khi mang. Upper dệt từ công nghệ Ultraweave mới Đây là chất liệu được sử dụng trên áo thi đấu của PUMA với đặc trưng mỏng, mềm và dẻo, rất linh hoạt co giãn theo hình dạng của bàn chân. Được trang bị công nghệ PWRTape để tăng cường độ chắc chắn ở phần gót chân không bị lỏng lẻo khi di chuyển cũng như bức tốc. Đế giày được trang bị bộ đệm êm ái hỗ trợ bật nhảy cũng như bứt tốc cho người chơi. Khuôn đế với thiết kế dàn đinh mới tăng độ bám sân cũng như xoay chuyển bức tốc linh hoạt trên sân cỏ nhân tạo.',3099000,1850000,20,'p5.jpg',3,0,0);
INSERT INTO MATHANG(Ten,MoTa,GiaGoc,GiaBan,SoLuong,HinhAnh,MaNH,LuotXem,LuotMua) VALUES(N'Giày đá bóng PUMA Future 7 Pro Cage TT Forever Faster - Sunset Glow/PUMA Black/Sun Stream 107710-04',N'Upper được làm bằng da tổng hợp mềm mại, độ đàn hồi cao Công nghệ Fuzionfit 360 , một điểm đặc biệt của dòng giày Future, tiếp tục làm nổi bật trong phiên bản này. Sự ôm chặt chân, thoải mái và linh hoạt được tối ưu hóa, cho phép giày phù hợp với mọi hình dạng bàn chân, mang đến cảm giác vừa vặn. Dải Pwrtape được đưa lên phía trên lưỡi gà với hình dạng chữ Y thay vì hình zig zag trước đó giúp tạo ra cảm giác ôm sát hoàn toàn, giúp đôi giày có thể fit vừa vặn với bàn chân các cầu thủ khi mang. Phiên bản nâng cấp lần này còn giới thiệu thêm công nghệ vân nổi 3D độc đáo Pwrprint ở những vị trí tiếp xúc bóng giúp gia tăng sự ổn định và nâng cao khả năng kiểm soát bóng khi người chơi xử lý ở tốc độ cao.',3099000,2090000,10,'p6.jpg',3,0,0);
INSERT INTO MATHANG(Ten,MoTa,GiaGoc,GiaBan,SoLuong,HinhAnh,MaNH,LuotXem,LuotMua) VALUES(N'Giày đá bóng PUMA Ultra Ultimate Cage TT Phenomenal - Poison Pink/PUMA White/PUMA Black 107745-01',N'Sản phẩm được các cầu thủ nổi tiếng đại diện gồm có Antony, Varane.....Cổ thun liền được làm bằng lưới dệt cao cấp mang lại sự chắc chắn và mang lại sự linh hoạt cho người chơi khi mang. Upper dệt từ công nghệ Ultraweave mới Đây là chất liệu được sử dụng trên áo thi đấu của PUMA với đặc trưng mỏng, mềm và dẻo, rất linh hoạt co giãn theo hình dạng của bàn chân. Được trang bị công nghệ PWRTape để tăng cường độ chắc chắn ở phần gót chân không bị lỏng lẻo khi di chuyển cũng như bức tốc. Đế giày được trang bị bộ đệm êm ái hỗ trợ bật nhảy cũng như bứt tốc cho người chơi. Khuôn đế với thiết kế dàn đinh mới tăng độ bám sân cũng như xoay chuyển bức tốc linh hoạt trên sân cỏ nhân tạo.',3099000,1890000,10,'p7.jpg',3,0,0);
INSERT INTO MATHANG(Ten,MoTa,GiaGoc,GiaBan,SoLuong,HinhAnh,MaNH,LuotXem,LuotMua) VALUES(N'Giày đá bóng PUMA Ultra Ultimate FG/AG Gear Up - Ultra Blue/PUMA White/Pro Green 107311-03',N'Sản phẩm được các cầu thủ nổi tiếng đại diện gồm có Antoine Griezmann, Sergio Aguero, Antony.....Upper dệt từ công nghệ Ultraweave mới Đây là chất liệu được sử dụng trên áo thi đấu của PUMA với đặc trưng mỏng, mềm và dẻo, rất linh hoạt co giãn theo hình dạng của bàn chân. Được trang bị công nghệ PWRTape để tăng cường độ chắc chắn ở phần gót chân không bị lỏng lẻo khi di chuyển cũng như bức tốc. Kết cấu PWRPRINT tăng cường tiếp xúc bóng và kiểm soát tốc độ khi rê bóng. Khuôn đế SPEEDPLATE thiết kế mật độ kép giúp người chơi tăng tốc và ghi bàn ở mọi thời điểm.',5500000,3190000,20,'p8.jpg',3,0,0);
INSERT INTO MATHANG(Ten,MoTa,GiaGoc,GiaBan,SoLuong,HinhAnh,MaNH,LuotXem,LuotMua) VALUES(N'Giày đá bóng PUMA Future Match TT Voltage - Sedate Gray/Asphalt/Yellow Blaze 107374-04',N'Upper được làm bằng da tổng hợp mềm mại nhưng không được phủ bóng, dây giày thông thường nên ngoại hình chỉ 8/10 so với phiên bản cao cấp Future Ultimate. Cấu trúc FUZIONFIT360 tân tiến kết hợp cùng dải băng mô phỏng công nghệ PWRTAPE trên phiên bản Ultimate co giãn, đàn hồi cực tốt được thiết kế zig-zag trên thân giày, tối ưu độ vừa vặn với mọi bàn chân, hỗ trợ hiệu quả cho quá trình di chuyển và tăng tốc. Kết cấu 3D Engineered Control Zone bao gồm các hạt được in dập nổi được phân bổ trên thân giày đặc biệt ở những nơi tiếp xúc bóng thường xuyên giúp dễ dàng kiểm soát khi sút và rê bóng ở những đường chuyền nhanh tốc độ. Hệ thống đinh TF ở mặt đế ngoài sở hữu cấu trúc hình chữ Z đặc trưng cải thiện độ bám sân và cho phép xoay chuyển, thay đổi phương hướng dễ dàng linh hoạt.',2259000,1690000,15,'p9.jpg',3,0,0);
INSERT INTO MATHANG(Ten,MoTa,GiaGoc,GiaBan,SoLuong,HinhAnh,MaNH,LuotXem,LuotMua) VALUES(N'Giày đá bóng PUMA Future Match TT Energy - Ultra Blue/Yellow Alert/Luminous Pink 107548-01',N'Upper được làm bằng da tổng hợp mềm mại nhưng không được phủ bóng, dây giày thông thường nên ngoại hình chỉ 8/10 so với phiên bản cao cấp Future Ultimate. Cấu trúc FUZIONFIT360 tân tiến kết hợp cùng dải băng mô phỏng công nghệ PWRTAPE trên phiên bản Ultimate co giãn, đàn hồi cực tốt được thiết kế zig-zag trên thân giày, tối ưu độ vừa vặn với mọi bàn chân, hỗ trợ hiệu quả cho quá trình di chuyển và tăng tốc. Kết cấu 3D được phân bổ trên thân giày đặc biệt ở những nơi tiếp xúc bóng thường xuyên giúp dễ dàng kiểm soát khi sút và rê bóng ở những đường chuyền nhanh tốc độ. Hệ thống đinh TF ở mặt đế ngoài sở hữu cấu trúc hình chữ Z đặc trưng cải thiện độ bám sân và cho phép xoay chuyển, thay đổi phương hướng dễ dàng linh hoạt.',2259000,1690000,20,'p10.jpg',3,0,0);

-- Dữ liệu bảng NHANVIEN
--INSERT INTO NHANVIEN(Ten,DienThoai,Email,MatKhau) VALUES(N'Nguyễn Phước Tân','0909456789','nptan@abc.com','202cb962ac59075b964b07152d234b70');
--INSERT INTO NHANVIEN(Ten,DienThoai,Email,MatKhau) VALUES(N'Dương Thị Mỹ Thuận','0988778899','dtmthuan@abc.com','202cb962ac59075b964b07152d234b70');
--INSERT INTO NHANVIEN(Ten,DienThoai,Email,MatKhau) VALUES(N'Trần Huỳnh Sơn','0903123123','thson@abc.com','202cb962ac59075b964b07152d234b70');
--INSERT INTO NHANVIEN(Ten,DienThoai,Email,MatKhau) VALUES(N'Lê Ngọc Thanh','0913454544','lnthanh@abc.com','202cb962ac59075b964b07152d234b70');

-- Dữ liệu bảng KHACHHANG
--INSERT INTO KHACHHANG(Ten,DienThoai,Email,MatKhau) VALUES(N'','','','');

-- Dữ liệu bảng HOADON
--INSERT INTO HOADON(TongTien,MaKH,TrangThai) VALUES(70000,1,0);


-- Dữ liệu bảng CTHOA_DON
--INSERT INTO CTHOADON(MaHD,MaMH,DonGia,SoLuong,ThanhTien) VALUES(1,2,23000,1,23000);

GO

SELECT * FROM NHANHANG;
delete from nhanhang;
select * FROM MATHANG;

select * from KHACHHANG