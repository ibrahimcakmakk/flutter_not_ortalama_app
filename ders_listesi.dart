import 'package:flutter/material.dart';
import 'package:flutter_not_ortalama/constants/app_contants.dart';
import 'package:flutter_not_ortalama/helper/data_helper.dart';
import 'package:flutter_not_ortalama/model/ders.dart';

class DersListesi extends StatefulWidget {
  final Function onElemanCikarildi;
  const DersListesi({required this.onElemanCikarildi, Key? key}) : super(key: key);

  @override
  State<DersListesi> createState() => _DersListesiState();
}

class _DersListesiState extends State<DersListesi> {
  @override
  Widget build(BuildContext context) {
    List<Ders> tumDersler = DataHelper.tumEklenenDersler;
    if (tumDersler.length > 0) {
      return ListView.builder(itemCount: tumDersler.length, itemBuilder: (context , index){
      return Dismissible(
        key: UniqueKey(),
        direction: DismissDirection.startToEnd,
        onDismissed: (a){
          widget.onElemanCikarildi(index);
          
        },
        child: Padding(
          padding: const EdgeInsets.all(2.0),
          child: Card(
            child: ListTile(
             title: Text(tumDersler[index].ad),
             leading: CircleAvatar(
               backgroundColor: Sabitler.anaRenk,
               child: Text(
                 ((tumDersler[index].harfDegeri) * (tumDersler[index].krediDegeri)).toStringAsFixed(0)),
             ),  
             subtitle: Text(
               "${tumDersler[index].krediDegeri} Kredi , Not Degeri ${tumDersler[index].harfDegeri}"),
      
            ),
            ),
        ),
      );
    });
    } else {
      return Container(child: Center(child: 
    Text("Lütfen Ders Ekleyiniz" , style: Sabitler.baslikStyle,)),);
    }

    
  }
}