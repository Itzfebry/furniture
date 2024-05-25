import 'package:furniture/model/product.dart';
import 'package:furniture/model/profile.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:furniture/model/SneakerShoppingModel.dart';

List<Profile> getProfile() {
  List<Profile> list = [];
  list.add(Profile(
      name: 'Udin',
      alamat: 'Jl.Diponegoro 12,Sumberwringin,Banyuwangi',
      nohp: '085456655345',
      email: 'Udin@gmail.com'));
  return list;
}

// List<Product> getProduct() {
//   List<Product> list = [];
//   list.add(Product(
//       id: 2,
//       name: 'SofaModern',
//       price: 1650000,
//       stock: 99,
//       desc: 'empuk',
//       img: 'assets/images/bahan/SofaModern.png'));
//   list.add(Product(
//       id: 2,
//       name: 'EliteSpringbed',
//       price: 1650000,
//       stock: 99,
//       desc: 'empuk',
//       img: 'assets/images/bahan/elitespringbed.png'));
//   return list;
// }

List<Profile> getLokasi() {
  List<Profile> list = [];
  list.add(Profile(name: 'Jember'));
  list.add(Profile(name: 'Bondowoso'));
  list.add(Profile(name: 'Situbondo'));
  list.add(Profile(name: 'Banyuwangi'));
  list.add(Profile(name: 'Malang'));
  list.add(Profile(name: 'Surabaya'));
  return list;
}

List<SneakerShoppingModel> getAccount() {
  List<SneakerShoppingModel> list = [];
  list.add(SneakerShoppingModel(name: 'Alamat'));
  list.add(SneakerShoppingModel(name: 'No.Telp'));
  list.add(SneakerShoppingModel(name: 'Email'));

  return list;
}

List<SneakerShoppingModel> paymentList() {
  List<SneakerShoppingModel> list = [];
  list.add(
      SneakerShoppingModel(name: 'BRI', img: 'assets/images/bahan/BRI.png'));
  list.add(SneakerShoppingModel(
      name: 'Mandiri', img: 'assets/images/bahan/Mandiri.png'));

  return list;
}

List<SneakerShoppingModel> getShopping() {
  List<SneakerShoppingModel> list = [];
  list.add(SneakerShoppingModel(name: 'New Arrival'));
  list.add(SneakerShoppingModel(name: 'Men'));
  list.add(SneakerShoppingModel(name: 'Women'));
  list.add(SneakerShoppingModel(name: 'Kids'));
  list.add(SneakerShoppingModel(name: 'Sale'));

  return list;
}

List<SneakerShoppingModel> getProductData() {
  List<SneakerShoppingModel> list = [];
  list.add(SneakerShoppingModel(
      name: 'Size A',
      amount: '2.650.000',
      desc:
          'Produk ini hadir dengan ukuran standar yang dirancang untuk penggunaan umum sehari-hari. Ukurannya ideal untuk memenuhi kebutuhan dasar tanpa memakan banyak ruang.'));
  list.add(SneakerShoppingModel(
      name: 'Size B',
      amount: '3.500.000',
      desc:
          'Produk ini menawarkan ukuran yang lebih besar, memberikan ruang ekstra dan kapasitas yang lebih tinggi.'));

  return list;
}

List<SneakerShoppingModel> getAllData() {
  List<SneakerShoppingModel> list = [];
  list.add(SneakerShoppingModel(
      name: 'Kursi Sahrini',
      subtitle: 'Modern',
      img: 'assets/images/bahan/KursiSahrini.png',
      amount: 'Rp2,900.000',
      desc:
          'Desain minimalis dengan warna putih yang memberi kesan modern dan segar pada penampilannya.'));
  list.add(SneakerShoppingModel(
      name: 'Elite  Spring Bed',
      subtitle: 'Modern',
      img: 'assets/images/bahan/elitespringbed.png',
      amount: 'Rp3,255.000',
      desc:
          'Tempat tidur berkualitas dengan per kawat yang memberikan kenyamanan istimewa untuk tidur yang berkualitas.'));
  list.add(SneakerShoppingModel(
      name: 'Kea Panel Meja Belajar',
      subtitle: 'Classic',
      img: 'assets/images/bahan/Keameja.png',
      amount: 'Rp930.000',
      desc:
          'Kea Panel Meja  fungsional dengan panel samping yang memberikan ruang penyimpanan tambahan.'));
  list.add(SneakerShoppingModel(
      name: 'SofaModern',
      subtitle: 'Modern',
      img: 'assets/images/bahan/SofaModern.png',
      amount: 'Rp1,650.000',
      desc:
          'Sofa bergaya kontemporer dengan garis-garis bersih yang memberikan sentuhan elegan pada ruang tamu Anda.'));
  list.add(SneakerShoppingModel(
      name: 'Meja Kursi Makan TDT-403',
      subtitle: 'Classic',
      img: 'assets/images/bahan/MejaTDT.png',
      amount: 'Rp1,500.000',
      desc:
          'Meja makan kokoh dengan desain sederhana yang sempurna untuk momen makan bersama keluarga.'));

  return list;
}

List<SneakerShoppingModel> getAllFavorite() {
  List<SneakerShoppingModel> list = [];

  list.add(SneakerShoppingModel(
      name: 'Nike Air VaporMax Evo',
      subtitle: 'Nike Air Huarache',
      img: 'assets/images/sneakerShopping/ic_shoes_11.png',
      amount: '\$250.00'));

  return list;
}

List<SneakerShoppingModel> getAllCart() {
  List<SneakerShoppingModel> list = [];

  list.add(SneakerShoppingModel(
      name: 'Sofa Modern',
      subtitle: 'modern',
      img: 'assets/images/bahan/SofaModern.png',
      amount: '1.650.000'));

  return list;
}

List<SneakerShoppingModel> getSearchData() {
  List<SneakerShoppingModel> list = [];
  list.add(SneakerShoppingModel(
      name: 'Top & T-Shirt Collection',
      subtitle: '55% OFF',
      img: 'assets/images/bahan/Sofaputih.png'));
  // list.add(SneakerShoppingModel(name: 'Top & T-Shirt Collection', subtitle: '35% OFF', img: 'assets/images/bahan/907'));
  return list;
}

List<LanguageDataModel> languageList() {
  return [
    LanguageDataModel(
        id: 1,
        name: 'English',
        languageCode: 'en',
        fullLanguageCode: 'en-US',
        flag: 'assets/images/flag/ic_us.png'),
    LanguageDataModel(
        id: 2,
        name: 'Hindi',
        languageCode: 'hi',
        fullLanguageCode: 'hi-IN',
        flag: 'assets/images/flag/ic_hi.png'),
    LanguageDataModel(
        id: 3,
        name: 'Arabic',
        languageCode: 'ar',
        fullLanguageCode: 'ar-AR',
        flag: 'assets/images/flag/ic_ar.png'),
    LanguageDataModel(
        id: 4,
        name: 'French',
        languageCode: 'fr',
        fullLanguageCode: 'fr-FR',
        flag: 'assets/images/flag/ic_fr.png'),
  ];
}
