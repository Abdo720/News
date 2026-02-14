import 'package:flutter/material.dart';
import 'package:news/Core/themeing.dart';
import 'package:news/appScreen.dart';
import 'package:news/home_veiw.dart';
import 'package:news/providers/themeprovider.dart';
import 'package:news/splachScreen.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    ChangeNotifierProvider(
      create: (context) => Themeprovider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<Themeprovider>(context);

    return MaterialApp(
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: themeProvider.theme,
      debugShowCheckedModeBanner: false,
      initialRoute: Splachscreen.routeName,
      routes: {
        AppScreen.routeName: (context) => AppScreen(),
        Splachscreen.routeName: (context) => Splachscreen(),
      },
    );
  }
}
