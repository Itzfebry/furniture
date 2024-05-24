import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:furniture/model/SneakerShoppingModel.dart';

import 'package:furniture/utils/SSDataGenerator.dart';

import '../../../main.dart';

class SSProductScreen extends StatefulWidget {
  final String? img;
  final String?amount;
  final String?desc;

  SSProductScreen({this.img,this.amount,this.desc});

  @override
  State<SSProductScreen> createState() => _SSProductScreenState();
}

class _SSProductScreenState extends State<SSProductScreen> {
  List<SneakerShoppingModel> data = getProductData();
  List<SneakerShoppingModel> list = getAllData();

    int currentIndex = 0;
 
  
  @override
void initState() {
  super.initState();
  
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: Image(
          image: AssetImage('assets/images/bahan/logo.png'),
          height: 50,
          width: 50,
          color: appStore.isDarkModeOn ? Colors.white : Colors.black,
          fit: BoxFit.cover,
        ),
        automaticallyImplyLeading: false,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.zero,
          side: BorderSide(color: Color(0x00000000), width: 1),
        ),
        leading: InkWell(
          onTap: () {
            finish(context);
          },
          child: Icon(Icons.arrow_back_ios, color: context.iconColor, size: 20),

        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(bottom: 26),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            Stack(
              children: [
                Image(
                  image: AssetImage(widget.img!),
                  height: 250,
                  width: MediaQuery.of(context).size.width,
                  fit: BoxFit.cover,
                ),
                Container(height: 250, decoration: BoxDecoration(color: Colors.black12.withOpacity(0.3)))
              ],
            ),
            SizedBox(height: 16, width: 16),
            Padding(
              padding: EdgeInsets.only(left: 16, right: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text("", textAlign: TextAlign.start, overflow: TextOverflow.clip, style: boldTextStyle()),
                 
                ],
              ),
            ),
            SizedBox(height: 16, width: 16),
            Container(
              height: 35,
              child: ListView.builder(
                padding: EdgeInsets.only(left: 8, right: 8),
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: data.length,
                itemBuilder: (_, index) {
                  return InkWell(
                    highlightColor: Colors.transparent,
                    splashColor: Colors.transparent,
                    onTap: () {
                      currentIndex = index;
                      setState(() {});
                    },
                    child: Container(
                      alignment: Alignment.center,
                      margin: EdgeInsets.only(left: 8, right: 8),
                      padding: EdgeInsets.symmetric(vertical: 6, horizontal: 8),
                      decoration: BoxDecoration(
                        color: currentIndex == index ? Color(0xff000000) : context.cardColor,
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(16.0),
                        border: Border.all(color: Color(0x4d9e9e9e), width: 1),
                      ),
                      child: Text(
                        data[index].name!,
                        textAlign: TextAlign.start,
                        overflow: TextOverflow.clip,
                        style: boldTextStyle(size: 12, color: currentIndex == index ? Colors.white : Colors.grey),
                      ),
                    ),
                  );
                },
              ),
            ),
SizedBox(height: 16),
Padding(
  padding: EdgeInsets.symmetric(horizontal: 16),
  child: Container(
    decoration: BoxDecoration(
      color: context.cardColor,
      borderRadius: BorderRadius.circular(8),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.all(16),
          child: Text(
            data[currentIndex].name!,
            style: boldTextStyle(size: 18),
          ),
        ),
        Divider(height: 1),
        Padding(
          padding: EdgeInsets.all(16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Amount:',
                style: secondaryTextStyle(),
              ),
              Text(
                'Rp'+data[currentIndex].amount!,
                style: boldTextStyle(),
              ),
            ],
          ),
        ),
        Divider(height: 1),
        Padding(
          padding: EdgeInsets.all(16),
          child: Text(
            'Description:',
            style: boldTextStyle(size: 16),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Text(
          data[currentIndex].desc!
            ,
            style: secondaryTextStyle(),
          ),
        ),
        SizedBox(height: 16),
          ],
        ),
      ),
    ),
          ]
        )
      
      ),
    );
    
  }
}
