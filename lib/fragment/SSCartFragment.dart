import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:furniture/screen/SSBillingAddressScreen.dart';
import 'package:furniture/utils/SSWidgets.dart';
import 'package:furniture/model/cart_item.dart';

class SSCartFragment extends StatefulWidget {
  final List<CartItem> cartItems;

  SSCartFragment({required this.cartItems});

  @override
  _SSCartFragmentState createState() => _SSCartFragmentState();
}

class _SSCartFragmentState extends State<SSCartFragment> {
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
        title: Text("Cart", style: boldTextStyle()),
      ),
      body: widget.cartItems.isNotEmpty
          ? ListView.builder(
              itemCount: widget.cartItems.length,
              itemBuilder: (context, index) {
                final cartItem = widget.cartItems[index];
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
                  child: Row(
                    children: [
                      Image.asset(
                        cartItem.product.img ?? '',
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
                              cartItem.product.name ?? '',
                              style: boldTextStyle(size: 18),
                            ),
                            SizedBox(height: 8),
                            Text('Price: ${cartItem.product.price}'),
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          IconButton(
                            icon: Icon(Icons.remove),
                            onPressed: () {
                              setState(() {
                                if (cartItem.quantity > 1) {
                                  cartItem.quantity--;
                                } else {
                                  widget.cartItems.removeAt(index);
                                }
                              });
                            },
                          ),
                          Text('${cartItem.quantity}'),
                          IconButton(
                            icon: Icon(Icons.add),
                            onPressed: () {
                              setState(() {
                                cartItem.quantity++;
                              });
                            },
                          ),
                          IconButton(
                            icon: Icon(Icons.delete),
                            onPressed: () {
                              setState(() {
                                widget.cartItems.removeAt(index);
                              });
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            )
          : Center(
              child: Text('Keranjang belanja kosong'),
            ),
      bottomSheet: Container(
        padding: EdgeInsets.only(top: 8, left: 16, right: 16, bottom: 16),
        height: 180,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          boxShadow: defaultBoxShadow(),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
          ),
        ),
        child: Column(
          children: [
            SizedBox(height: 16),
            Divider(color: Colors.grey, height: 1),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('${widget.cartItems.length} items', style: secondaryTextStyle()),
                Text(
                  'Rp${widget.cartItems.fold<double>(0, (total, item) => total + (item.product.price ?? 0) * item.quantity)}',
                  style: boldTextStyle(),
                ),
              ],
            ),
            SizedBox(height: 16),
            sSAppButton(
              context: context,
              onPressed: () {
                SSBillingAddressScreen().launch(context);
              },
              title: 'Checkout',
            ),
          ],
        ),
      ),
    );
  }
}
