import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:furniture/model/SneakerShoppingModel.dart';
import 'package:furniture/utils/SSDataGenerator.dart';

class SSRiwayatFragment extends StatelessWidget {
  final List<SneakerShoppingModel> list = getAllFavorite();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: Text("Riwayat", style: boldTextStyle()),
      ),
      body: Text('helloworld'),
    );
  }
}
