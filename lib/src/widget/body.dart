import 'package:controleGastos/src/widget/graph.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Body extends StatefulWidget {

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {

  //Controlando as pageViews
  PageController _pageController;

  int currentPage = 1;

  @override
  void initState() { 
    super.initState();
    _pageController = PageController(
      initialPage: 1,
      viewportFraction: 0.4
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: <Widget>[
          _selector(),
          _expenses(),
          _graph(),
          Container(
            height: 5,
            color: Color(0XFFECEFF1),
          ),
          _list(),
        ],
      ),
    );
  }

  Widget _pageItem(String name, int position) {

    var _aligment;

    final selected = TextStyle(
      fontSize: 20, 
      fontWeight: FontWeight.bold,
      color: Colors.white
    );

    final unSelected = TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.normal,
      color: Colors.white.withOpacity(0.5)
    );

    //Verificando se se a posição é a mesma da página atual
    if(position == currentPage){
      _aligment = Alignment.center;
    } else if(position > currentPage) {
      _aligment = Alignment.centerRight;
    }else {
      _aligment = Alignment.centerLeft;
    }

    return Align(
      alignment: _aligment,
      child: Text(
        name,
        style: position == currentPage ? selected : unSelected
      ));
  }

  Widget _selector() {
    return SizedBox.fromSize(
        size: Size.fromHeight(70),
        child: Container(
          color: Colors.purple[900],
          child: PageView(
            controller: _pageController,
            onPageChanged: (page) {
              setState(() {
                currentPage = page;
              });
            },
          children: <Widget>[
            _pageItem('JANEIRO',0),
            _pageItem('FEVEREIRO',1),
            _pageItem('MARÇO',2),
            _pageItem('ABRIL',3),
            _pageItem('MAIO',4),
            _pageItem('JUNHO',5),
            _pageItem('JULHO',6),
            _pageItem('AGOSTO',7),
            _pageItem('SETEMBRO',8),
            _pageItem('OUTUBRO',9),
            _pageItem('NOVEMBRO',10),
            _pageItem('DEZEMBRO',11),
          ],
      ),
        ),
    );
  }

  Widget _expenses() {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
      child: Column(
        children: <Widget>[
          Text(
            'R\$ 1000.00',
            style: TextStyle(
              fontSize: 28,
            ),
          ),
          Text('Total de gastos'),
        ],
      ),
    );
  }

  Widget _graph() {
    return Container(
      color: Colors.white,
      height: 200,
      child: Graph(),
    );
  }

  Widget _tem(IconData icon, String name, int porcent, double value) {
    return ListTile(
      leading: Icon(icon, size: 26),
      title: Text(name, style: TextStyle(fontSize: 18, fontWeight:  FontWeight.bold)),
      subtitle: Text('$porcent% de gastos'),
      trailing: Container(
        decoration: BoxDecoration(
          color: Colors.purpleAccent.withOpacity(0.2),
          borderRadius: BorderRadius.circular(8)
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            'R\$ $value', 
            style: TextStyle(
              fontSize: 16, 
              fontWeight: FontWeight.bold, 
              color: Colors.purple[900])
            ),
        ),
      ),
    );
  }

  Widget _list() {
    return Expanded(
        child: Container(
          color: Colors.white,
          child: ListView.separated(
            itemCount: 15,
            itemBuilder: (BuildContext context, index) => 
            _tem(FontAwesomeIcons.shoppingCart, 'Shopping', 14, 145.12),
          separatorBuilder: (BuildContext context, index) {
            return Container(
              color: Color(0XFFECEFF1),
              height: 2,
            );
          },
      ),
        ),
    );
  }
}