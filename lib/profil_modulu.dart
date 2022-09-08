//SALİHA GÖÇERGİ 18010011071

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:unicorndial/unicorndial.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class ProfilModulu extends StatefulWidget {
  ProfilModulu({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _ProfilModuluState createState() => _ProfilModuluState();
}

class _ProfilModuluState extends State<ProfilModulu>
    with SingleTickerProviderStateMixin {
  final _kullaniciResimKontrol = TextEditingController();

  ImagePicker imagePicker;
  File resimFile;

  @override
  void dispose() {
    _kullaniciResimKontrol.dispose();
    super.dispose();
  }

  @override
  void initState() {
    imagePicker = ImagePicker();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    const _urlwhatsapp = 'https://wa.me/17204140464';
    void launchWhatsappURL() async => await canLaunch(_urlwhatsapp)
        ? await launch(_urlwhatsapp)
        : print("Bir sorun oluştu");

    const _urlemail = 'mailto:hakyurek@erbakan.edu.tr';
    void launchEmailURL() async => await canLaunch(_urlemail)
        ? await launch(_urlemail)
        : print("Bir sorun oluştu");

    //WHATSAPP VE EMAİL İÇİN BUTON ÖZELLİKLERİ
    var childButtons = List<UnicornButton>();
    childButtons.add(UnicornButton(
      hasLabel: true,
      labelText: "Whatsapp",
      currentButton: FloatingActionButton(
        backgroundColor: Color(0xfff7634c),
        mini: true,
        child: Icon(FontAwesomeIcons.whatsapp),
        onPressed: (launchWhatsappURL),
      ),
    ));
    childButtons.add(UnicornButton(
      hasLabel: true,
      labelText: "Email",
      currentButton: FloatingActionButton(
        backgroundColor: Color(0xfff7634c),
        mini: true,
        child: Icon(FontAwesomeIcons.mailBulk),
        onPressed: (launchEmailURL),
      ),
    ));

    //GALERİDEN RESİM EKLEME
    Future getImage() async {
      final resim = await imagePicker.getImage(
        source: ImageSource.gallery,
      );
      setState(() {
        resimFile = File(resim.path);
      });
    }

    return Scaffold(
      body: govde(context, getImage),
      floatingActionButton: UnicornDialer(
        childButtons: childButtons,
        hasBackground: true,
        hasNotch: true,
        orientation: UnicornOrientation.VERTICAL,
        parentButton: Icon(FontAwesomeIcons.shareAlt),
        parentButtonBackground: Color(0xfff78e4c),
      ),
    );
  }

  Container govde(BuildContext context, Future getImage()) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Column(
        children: [
          SizedBox(
            height: 40.0,
          ),
          appBarAlani(),
          resimEklemeVeIsimSoyisim(getImage),
          etkinliklerListesi(context),
        ],
      ),
    );
  }

  Row appBarAlani() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Container(
          height: 50,
          width: 50,
          child: Icon(
            Icons.arrow_back_ios,
            size: 24,
            color: Colors.black54,
          ),
          decoration: BoxDecoration(
              border: Border.all(color: Colors.black54),
              borderRadius: BorderRadius.all(Radius.circular(10))),
        ),
        Text(
          widget.title,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        Container(height: 24, width: 24)
      ],
    );
  }

  Expanded etkinliklerListesi(BuildContext context) {
    return Expanded(
      child: Stack(children: [
        etkinlikler(context),
        //ETKİNLİK ADEDİ KISMI
        etkinlikAdedi(),
      ]),
    );
  }

  Container etkinlikler(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30), topRight: Radius.circular(30)),
          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [Colors.orange[100], Color.fromRGBO(252, 165, 83, 1)])),
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 30,
          ),
          Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.fromLTRB(15.0, 0.0, 15.0, 0.0),
            child: Text(
              "ETKİNLİKLERİM",
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: ListView(
              scrollDirection: Axis.vertical,
              children: [
                for (int i = 0; i < 15; i++) ...[
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
                    child: Material(
                      borderRadius: BorderRadius.circular(16),
                      elevation: 4,
                      color: Colors.orange[50],
                      child: ListTile(
                        title: Text("Yazılım Semineri"),
                        subtitle: Text("10.06.2021 - amfi4"),
                        trailing: Icon(Icons.check_circle),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
                    child: Material(
                      borderRadius: BorderRadius.circular(16),
                      elevation: 4,
                      color: Colors.orange[50],
                      child: ListTile(
                        title: Text("Sağlıklı Yaşam Semineri"),
                        subtitle: Text("20.06.2021 - amfi1"),
                        trailing: Icon(Icons.cancel_rounded),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
                    child: Material(
                      borderRadius: BorderRadius.circular(16),
                      elevation: 4,
                      color: Colors.orange[50],
                      child: ListTile(
                        title: Text("Mühendisler Günü Etkinliği"),
                        subtitle: Text("25.06.2021 - amfi3"),
                        trailing: Icon(Icons.check_circle),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                ],
              ],
            ),
          )
        ],
      ),
    );
  }

  Positioned etkinlikAdedi() {
    return Positioned(
      top: 5,
      left: 340,
      child: ClipOval(
        child: Container(
          height: 70,
          width: 70,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(38),
            color: Colors.orange[50],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Etkinlik',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20.0,
                ),
              ),
              Text(
                '25',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 15.0,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Column resimEklemeVeIsimSoyisim(Future getImage()) {
    return Column(
      children: [
        //RESİM EKLEME
        Container(
          child: Center(
            child: Stack(
              children: <Widget>[
                ClipOval(
                  child: Container(
                    height: 150,
                    width: 150,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(38),
                    ),
                    child: (resimFile != null)
                        ? Image.file(
                            File(resimFile.path),
                            fit: BoxFit.cover,
                          )
                        : (_kullaniciResimKontrol.text != "")
                            ? Image.network(
                                _kullaniciResimKontrol.text,
                                fit: BoxFit.cover,
                              )
                            : Image.asset(
                                ('assets/profil.png'),
                                fit: BoxFit.cover,
                              ),
                  ),
                ),
                Positioned(
                  top: 90,
                  left: 90,
                  child: IconButton(
                      icon: Icon(
                        Icons.add_circle,
                        color: Colors.grey[350],
                        size: 45.0,
                      ),
                      onPressed: () {
                        getImage();
                      }),
                ),
              ],
            ),
          ),
        ),
        //İSİM SOYAD BÖLÜMÜ
        Center(
          child: Container(
            height: 40,
            child: Align(
              alignment: Alignment.center,
              child: Text(
                'SALİHA',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
