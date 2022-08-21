import '../model/product_model.dart';

final List<ProductModel> listProducts = [
  ProductModel(
      "https://cdn.tgdd.vn/Products/Images/8820/252674/bhx/rau-can-nuoc-tui-300g-202110131400068638.jpeg",
      "Rau Cần",
      "Fast 1",
      false,
      10000,
      "V1",
      "vegetable"),
  ProductModel(
      "https://media.cooky.vn/images/blog-2016/rau-bina-la-gi-cong-dung-cua-rau-bina%207.jpg",
      "Rau Bina",
      "Fast 2",
      false,
      10000,
      "V2",
      "vegetable"),
  ProductModel(
      "https://trangvangnongnghiep.net/wp-content/uploads/2021/08/cai-xoan-min.jpg",
      "Rau Cải Xoăn",
      "Fast 3",
      true,
      5000,
      "V3",
      "vegetable"),
  ProductModel(
      "https://www.thuocdantoc.org/wp-content/uploads/2019/10/rau-muong.jpg",
      "Rau Muống",
      "Fast 1",
      false,
      10000,
      "V4",
      "vegetable"),
  ProductModel(
      "https://suckhoedoisong.qltns.mediacdn.vn/Images/nguyenkhanh/2020/09/07/ca_rot_vi_thuoc_chua_2.jpg",
      "Cà Rốt",
      "Fast 2",
      false,
      10000,
      "V5",
      "vegetable"),
  ProductModel(
      "https://trangvangnongnghiep.net/wp-content/uploads/2021/08/cai-xoan-min.jpg",
      "Rau Cải Xoăn",
      "Fast 3",
      true,
      5000,
      "V6",
      "vegetable"),
  ProductModel(
      "https://minhcaumart.vn/media/com_eshop/products/c%20chua%20sach%20an%20ton.jpg",
      "Cà Chua",
      "Fast 1",
      false,
      10000,
      "V7",
      "vegetable"),
  ProductModel(
      "https://www.chuyenkhoadaday.com/wp-content/uploads/2016/10/cach-an-khoai-tay-tot-cho-he-tieu-hoa.jpg",
      "Khoai tây",
      "Fast 2",
      false,
      10000,
      "V8",
      "vegetable"),
  ProductModel(
      "http://bizweb.dktcdn.net/thumb/grande/100/390/808/products/product2263.jpg?v=1592366623437",
      "Xu Hào",
      "Fast 3",
      true,
      5000,
      "V9",
      "vegetable"),
  ProductModel(
      "https://cdn-www.vinid.net/2019/08/Th%E1%BB%8Bt-ba-ch%E1%BB%89-b%C3%B2-m%E1%BB%B9-mua-%E1%BB%9F-%C4%91%C3%A2u-%C4%91%E1%BA%A3m-b%E1%BA%A3o-ch%E1%BA%A5t-l%C6%B0%E1%BB%A3ng.jpg",
      "Thịt Ba Chỉ Bò",
      "Fast 4",
      true,
      100000,
      "M1",
      "meat"),
  ProductModel("https://minhcaumart.vn/media/com_eshop/products/2900097.jpg",
      "Thịt Thăn Lợn", "Fast 5", true, 50000, "M2", "meat"),
  ProductModel(
      "https://thucphamhoangkim.com/wp-content/uploads/2021/08/thit-ba-chi.jpeg",
      "Thịt Ba Chỉ Heo",
      "Fast 4",
      true,
      100000,
      "M3",
      "meat"),
  ProductModel(
      "data:image/jpeg;base64,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",
      "Thịt Lườn Gà",
      "Fast 5",
      true,
      50000,
      "M4",
      "meat"),
  ProductModel(
      "https://hotelmart.vn/uploads/share-images/2019/06/07/1110_i5cfa1133c1dbf.png",
      "Thịt Đùi Gà",
      "Fast 4",
      true,
      100000,
      "M5",
      "meat"),
  ProductModel("https://duylinhfood.com/wp-content/uploads/2019/10/1-6.jpg",
      "Cá Thu Đao", "Fast 5", true, 50000, "M6", "meat"),
  ProductModel(
      "https://ngonaz.com/wp-content/uploads/2021/06/gia-ca-chep-gion-1.jpg",
      "Cá Chép Giòn",
      "Fast 4",
      true,
      100000,
      "M7",
      "meat"),
  ProductModel(
      "https://vietmartjp.com/wp-content/uploads/2020/09/ca-ba-sa-cat-khuc-vietmart-sieu-thi-thuc-pham-viet-tai-nhat.jpg",
      "Cá Ba Sa",
      "Fast 5",
      true,
      50000,
      "M8",
      "meat"),
  ProductModel(
      "https://dacsanbakien.com/wp-content/uploads/2021/07/muc-ong-tuoi-1.jpg",
      "Mực Ống",
      "Fast 4",
      true,
      100000,
      "M9",
      "meat"),
  ProductModel(
      "https://product.hstatic.net/200000301004/product/ngao-trang-2_dd85bf8857654a28b90bd78153e753bb_master.jpg",
      "Ngao Trắng",
      "Fast 5",
      true,
      50000,
      "M10",
      "meat"),
  ProductModel("https://cf.shopee.vn/file/b25d601b30f5188404cd13921a3ee487",
      "Nồi Chiên Không Dầu", "Fast 6", true, 800000, "A1", "appliances"),
  ProductModel(
      "https://www.lg.com/vn/images/may-giat-va-may-say/md07541676/gallery/FV1411S3B_D01.jpg",
      "Máy Giặt",
      "Fast 7",
      false,
      2000000,
      "A2",
      "appliances"),
  ProductModel(
      "https://cdn01.dienmaycholon.vn/filewebdmclnew/DMCL21/Picture//Apro/Apro_product_24567/tu-lanh-inverte_main_425_1020.png.webp",
      "Tủ lạnh",
      "Fast 7",
      true,
      800000,
      "A3",
      "appliances"),
  ProductModel("https://hstatic.net/377/1000068377/1/2016/5-19/dao_nau_an_nhat_ban_gyutou_hfc_210mm_master.jpg",
      "Dao Thái Harima", "Fast 6", true, 80000, "A4", "appliances"),
  ProductModel(
      "https://product.hstatic.net/1000230347/product/-_01_66eb918864644b848c8161c6785ad812_6069dc2c29d74a7bbf529a3ea16abf1e_684a4d26097b4675bcc8dc3fda2c9253.jpg",
      "Keo Dán Đa Năng",
      "Fast 7",
      false,
      20000,
      "A5",
      "appliances"),
  ProductModel(
      "https://elmich.vn/FileUpload/Images/1849_1.jpg",
      "Máy Xay Sinh Tố",
      "Fast 7",
      true,
      800000,
      "A6",
      "appliances"),
  ProductModel("data:image/jpeg;base64,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",
      "Bộ Ba Nồi Inox", "Fast 6", true, 200000, "A7", "appliances"),
  ProductModel(
      "https://sunhouseviet.com/wp-content/uploads/2019/12/chao-chong-dinh-happy-time-size-28.jpg",
      "Chảo Chống Dính",
      "Fast 7",
      false,
      100000,
      "A8",
      "appliances"),
  ProductModel(
      "https://cf.shopee.vn/file/32d144e84544b5d4cd5e094c6df09b86",
      "Bộ Mười Chén",
      "Fast 7",
      true,
      100000,
      "A9",
      "appliances"),
];