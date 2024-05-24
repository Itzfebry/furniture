import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:furniture/main.dart';
import 'package:furniture/screen/SSRegisterScreen.dart';
import 'package:furniture/screen/SSSignInScreen.dart';
import 'package:furniture/utils/SSWidgets.dart';


class SSBuildScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Align(
        alignment: Alignment(0.1, 0.4),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 0, horizontal: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Image(
                image: AssetImage("assets/images/bahan/logo.png"),
                height: 200,
                width: 200,
                color: appStore.isDarkModeOn ? Colors.white : Colors.black,
                fit: BoxFit.cover,
              ),
              SizedBox(height: 16, width: 16),
              Text(
                "Selamat Datang di CheapyId!",
                textAlign: TextAlign.center,
                overflow: TextOverflow.clip,
                style: GoogleFonts.poppins(color: Colors.black,
                fontWeight: FontWeight.w600,fontSize: 16),

              ),
              
              Text(
                "Kami menyediakan Furnitur dengan Kualitas terbaik.",
                textAlign: TextAlign.center,
                overflow: TextOverflow.clip,
                style: GoogleFonts.poppins(color: Colors.black,
                fontWeight: FontWeight.w500,
                fontSize: 12),

              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.32, width: 16),
              sSAppButton(
                color: appStore.isDarkModeOn ? Colors.black : Colors.white,
                context: context,
                textColor: appStore.isDarkModeOn ? Colors.white : Colors.black,
                title: 'Sign in',
                onPressed: () {
                  finish(context);
                  SSSignInScreen().launch(context);
                },
              ),
              SizedBox(height: 16, width: 16),
              sSAppButton(
                context: context,
                title: 'Register',
                onPressed: () {
                  finish(context);
                  SSRegisterScreen().launch(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
