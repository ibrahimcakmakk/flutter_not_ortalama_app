import 'package:flutter/material.dart';
import 'package:flutter_not_ortalama/constants/app_contants.dart';
import 'package:flutter_not_ortalama/ortalama_hesapla_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp  extends StatelessWidget {
  const MyApp ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnaSayfa();

  }

}

class AnaSayfa extends StatelessWidget {
  const AnaSayfa({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      title: "Dinamik Ortalama Hesapla",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Sabitler.anaRenk,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
    home: const OrtalamaHesaplaPage(),
    
    );
  }
}