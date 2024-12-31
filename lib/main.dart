import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'src/providers/flashcard_provider.dart';
import 'src/screens/main_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => FlashcardProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flashcard App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MainScreen(),
      ),
    );
  }
}
