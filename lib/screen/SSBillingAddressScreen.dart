import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:furniture/model/profile.dart';
import 'package:furniture/utils/SSDataGenerator.dart';
import 'package:furniture/screen/SSPaymentScreen.dart';
import 'package:furniture/utils/SSWidgets.dart';

class SSBillingAddressScreen extends StatefulWidget {
  @override
  State<SSBillingAddressScreen> createState() => _SSBillingAddressScreenState();
}

class _SSBillingAddressScreenState extends State<SSBillingAddressScreen> {
  late Profile profile;

  @override
  void initState() {
    super.initState();
    profile = getProfile().first; // Ambil data profile pertama dari getProfile()
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: Text("Checkout", style: boldTextStyle()),
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back_ios, color: context.iconColor, size: 20),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
           
            SizedBox(height: 16),
            buildProfileRow("Name", profile.name ?? 'N/A'),
            SizedBox(height: 16),
            buildProfileRow("Alamat", profile.alamat ?? 'N/A'),
            SizedBox(height: 16),
            buildProfileRow("No Hp", profile.nohp?.toString() ?? 'N/A'),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(16),
        child: sSAppButton(
          context: context,
          title: 'Continue to payment',
          onPressed: () {
            SSPaymentScreen().launch(context);
          },
        ),
      ),
    );
  }

  Widget buildProfileRow(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          flex: 1,
          child: Text(label, style: boldTextStyle(size: 16)),
        ),
        SizedBox(width: 16), // Memberikan jarak antara label dan nilai
        Expanded(
          flex: 2,
          child: Text(value, style: primaryTextStyle(size: 16)),
        ),
      ],
    );
  }
}
