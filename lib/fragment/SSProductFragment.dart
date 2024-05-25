import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:furniture/model/product.dart';
import 'package:furniture/model/cart_item.dart';

class SSProductFragment extends StatefulWidget {
  final List<CartItem> cartItems;
  final Function() onCartUpdated;

  SSProductFragment({required this.cartItems, required this.onCartUpdated});

  @override
  _SSProductFragmentState createState() => _SSProductFragmentState();
}

class _SSProductFragmentState extends State<SSProductFragment> {
  late List<Product> productList = [];

  @override
  void initState() {
    super.initState();
    fetchProducts();
  }

  Future<void> fetchProducts() async {
    try {
      final response = await http.get(Uri.parse(
          'https://66505daeec9b4a4a6031c7b3.mockapi.io/api/furniture/cheapyid/product'));

      if (response.statusCode == 200) {
        final List<dynamic> jsonData = jsonDecode(response.body);

        setState(() {
          productList = jsonData.map((item) => Product.fromJson(item)).toList();
          print('Jumlah produk: ${productList.length}');
        });
      } else {
        throw Exception('Failed to load products');
      }
    } catch (e) {
      print('Error fetching products: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        automaticallyImplyLeading: false,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.zero,
          side: BorderSide(color: Color(0x00000000), width: 1),
        ),
        title: Text("Product", style: boldTextStyle()),
      ),
      body: ListView.builder(
        itemCount: productList.length,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.all(8),
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.network(
                      productList[index].image ?? '',
                      width: 100,
                      height: 100,
                      fit: BoxFit.cover,
                    ),
                    SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            productList[index].name ?? '',
                            style: boldTextStyle(size: 18),
                          ),
                          SizedBox(height: 8),
                          Text('Price: ${productList[index].price}'),
                          Text('Description: Begeddel'),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16),
                Row(
                  children: [
                    Spacer(),
                    InkWell(
                      onTap: () {
                        // Menambahkan produk ke keranjang belanja
                        widget.cartItems
                            .add(CartItem(product: productList[index]));
                        // Memanggil fungsi untuk memperbarui UI
                        widget.onCartUpdated();
                      },
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.add,
                              color: Colors.white,
                            ),
                            SizedBox(width: 4),
                            Text(
                              'Tambahkan',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
