import 'package:flutter/material.dart';
import 'package:mirror_wall/screen/provider/Google_Provider.dart';
import 'package:mirror_wall/screen/view/home_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers: [
  ChangeNotifierProvider(create: (context) => Google_provider(),)
  ],
      child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
    routes:
      {
        '/' : (context) => Home_page(),
      },
    );
  }
}
