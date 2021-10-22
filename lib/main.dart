import 'package:flutter/material.dart';
import 'widgets/auth/authWidget.dart';
import 'widgets/mainScreen/mainScreenWidget.dart';
import 'widgets/movieDetails/movieDetailsWidget.dart';
import 'theme/appColors.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'The Movie Database',
      theme: ThemeData(
        appBarTheme: AppBarTheme(backgroundColor: AppColors.mainDarckBlue),
        primarySwatch: Colors.blue,
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: AppColors.mainDarckBlue,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.grey,
        ),
      ),
      routes: <String, WidgetBuilder>{
        '/auth': (context) => AuthWidget(),
        '/mainScreenWidget': (context) => MainScreenWidget(),
        '/mainScreenWidget/movieDetailsWidget': (context) {
          final id = ModalRoute.of(context)?.settings.arguments;
          if (id is String) {
            return MovieDetailsWidget(movieCurrentId: id);
          } else {
            return MovieDetailsWidget(movieCurrentId: '0');
          }
        },
      },
      initialRoute: '/mainScreenWidget',
    );
  }
}
