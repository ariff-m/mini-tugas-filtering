import 'package:flutter/material.dart';
import 'package:mini_tugas_filtering/home_page.dart';
import 'package:mini_tugas_filtering/home_view_model.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => HomeViewModel()),
      ],
      child: MaterialApp(
        title: 'Tugas Mini Filtering',
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
          '/': (_) => const HomePage(),
        },
      ),
    );
  }
}
