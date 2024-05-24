import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:furniture/main.dart';
import 'package:furniture/screen/SSDashBoardScreen.dart';
import 'package:furniture/screen/SSForgotPasswordScreen.dart';
import 'package:furniture/screen/SSRegisterScreen.dart';
import 'package:furniture/utils/SSWidgets.dart';

class SSSignInScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: false,
        automaticallyImplyLeading: false,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.zero,
        ),
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back_ios, color: context.iconColor, size: 20),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(vertical: 0, horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            SizedBox(height: 32, width: 16),
            Text("Sign In",
                textAlign: TextAlign.start,
                overflow: TextOverflow.clip,
                style: boldTextStyle()),
            SizedBox(height: 8),
            Text("Silahkan melakukan Sign In",
                textAlign: TextAlign.start,
                overflow: TextOverflow.clip,
                style: primaryTextStyle()),
            SizedBox(height: 32),
            TextField(
              controller: TextEditingController(),
              obscureText: false,
              textAlign: TextAlign.start,
              maxLines: 1,
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.normal,
                  fontSize: 14),
              decoration: sSInputDecoration(
                context: context,
                icon: Icon(Icons.email,
                    color: Colors.grey.withOpacity(0.4), size: 24),
                name: 'Email',
              ),
            ),
            SizedBox(height: 16, width: 16),
            TextField(
              controller: TextEditingController(),
              obscureText: false,
              textAlign: TextAlign.start,
              maxLines: 1,
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.normal,
                  fontSize: 14),
              decoration: sSInputDecoration(
                context: context,
                icon: Icon(Icons.lock,
                    color: Colors.grey.withOpacity(0.4), size: 24),
                name: 'Password',
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                child: Text('Lupa Password?',
                    style: boldTextStyle(size: 16, color: Colors.red)),
                onPressed: () {
                  SSForgotPasswordScreen().launch(context);
                },
              ),
            ),
            SizedBox(height: 8),
            Align(
              alignment: Alignment.centerRight,
              child: InkWell(
                highlightColor: Colors.transparent,
                splashColor: Colors.transparent,
                onTap: () {
                  finish(context);
                  SSDashBoardScreen().launch(context);
                },
                child: Container(
                  margin: EdgeInsets.zero,
                  padding: EdgeInsets.zero,
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color: appStore.isDarkModeOn
                        ? context.cardColor
                        : Color(0xff010101),
                    shape: BoxShape.circle,
                    border: Border.all(color: Color(0x4d9e9e9e), width: 1),
                  ),
                  child: Icon(Icons.arrow_forward,
                      color: Color(0xfffcfdff), size: 24),
                ),
              ),
            ),
            SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Belum Mendaftar?",
                  textAlign: TextAlign.start,
                  overflow: TextOverflow.clip,
                  style: primaryTextStyle(),
                ),
                TextButton(
                  onPressed: () {
                    SSRegisterScreen().launch(context);
                  },
                  child: Text(
                    "Register",
                    style: boldTextStyle(color: Colors.red),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
