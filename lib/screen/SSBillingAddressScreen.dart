import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:furniture/model/profile.dart';
import 'package:http/http.dart' as http;
import 'package:furniture/screen/SSPaymentScreen.dart';
import 'package:furniture/utils/SSWidgets.dart';
import 'package:intl/intl.dart';

class SSBillingAddressScreen extends StatefulWidget {
  @override
  State<SSBillingAddressScreen> createState() => _SSBillingAddressScreenState();
}

class _SSBillingAddressScreenState extends State<SSBillingAddressScreen> {
  Profile profile = Profile();
  int mCount = -1; // Inisialisasi mCount untuk melacak pilihan pembayaran
  List<PaymentOption> payment = [
    // Contoh data opsi pembayaran
    PaymentOption(name: "Mandiri", img: "assets/images/bahan/Mandiri.png", noRek: '729393946227283984'),
    PaymentOption(name: "BRI", img: "assets/images/bahan/BRI.png", noRek: '1820374395927492'),
  ];

  DateTime selectedDate = DateTime.now();
  String selectedDateString = "";

  @override
  void initState() {
    super.initState();
    fetchProfile();
    selectedDateString = DateFormat('yyyy-MM-dd').format(selectedDate);
  }

  Future<void> fetchProfile() async {
    final response = await http.get(Uri.parse(
        'https://66505daeec9b4a4a6031c7b3.mockapi.io/api/furniture/cheapyid/user/2'));
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      print(jsonData);

      setState(() {
        profile = Profile.fromJson(jsonData);
        print(profile);
      });
    } else {
      throw Exception('Failed to load data');
    }
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime today = DateTime.now();
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: today,
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        selectedDateString = DateFormat('yyyy-MM-dd').format(picked);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: Text("Checkout",
            style:
                GoogleFonts.poppins(fontSize: 20, fontWeight: FontWeight.w400)),
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
            Text(
              'Data Profile',
              style: GoogleFonts.poppins(
                  fontSize: 20, fontWeight: FontWeight.w400),
            ),
            SizedBox(height: 20),
            buildProfileRow('Name', profile.name ?? 'N/A'),
            buildProfileRow('Alamat', profile.alamat ?? 'N/A'),
            buildProfileRow('No HP', profile.nohp ?? 'N/A'),
            SizedBox(height: 32),
            Text("Metode Pembayaran",
                textAlign: TextAlign.start,
                overflow: TextOverflow.clip,
                style: GoogleFonts.poppins(
                    fontSize: 20, fontWeight: FontWeight.w400)),
            SizedBox(height: 16),
            ListView.builder(
              padding: EdgeInsets.only(top: 8, bottom: 8),
              shrinkWrap: true,
              itemCount: payment.length,
              itemBuilder: (context, index) {
                return InkWell(
                  highlightColor: Colors.transparent,
                  splashColor: Colors.transparent,
                  onTap: () {
                    // Perbarui nilai mCount saat pengguna memilih opsi pembayaran
                    setState(() {
                      mCount = index;
                    });
                  },
                  child: Container(
                    margin: EdgeInsets.only(top: 8, bottom: 8),
                    padding: EdgeInsets.only(top: 8, bottom: 8),
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                          color: mCount == index
                              ? context.iconColor
                              : Colors.grey.withOpacity(0.3),
                          width: 1),
                    ),
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 0, horizontal: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Container(
                            margin: EdgeInsets.zero,
                            padding: EdgeInsets.zero,
                            width: 20,
                            height: 20,
                            decoration: BoxDecoration(
                              color: Colors.grey.withOpacity(0.1),
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: mCount == index
                                    ? context.iconColor
                                    : Colors.grey.withOpacity(0.3),
                                width: 1,
                              ),
                            ),
                          ),
                          Text(
                            payment[index].name,
                            textAlign: TextAlign.start,
                            overflow: TextOverflow.clip,
                            style: GoogleFonts.poppins(
                                fontSize: 16,
                                color: mCount == index
                                    ? context.iconColor
                                    : Colors.grey.withOpacity(0.5)),
                          ),
                          SizedBox(width: 30),
                          SizedBox(
                            width: 30,
                            height: 30,
                            child: Image.asset(payment[index].img,
                                height: 30, width: 30, fit: BoxFit.contain),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
            SizedBox(height: 32),
            Text(
              'Tanggal Pemesanan',
              style: GoogleFonts.poppins(
                  fontSize: 20, fontWeight: FontWeight.w400),
            ),
            SizedBox(height: 20),
            Text(
              'Tanggal Pemesanan: ${DateFormat('yyyy-MM-dd').format(DateTime.now())}',
              style: GoogleFonts.poppins(fontSize: 16),
            ),
            SizedBox(height: 20),
            // Text(
            //   'Tanggal Pengiriman: $selectedDateString',
            //   style: GoogleFonts.poppins(fontSize: 16),
            // ),
            // SizedBox(height: 20),
            // ElevatedButton(
            //   onPressed: () => _selectDate(context),
            //   child: Text('Pilih Tanggal', style: GoogleFonts.poppins()),
            // ),
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
          child: Text(label,
              style: GoogleFonts.poppins(
                  fontSize: 16, fontWeight: FontWeight.w400)),
        ),
        SizedBox(width: 16), // Memberikan jarak antara label dan nilai
        Expanded(
          flex: 2,
          child: Text(value, style: GoogleFonts.poppins(fontSize: 16)),
        ),
      ],
    );
  }
}

class PaymentOption {
  final String name;
  final String img;
  final String noRek;

  PaymentOption({required this.name, required this.img,required this.noRek});
}
