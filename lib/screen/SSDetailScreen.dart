import 'package:flutter/material.dart';
import 'package:furniture/fragment/SSCartFragment.dart';
import 'package:furniture/fragment/SSProductFragment.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:furniture/utils/SSWidgets.dart';
import 'package:furniture/model/SneakerShoppingModel.dart';
import 'package:furniture/utils/SSDataGenerator.dart';
import '../../../main.dart';

class SSDetailScreen extends StatefulWidget {
  final String? img;
  final String? title;
  final String? subtitle;
  final String? amount;
  final String? name;
  final String? desc;

  final List<SneakerShoppingModel> list = getAllData();

  SSDetailScreen({this.img, this.title, this.subtitle, this.amount, this.name,this.desc});

  @override
  SSDetailScreenState createState() => SSDetailScreenState();
}

class SSDetailScreenState extends State<SSDetailScreen> {
  int index = 0;
  List<String> img = [], name = [],amount=[],desc=[];

  @override
  void initState() {
    super.initState();
    init();
  }

  void init() async {
    img.insert(0, widget.img.validate());
    name.insert(0, widget.name.validate());
    desc.insert(0, widget.desc.validate());
    if (widget.amount != null) {
    amount.insert(0, widget.amount.validate());
    
    
  }

    // SneakerShoppingModel? selectedItem = widget.list.firstWhere((element) => element.img == widget.img);
    // SneakerShoppingModel? selectedItem = widget.list.firstWhere((element) => element.img == widget.img, orElse: () => null);
    // SneakerShoppingModel? selectedItem = widget.list.firstWhereOrNull((element) => element.img == widget.img);
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: Image(
          image:
              AssetImage('assets/images/bahan/logo.png'),
          height: 50,
          width: 50,
          color: appStore.isDarkModeOn ? Colors.white : Colors.black,
          fit: BoxFit.cover,
        ),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.zero,
            side: BorderSide(color: Color(0x00000000), width: 1)),
        leading: InkWell(
          onTap: () {
            finish(context);
          },
          child: Icon(Icons.arrow_back_ios, color: context.iconColor, size: 20),
        ),
        
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(color: Colors.grey.withOpacity(0.3)),
              child: Column(
                children: [
                  Image(
                    image: AssetImage(img[index]),
                    height: 250,
                    width: MediaQuery.of(context).size.width,
                    fit: BoxFit.cover,
                  ),
                  SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: img.map((e) {
                      return InkWell(
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        radius: 8,
                        onTap: () {
                          setState(() {
                            index = img.indexOf(e);
                          });

                        },
                        child: Container(
                          margin: EdgeInsets.only(right: 8),
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: context.cardColor,
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                              color: index == img.indexOf(e)
                                  ? Colors.red
                                  : Colors.transparent,
                            ),
                          ),
                          child: Image(
                              image: AssetImage(e.validate()),
                              height: 40,
                              width: 40,
                              fit: BoxFit.cover),
                        ),
                      ).paddingRight(8);
                    }).toList(),
                  ),
                  SizedBox(height: 16),
                ],
              ),
            ),
            Padding(
              padding:
                  EdgeInsets.only(left: 16, right: 16, bottom: 16, top: 16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(amount[index],
                  style: GoogleFonts.poppins(color: Colors.black,
                  fontSize: 16,fontWeight: FontWeight.w500),),
                  SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [],
                  ),
                  SizedBox(height: 16),
                  Text(name[index],
                      textAlign: TextAlign.start,
                      overflow: TextOverflow.clip,
                      style: boldTextStyle(size: 20)),
                  SizedBox(height: 8),
                  
                  SizedBox(height: 16, width: 16),
                  Text("Description",
                      textAlign: TextAlign.start,
                      overflow: TextOverflow.clip,
                      style: boldTextStyle()),
                  SizedBox(height: 8),
                  Text(
                     desc[index],
                      textAlign: TextAlign.start,
                      overflow: TextOverflow.clip,
                      style: secondaryTextStyle()),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(16),
        child: Row(
          children: [
            Container(
  decoration: BoxDecoration(
 
    borderRadius: BorderRadius.circular(4),
  ),
  
  child: ElevatedButton(
    onPressed: () {
      SSCartFragment(cartItems: [],).launch(context);
    },
    child: Icon(Icons.shopping_cart_outlined),
  ),
),

            SizedBox(width: 8),
            Expanded(
              child: sSAppButton(
              context: context,
              onPressed: () {
                SSProductFragment(cartItems: [], onCartUpdated: () {  },).launch(context);
              },
              title: 'Beli Sekarang',
            ),
            ),
          ],
        ),
      ),
    );
  }
}
