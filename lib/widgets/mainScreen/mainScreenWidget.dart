import 'package:flutter/material.dart';
import '../movieList/movieListWidget.dart';

class MainScreenWidget extends StatefulWidget {
  MainScreenWidget({Key? key}) : super(key: key);
  @override
  _MainScreenWidgetState createState() => _MainScreenWidgetState();
}

class _MainScreenWidgetState extends State<MainScreenWidget> {
  int _selectedTab = 1;

  void onSelectTab(int index) {
    if (_selectedTab == index) return;
    setState(() {
      _selectedTab = index;
    });
  }

  // static final List<Widget> _widgetOptions = <Widget>[
  //   Text('Home page'),
  //   MovieListWidget(),
  //   Text('Serials page'),
  // ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Image.asset(
              'assets/image/TMD_logo.png',
              fit: BoxFit.contain,
              width: 55,
            ),
            IconButton(
              icon: const Icon(Icons.person),
              color: Colors.white,
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(Icons.search),
              color: Colors.lightBlue,
              onPressed: () {},
            ),
          ],
        ),
      ),
      body: IndexedStack(
        index: _selectedTab,
        children: [
          Text('Home page'),
          MovieListWidget(),
          Text('Serials page'),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.movie),
            label: 'Movie',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.tv),
            label: 'Serials',
          ),
        ],
        currentIndex: _selectedTab,
        onTap: onSelectTab,
      ),
    );
  }
}
