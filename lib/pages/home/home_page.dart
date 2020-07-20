import 'package:flutter/material.dart';
import 'package:flutter_app/pages/home/widgets/page_view/dot_slider.dart';
import 'package:flutter_app/pages/home/widgets/menu/menu_app.dart';
import 'package:flutter_app/pages/home/widgets/bottom_menu/menu_bottom.dart';
import 'package:flutter_app/pages/home/widgets/my_app_bar.dart';
import 'package:flutter_app/pages/home/widgets/page_view/page_view_app.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool _showMenu;
  int _currentIndex;
  double _yPosition;

  @override
  void initState() {
    super.initState();
    _showMenu = false;
    _currentIndex = 0;
  }

  @override
  Widget build(BuildContext context) {
    double _screenHeight = MediaQuery.of(context).size.height;

    if (_yPosition == null) {
      _yPosition = _screenHeight * .24;
    }

    return Scaffold(
      backgroundColor: Colors.purple[800],
      body: Stack(
        alignment: Alignment.topCenter,
        children: <Widget>[
          MyAppBar(
            showMenu: _showMenu,
            onTap: () {
              setState(() {
                _showMenu = !_showMenu;
                _yPosition =
                    _showMenu ? _screenHeight * .90 : _screenHeight * .24;
              });
            },
          ),
          MenuApp(
            showMenu: _showMenu,
            top: _screenHeight * .20,
          ),
          DotSlider(
            showMenu: _showMenu,
            top: _screenHeight * .70,
            currentIndex: _currentIndex,
          ),
          PageViewApp(
            showMenu: _showMenu,
            top: _yPosition,
            onChanged: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            onPanUpdade: (details) {
              double limitTop = _screenHeight * .24;
              double limitBottom = _screenHeight * .90;
              double middlePosition = limitBottom - limitTop;

              middlePosition = middlePosition / 2;

              setState(() {
                _yPosition += details.delta.dy;
                // Up card
                _yPosition = _yPosition < limitTop ? limitTop : _yPosition;
                // Down card
                _yPosition =
                    _yPosition > limitBottom ? limitBottom : _yPosition;

                // Middle position up/down
                if (_yPosition != limitBottom && details.delta.dy > 0) {
                  _yPosition = _yPosition > limitTop + middlePosition - 150
                      ? limitBottom
                      : _yPosition;
                } else if (_yPosition != limitTop && details.delta.dy < 0) {
                  _yPosition = _yPosition < limitBottom - middlePosition + 150
                      ? limitTop
                      : _yPosition;
                }

                // Desable card list
                if (_yPosition == limitBottom) {
                  _showMenu = true;
                } else if (_yPosition == limitTop) {
                  _showMenu = false;
                }
              });
            },
          ),
          BottomMenu(
            showMenu: _showMenu,
          ),
        ],
      ),
    );
  }
}
