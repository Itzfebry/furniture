import 'package:flutter/material.dart';
import 'package:furniture/fragment/SSHomeFragment.dart';
import 'package:furniture/screen/SSDashBoardScreen.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:furniture/main.dart';
import 'package:furniture/model/SneakerShoppingModel.dart';
import 'package:furniture/screen/SSOrderScreen.dart';
import 'package:furniture/utils/SSDataGenerator.dart';
import 'package:furniture/utils/SSWidgets.dart';

class SSPaymentScreen extends StatefulWidget {
  @override
  State<SSPaymentScreen> createState() => _SSPaymentScreenState();
}

class _SSPaymentScreenState extends State<SSPaymentScreen> {
  int mCount = 0;

  List<SneakerShoppingModel> payment = paymentList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: Text("Pemesanan", style: boldTextStyle()),
        leading: InkWell(
          onTap: () {
            finish(context);
          },
          child: Icon(Icons.arrow_back_ios, color: context.iconColor, size: 20),
        ),
      ),
      body: Container(
        padding: EdgeInsets.only(left: 16, right: 16),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                margin: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(16),
                      child: Text(
                        'Rincian Pemesanan',
                        style: boldTextStyle(),
                        softWrap: true,
                        overflow: TextOverflow.visible,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'ID Transaksi:',
                                style: boldTextStyle(),
                                softWrap: true,
                                overflow: TextOverflow.visible,
                              ),
                              Text(
                                'TRX123456',
                                style: secondaryTextStyle(),
                                softWrap: true,
                                overflow: TextOverflow.visible,
                              ),
                            ],
                          ),
                          SizedBox(height: 16), // Jarak antar teks
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Total Pembayaran:',
                                style: boldTextStyle(),
                                softWrap: true,
                                overflow: TextOverflow.visible,
                              ),
                              Text(
                                'Rp 100.000',
                                style: secondaryTextStyle(),
                                softWrap: true,
                                overflow: TextOverflow.visible,
                              ),
                            ],
                          ),
                          SizedBox(height: 16), // Jarak antar teks
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Waktu Pembayaran:',
                                style: boldTextStyle(),
                                softWrap: true,
                                overflow: TextOverflow.visible,
                              ),
                              Text(
                                '26 May 2024, 10:00 AM',
                                style: secondaryTextStyle(),
                                softWrap: true,
                                overflow: TextOverflow.visible,
                              ),
                            ],
                          ),
                          SizedBox(height: 16), // Jarak antar teks
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Metode Pembayaran:',
                                style: boldTextStyle(),
                                softWrap: true,
                                overflow: TextOverflow.visible,
                              ),
                              Text(
                                'Mandiri',
                                style: secondaryTextStyle(),
                                softWrap: true,
                                overflow: TextOverflow.visible,
                              ),
                            ],
                          ),
                          SizedBox(height: 16), // Jarak antar teks
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Alamat Pengiriman:',
                                style: boldTextStyle(),
                                softWrap: true,
                                overflow: TextOverflow.visible,
                              ),
                              SizedBox(width: 8),
                              Expanded(
                                child: Text(
                                  'Lorem Ipsum is simply dummy text da. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.',
                                  style: secondaryTextStyle(),
                                  softWrap: true,
                                  overflow: TextOverflow.visible,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 24),
                          Text(
                            'Rincian Pesanan',
                            style: boldTextStyle(),
                            softWrap: true,
                            overflow: TextOverflow.visible,
                          ),
                          SizedBox(height: 8),
                          Text(
                            'Pesanan 1',
                            style: secondaryTextStyle(),
                            softWrap: true,
                            overflow: TextOverflow.visible,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomSheet: Container(
        padding: EdgeInsets.only(top: 2, left: 16, right: 16, bottom: 16),
        height: 100,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: context.cardColor,
          boxShadow: defaultBoxShadow(),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            SizedBox(height: 10),
            sSAppButton(
              context: context,
              title: 'Place Order',
              onPressed: () async {
                SSDashBoardScreen().launch(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}