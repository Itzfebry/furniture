import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:furniture/component/SSBestODWidget.dart';
import 'package:furniture/model/SneakerShoppingModel.dart';
import 'package:furniture/screen/SSDetailScreen.dart';
import 'package:furniture/screen/SSViewAllScreen.dart';
import 'package:furniture/utils/SSDataGenerator.dart';
import 'package:furniture/utils/SSWidgets.dart';

import '../../../main.dart';

class SSHomeFragment extends StatefulWidget {
  @override
  State<SSHomeFragment> createState() => _SSHomeFragmentState();
}

class _SSHomeFragmentState extends State<SSHomeFragment> {
  final List<SneakerShoppingModel> list = getAllData();
  final List<SneakerShoppingModel> data = getSearchData();

  @override
  // void initState() {
  //   super.initState();
  //   init();
  // }

  // Future<void> init() async {
  //   afterBuildCreated(() {
  //     dialog();
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Padding(
          padding: EdgeInsets.only(left: 0, right: 0, top: 20),
          child: Row(
            children: [
              Image(
                image: AssetImage('assets/images/bahan/logo.png'),
                // image: AssetImage('assets/images/sneakerShopping/logo.png'),
                height: 60,
                width: 60,
                color: appStore.isDarkModeOn ? Colors.white : Colors.black,
                fit: BoxFit.cover,
              ),
              SizedBox(width: 8), // Memberikan jarak antara logo dan teks
              Text('CheapyId',
                  style: GoogleFonts.poppins(
                      color:
                          appStore.isDarkModeOn ? Colors.white : Colors.black,
                      fontSize: 28,
                      fontWeight: FontWeight.w600
                      // Sesuaikan ukuran teks sesuai kebutuhan
                      )),
            ],
          ),
        ),
        elevation: 0,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            Responsive(
              web: Padding(
                padding: EdgeInsets.only(left: 16, right: 16, top: 16),
                child: Image(
                    image: AssetImage('assets/images/bahan/home.jpg'),
                    height: 600,
                    width: MediaQuery.of(context).size.width,
                    fit: BoxFit.cover),
              ),
              mobile: Padding(
                padding: EdgeInsets.only(left: 16, right: 16, top: 16),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 10,
                        offset: Offset(0, 4),
                      ),
                    ],
                  ), // penutup Container decoration
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Stack(
                      children: [
                        Image(
                          image: AssetImage('assets/images/bahan/home.jpg'),
                          height: 250,
                          width: MediaQuery.of(context).size.width,
                          fit: BoxFit.cover,
                        ), // penutup Image
                        Positioned(
                          bottom: 16,
                          left: 100,
                          right: 0,
                          child: Text('"The Source of Furniture"',
                              style: GoogleFonts.poppins(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400
                                  // Sesuaikan ukuran teks sesuai kebutuhan
                                  )), // penutup Text
                        ), // penutup Positioned
                      ], // penutup Stack children
                    ), // penutup Stack
                  ), // penutup ClipRRect
                ), // penutup Container
              ), // penutup Padding (mobile)
            ),
            SizedBox(height: 16),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 0, horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text("Best of Us",
                      textAlign: TextAlign.start,
                      overflow: TextOverflow.clip,
                      style: boldTextStyle()),
                  TextButton(
                    onPressed: () {
                      SSViewAllScreen().launch(context);
                    },
                    child: Text("Tampilkan Semua", style: secondaryTextStyle()),
                  ),
                ],
              ),
            ),
            HorizontalList(
              padding: EdgeInsets.only(left: 16, right: 16),
              itemCount: list.length,
              itemBuilder: (_, index) {
                return InkWell(
                  highlightColor: Colors.transparent,
                  splashColor: Colors.transparent,
                  borderRadius: BorderRadius.circular(10),
                  onTap: () {
                    SSDetailScreen(
                      img: list[index].img,
                      name: list[index].name,
                      amount: list[index].amount,
                      desc: list[index].desc,
                    ).launch(context);
                  },
                  child: SSBestODWidget(
                      title: list[index].name,
                      img: list[index].img,
                      subtitle: list[index].subtitle,
                      amount: list[index].amount),
                );
              },
            ),
            SizedBox(height: 16, width: 16),
            Padding(
              padding: EdgeInsets.only(left: 16, bottom: 8),
              child: Text("New Product",
                  textAlign: TextAlign.start,
                  overflow: TextOverflow.clip,
                  style: boldTextStyle()),
            ),
            Responsive(
              mobile: ListView.builder(
                padding: EdgeInsets.all(8),
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: data.length,
                itemBuilder: (_, index) {
                  return arrivalWidget(context: context, img: data[index].img);
                },
                
              ),
            )
          ],
        ),
      ),
    );
  }

  // Future<void> dialog() async {
  //   return showDialog(
  //     context: context,
  //     builder: (_) {
  //       return AlertDialog(
  //         backgroundColor: Colors.transparent,
  //         content: Container(
  //           height: 300,
  //           width: 300,
  //           child: Column(
  //             children: [
  //               Stack(
  //                 alignment: Alignment.topRight,
  //                 children: [
  //                   Image(image: AssetImage('assets/images/sneakerShopping/ic_arrivals_2.jpg'), height: 200, width: context.width(), fit: BoxFit.cover),
  //                   IconButton(
  //                     onPressed: () {
  //                       // finish(context);
  //                     },
  //                     icon: Icon(Icons.close, color: Colors.black),
  //                   )
  //                 ],
  //               ),
  //               Container(
  //                 height: 80,
  //                 padding: EdgeInsets.all(16),
  //                 width: context.width(),
  //                 color: context.cardColor,
  //                 child: sSAppButton(
  //                   textColor: Colors.white,
  //                   title: 'Shop Now',
  //                   context: context,
  //                   onPressed: () {
  //                     // finish(context);
  //                   },
  //                 ),
  //               )
  //             ],
  //           ),
  //         ),
  //       );
  //     },
  //   );
  // }
}
