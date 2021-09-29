import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:scroller/widgets/build_list.dart';

class SiteList extends StatefulWidget {
  final Color bgColor;
  final Color titleFontColor;
  final Color listFontColor;
  final int listID;
  final String searchTitle;
  final Function emitSiteSelected;
  final VoidCallback closeDropdown;

  const SiteList({
    Key? key,
    required this.bgColor,
    required this.titleFontColor,
    required this.listFontColor,
    required this.listID,
    required this.searchTitle,
    required this.emitSiteSelected,
    required this.closeDropdown,
  }) : super(key: key);

  @override
  _SiteListState createState() => _SiteListState();
}

class _SiteListState extends State<SiteList> {
  final ScrollController _controllerOne = ScrollController();
  final TextEditingController _textEditingController = TextEditingController();

  List _updatedList = [];

  List _list = [
    {'id': 0, 'site': 'Lyon - Tour mixte Part Dieu'},
    {'id': 1, 'site': 'Nantes - Capitole Brotteau'},
    {'id': 2, 'site': 'Paris - Tour mixte Part Dieu'},
    {'id': 3, 'site': 'Orléans  - Capitole Brotteau'},
    {'id': 4, 'site': 'Bourges  - Tour mixte Part Dieu'},
    {'id': 5, 'site': 'Rouen - Capitole Brotteau'},
    {'id': 6, 'site': 'Toulouse - Tour mixte Part Dieu'},
    {'id': 7, 'site': 'Grenoble - Capitole Brotteau'},
    {'id': 8, 'site': 'Troyes - Tour mixte Part Dieu'},
    {'id': 9, 'site': 'Tours - Capitole Brotteau'},
    {'id': 10, 'site': 'Moulins - Tour mixte Part Dieu'},
    {'id': 11, 'site': 'Paris - Capitole Brotteau'},
    {'id': 12, 'site': 'Tours - Tour mixte Part Dieu'},
    {'id': 13, 'site': 'Paris - Capitole Brotteau'},
  ];

  @override
  void initState() {
    super.initState();
    _updatedList = _list;
    _textEditingController.addListener(() {
      if (_textEditingController.text.length > 0) {
        _updatedList = _list
            .where((element) => element['site']
                .toString()
                .toLowerCase()
                .startsWith(
                    _textEditingController.text.toString().toLowerCase()))
            .toList();
        print(_updatedList);
      } else {
        _updatedList = _list;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: widget.bgColor,
        borderRadius: BorderRadius.circular(30.0),
        boxShadow: [
          BoxShadow(
            color: Color.fromRGBO(62, 62, 62, 0.4588235294117647),
            offset: Offset(0.0, 11.0),
            blurRadius: 30.0,
            spreadRadius: 0.0,
          )
        ],
      ),
      width: 284,
      height: 270,
      child: Column(
        children: [
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 4.0),
                  child: Container(
                    child: TextField(
                      onChanged: (value) {
                        for (int i = 0; i < _list.length; i++) {
                          if (value
                              .toLowerCase()
                              .startsWith(_list[i]['site'])) {
                            print(_list[i]);
                          } else {
                            _updatedList = _list;
                          }
                        }
                      },
                      controller: _textEditingController,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          labelText: widget.searchTitle,
                          labelStyle: TextStyle(color: Colors.black)),
                    ),
                    width: 140,
                  ),
                ),
                Align(
                  child: GestureDetector(
                    onTap: () {
                      widget.closeDropdown();
                    },
                    child: Container(
                      height: 40,
                      width: 40,
                      alignment: Alignment(1.0, 0.1),
                      child: RotatedBox(
                          quarterTurns: 2,
                          child: SvgPicture.asset(
                              'assets/icons/dropdown_arrow.svg')),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Divider(
            color: Colors.grey[200],
            height: 1,
            thickness: 2,
            indent: 20,
            endIndent: 20,
          ),
          Container(
            height: 170.0,
            child: Scrollbar(
              controller: _controllerOne,
              isAlwaysShown: true,
              child: ListView(
                scrollDirection: Axis.vertical,
                children: _buildList(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _buildList() {
    List<Widget> _theList = [];

    for (int i = 0; i < _updatedList.length; i++) {
      BuildList buildList = BuildList(
          label: _updatedList[i]['site'],
          id: _updatedList[i]['id'],
          fontColor: Colors.grey);

      _theList.add(GestureDetector(
          onTap: () {
            widget.emitSiteSelected(_updatedList[i]['site']);
            print(_updatedList[i]['site']);
          },
          child: buildList));
    }
    return _theList;
  }
}
