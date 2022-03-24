import 'package:flutter/material.dart';
import 'package:flutter_not_ortalama/constants/app_contants.dart';
import 'package:flutter_not_ortalama/ders_listesi.dart';
import 'package:flutter_not_ortalama/helper/data_helper.dart';
import 'package:flutter_not_ortalama/model/ders.dart';
import 'package:flutter_not_ortalama/ortalama_goster_page.dart';


class OrtalamaHesaplaPage  extends StatefulWidget {
  const OrtalamaHesaplaPage ({Key? key}) : super(key: key);

  @override
  _OrtalamaHesaplaPageState createState() => _OrtalamaHesaplaPageState();
}

class _OrtalamaHesaplaPageState extends State<OrtalamaHesaplaPage > {

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  double secilenHarfdegeri = 1;
  double secilenKredidegeri = 1;
  String girilenDersAdi = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Center(child: Text(Sabitler.baslikText , style: Sabitler.baslikStyle ,),
        ),
      ),
    body: Column(
      children: [
        Row(children: [
          Expanded(
            flex: 2,
            child: _buildForm(),),
              Expanded(
            flex: 1,
            child: OrtalamaGoster(dersSayisi: DataHelper.tumEklenenDersler.length, ortalama: DataHelper.ortalamaHesapla()),

            ),
        ],),
        Expanded(
          child: DersListesi(
            onElemanCikarildi: (index){
              DataHelper.tumEklenenDersler.removeAt(index);
              setState(() {
                
              });
            },
          ),
        )
      ],
    )
    );
  }

  Widget _buildForm() 
  {
    return Form(
      key: formKey,
      child: Column(
        children: [
          Padding(
            padding:Sabitler.yatayPadding8,
            child : _buildTextFormField(),),
            SizedBox(height: 5,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Padding(padding: Sabitler.yatayPadding8,
                child: _buildHarfler(),),
              ),
              Expanded(
                child: Padding(padding: Sabitler.yatayPadding8,
                child: _buildKrediler(),),
              ),
              
              IconButton(onPressed: dersEkleveOrtalamaHesapla,
              icon: Icon(Icons.arrow_forward_rounded),
              color: Sabitler.anaRenk,
              iconSize: 30,
              ),
            ],
          ),
          
        ],
      ),
      );
  }

  _buildTextFormField() {
    return TextFormField(
      onSaved: (deger){
        setState(() {
          girilenDersAdi = deger!;
        });
      },
      validator: (s){
        if(s!.length <= 0){
          return "Ders adını giriniz";
        }else{
          return null;
        }
        
      },
      decoration : InputDecoration(
        hintText: "matematik",
        border: OutlineInputBorder(
          borderRadius: Sabitler.borderRadius,
          borderSide: BorderSide.none ),
        filled: true,
        fillColor: Sabitler.anaRenk.shade100.withOpacity(0.3),
      ),
    );
  }

  _buildHarfler() {
    
    return Container(
      alignment: Alignment.center,
      padding: Sabitler.dropdownPadding,
      decoration: BoxDecoration(
        color: Sabitler.anaRenk.shade100.withOpacity(0.3),
        borderRadius: Sabitler.borderRadius,
      ),
      child: DropdownButton<double>(
        value: secilenHarfdegeri,
        elevation: 16,
        iconEnabledColor: Sabitler.anaRenk.shade200,
        onChanged: (deger){
          setState(() {
            secilenHarfdegeri = deger!;
          });
        },
        underline: Container(),
        items: DataHelper.tumDerslerinHArfleri(),
      ),
    );

  }

  _buildKrediler() {
    
    return Container(
      alignment: Alignment.center,
      padding: Sabitler.dropdownPadding,
      decoration: BoxDecoration(
        color: Sabitler.anaRenk.shade100.withOpacity(0.3),
        borderRadius: Sabitler.borderRadius,
      ),
      child: DropdownButton<double>(
        value: secilenKredidegeri,
        elevation: 16,
        iconEnabledColor: Sabitler.anaRenk.shade200,
        onChanged: (deger){
          setState(() {
            secilenKredidegeri = deger!;
          });
        },
        underline: Container(),
        items: DataHelper.tumDerslerinKredileri(),
      ),
    );

  }

  dersEkleveOrtalamaHesapla() {
    if(formKey.currentState!.validate()){
      formKey.currentState!.save();
      var eklenecekDers = Ders(ad: girilenDersAdi, harfDegeri: secilenHarfdegeri, krediDegeri: secilenKredidegeri);
      DataHelper.dersEkle(eklenecekDers);
      print(DataHelper.ortalamaHesapla());
      setState(() {
        
      });
    }
  }
}