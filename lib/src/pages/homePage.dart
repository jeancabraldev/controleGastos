import 'package:controleGastos/src/widget/body.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class HomePage extends StatelessWidget {

  Widget _bottomAction(IconData icon) {
    return InkWell(
        child: Icon(icon, color: Colors.black45,),
        onTap: () {},
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomAppBar(
        notchMargin: 5,
        shape: CircularNotchedRectangle(),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 15, 0, 15),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              _bottomAction(FontAwesomeIcons.history),
              _bottomAction(FontAwesomeIcons.chartPie),
              SizedBox(width: 30),
              _bottomAction(FontAwesomeIcons.wallet),
              _bottomAction(Icons.settings),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.purple[900],
        child: Icon(Icons.add),
        onPressed: () {},
      ),
      body: Body(),
    );
  }
}