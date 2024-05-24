import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:furniture/model/product.dart';
import 'package:furniture/utils/SSDataGenerator.dart';
import 'package:furniture/model/cart_item.dart';

class SSProductFragment extends StatefulWidget {
  final List<CartItem> cartItems;
  final VoidCallback onCartUpdated;

  SSProductFragment({required this.cartItems, required this.onCartUpdated});

  @override
  _SSProductFragmentState createState() => _SSProductFragmentState();
}

class _SSProductFragmentState extends State<SSProductFragment> {
  final List<Product> list = getProduct();

  void _addToCart(Product product) {
    setState(() {
      final existingItem = widget.cartItems.firstWhere(
        (item) => item.product == product,
        orElse: () => CartItem(product: product),
      );

      if (widget.cartItems.contains(existingItem)) {
        existingItem.quantity++;
      } else {
        widget.cartItems.add(existingItem);
      }
      widget.onCartUpdated(); // Panggil callback untuk memperbarui UI di Dashboard
    });
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
        itemCount: list.length,
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
                    Image.asset(
                      list[index].img ?? '',
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
                            list[index].name ?? '',
                            style: boldTextStyle(size: 18),
                          ),
                          SizedBox(height: 8),
                          Text('Price: ${list[index].price}'),
                          Text('Description: ${list[index].desc}'),
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
                        _addToCart(list[index]);
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
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
