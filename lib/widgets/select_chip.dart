import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:scroller/widgets/site_lists.dart';

class SelectChip extends StatefulWidget {
  final Color bgColor;
  final Color fontColor;
  final String label;
  final String placeholder;
  final int clickID;
  final Function(String) emitSiteSelected;

  const SelectChip({
    Key? key,
    required this.bgColor,
    required this.fontColor,
    required this.label,
    required this.clickID,
    required this.emitSiteSelected,
    required this.placeholder,
  }) : super(key: key);

  @override
  _SelectChipState createState() => _SelectChipState();
}

class _SelectChipState extends State<SelectChip> {
  late OverlayEntry _overlayEntry;
  final GlobalKey globalKey = GlobalKey();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        key: globalKey,
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
        width: 280,
        height: 70,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              child: Text(
                widget.label.length == 0
                    ? widget.placeholder
                    : widget.label, //containerText
                textAlign: TextAlign.left,
                style: TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: 15,
                    color: widget.fontColor),
              ),
              width: 150,
            ),
            GestureDetector(
              onTap: () {
                _openDropdown();
                print("CLICKED " + widget.clickID.toString());

                setState(() {});
              },
              child: Align(
                child: Container(
                  height: 40,
                  width: 40,
                  alignment: Alignment(1.0, 0.0),
                  child: RotatedBox(
                      quarterTurns: 4,
                      child:
                          SvgPicture.asset('assets/icons/dropdown_arrow.svg')),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _openDropdown() {
    this._overlayEntry = this._createOverlayEntry();
    Overlay.of(context)!.insert(this._overlayEntry);
  }

  OverlayEntry _createOverlayEntry() {
    RenderBox renderBox = globalKey.currentContext!.findRenderObject()
        as RenderBox; //get position of container
    Offset position = renderBox.localToGlobal(Offset.zero);

    return OverlayEntry(
      builder: (context) => Material(
        color: Colors.transparent,
        child: Stack(
          children: [
            Positioned(
              top: position.dy,
              left: position.dx,
              child: Container(
                child: SiteList(
                  bgColor: Colors.white,
                  titleFontColor: Colors.black,
                  listFontColor: Colors.grey,
                  searchTitle: widget.label.length == 0
                      ? 'Recherchez un site'
                      : widget.label,
                  listID: 1,
                  emitSiteSelected: (String value) {
                    widget.emitSiteSelected(value);
                    _closeDropdown();
                  },
                  closeDropdown: () {
                    _closeDropdown();
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _closeDropdown() {
    this._overlayEntry.remove();
  }
}
