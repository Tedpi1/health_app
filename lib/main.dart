import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'widgets/sidebar/navigation_provider.dart';
import 'authpage/login.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => NavigationProvider(),
      child: const App(),
    ),
  );
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Health App',
      theme: ThemeData(primarySwatch: Colors.deepOrange),
      home:  Login(),
    );
  }
}
