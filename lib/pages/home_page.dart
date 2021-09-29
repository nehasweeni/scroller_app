import 'package:flutter/material.dart';
import 'package:scroller/widgets/select_chip.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _siteSelected = '';

  List _homeList = [
    {'id': 0, 'title': "Sélectionnez un site", 'selectedValue': ''},
    {'id': 1, 'title': "Choisissez un pays", 'selectedValue': ''},
    {'id': 2, 'title': "Sélectionnez un service", 'selectedValue': ''},
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color.fromRGBO(161, 66, 83, 1.0),
            Color.fromRGBO(67, 83, 196, 1.0),
          ],
        ),
      ),
      child: Scaffold(
/*
        resizeToAvoidBottomInset: false,
*/
        backgroundColor: Colors.transparent,
        body: SafeArea(
          top: true,
          bottom: true,
          right: true,
          left: true,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 100.0),
                    child: Container(
                      width: 300,
                      height: 130,
                      color: Colors.transparent,
                      child: Text(
                        "Bienvenue Lucie !",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontFamily: 'Gilroy',
                            fontWeight: FontWeight.w500,
                            fontSize: 40,
                            letterSpacing: 2,
                            color: Colors.white),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Container(
                    width: 300,
                    height: 90,
                    color: Colors.transparent,
                    child: Text(
                      "Pour commencer, sur quel site êtes-vous ? ",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontFamily: 'Gilroy',
                          fontWeight: FontWeight.w300,
                          fontSize: 24,
                          letterSpacing: 3,
                          color: Colors.white),
                    ),
                  ),
                ),
                Container(
                  width: 300.0,
                  height: 300.0,
                  child: Scrollbar(
                    child: ListView(
                      scrollDirection: Axis.vertical,
                      children: _buildhomeList(),
                    ),
                  ),
                ),

                /*SiteList(
                    bgColor: Colors.white,
                    titleFontColor: Colors.black,
                    listFontColor: Colors.grey,
                    searchTitle: 'Rechercher un site',
                    listID: 1,
                ),*/
              ],
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> _buildhomeList() {
    List<Widget> _theHomeList = [];

    for (int i = 0; i < _homeList.length; i++) {
      SelectChip selectChip = SelectChip(
        bgColor: Colors.white,
        fontColor: Colors.black,
        label: _homeList[i]['selectedValue'],
        clickID: _homeList[i]['id'],
        emitSiteSelected: (String value) {
          setState(() {
            _homeList[i]['selectedValue'] = value;
          });
        },
        placeholder: _homeList[i]['title'],
      );

      _theHomeList.add(selectChip);
    }
    return _theHomeList;
  }
}
