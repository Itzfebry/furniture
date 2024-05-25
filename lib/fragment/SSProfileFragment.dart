import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:furniture/main.dart';
import 'package:furniture/model/profile.dart';
import 'package:furniture/utils/SSColors.dart';
import 'package:http/http.dart' as http;
import 'package:nb_utils/nb_utils.dart';

class SSProfileFragment extends StatefulWidget {
  @override
  _SSProfileFragmentState createState() => _SSProfileFragmentState();
}

class _SSProfileFragmentState extends State<SSProfileFragment> {
  late Profile profile = Profile();

  @override
  void initState() {
    super.initState();
    fetchProfile();
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
      throw Exception('Failed to load profile');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: Text("Profil Saya", style: boldTextStyle()),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Stack(
              alignment: Alignment.bottomRight,
              children: [
                Align(
                  alignment: Alignment.center,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(80),
                    child: Image(
                      image: AssetImage('assets/images/bahan/logo.png'),
                      height: 100,
                      width: 100,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16, width: 16),
            buildProfileRow('', profile.name ?? ''),
            SizedBox(
                height:
                    32), // Tambahkan jarak antara gambar profil dan informasi

            buildProfileRow("Alamat", profile.alamat ?? 'N/A'),
            SizedBox(height: 16),

            // No Hp
            buildProfileRow("No Hp",
                profile.nohp?.toString() ?? 'N/A'), // Konversi int ke String
            SizedBox(height: 16),

            // Email
            buildProfileRow("Email", profile.email ?? 'N/A'),
            SizedBox(height: 16),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('DarkMode', style: boldTextStyle(size: 16)),
                Transform.scale(
                  scale: 1,
                  child: Switch(
                    value: appStore.isDarkModeOn,
                    activeColor: appColorPrimary,
                    onChanged: (s) {
                      setState(() {
                        appStore.toggleDarkMode(value: s);
                      });
                    },
                  ),
                )
              ],
            ).onTap(() {
              setState(() {
                appStore.toggleDarkMode();
              });
            }),
            Divider(
              color: Colors.grey.withOpacity(0.5),
              height: 16,
              thickness: 0,
              indent: 0,
              endIndent: 0,
            ),
          ],
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
