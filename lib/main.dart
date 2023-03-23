import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meeshoapp/providers/products_provider.dart';
import 'package:meeshoapp/screens/bottom_navigation.dart';
import 'package:meeshoapp/screens/home_screen.dart';
import 'package:meeshoapp/test.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(Meesho());
  //runApp(MyApp());
}

class Meesho extends StatelessWidget {
  const Meesho({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ProductProvider(),
        )
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primaryColor: Colors.pink[400],
            textTheme: TextTheme(
                bodyText2: GoogleFonts.spectral(
                    fontWeight: FontWeight.w500) //fontStyle:
                // bodyText2: TextStyle(fontStyle: ),
                ),
          ),
          home: const BottomNavigator()),
    );
  }
}
