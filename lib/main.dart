import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflix_clone/firebase_options.dart';
import 'package:netflix_clone/screens/movieDetailedProvider.dart';
import 'package:netflix_clone/screens/splash_screen.dart';
import 'package:netflix_clone/widgets/News_Detailed_Screen.dart';
import 'package:netflix_clone/widgets/movieListProvider.dart';
import 'package:netflix_clone/widgets/wishListManager.dart';
import 'package:provider/provider.dart';
// import 'package:alan_voice/alan_voice.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    name:"flixstreaming-d7054",
    options: DefaultFirebaseOptions.currentPlatform);


  runApp(MultiProvider
  (
    providers:[ChangeNotifierProvider(create: (context) => CartProvider()),],
    child: const MyApp()));
}

class MyApp extends StatefulWidget {
  _MyApp() {
    /// Init Alan Button with project key from Alan AI Studio
    // AlanVoice.addButton(
    //     "53804a82fae46024f3ad2514af2750542e956eca572e1d8b807a3e2338fdd0dc/stage",
    //     buttonAlign: AlanVoice.BUTTON_ALIGN_LEFT);

    // /// Handle commands from Alan AI Studio
    // AlanVoice.onCommand.add((command) {
    //   debugPrint("got new command ${command.toString()}");
    // });
  }

  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => WishlistManager(),
      child: MaterialApp(
        title: 'Netflix Clone',
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.dark,
        theme: ThemeData(
          textTheme: const TextTheme(
            bodyLarge: TextStyle(
              color: Colors.white,
              fontSize: 24,
            ),
            bodyMedium: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
          fontFamily: GoogleFonts.ptSans().fontFamily,
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple)
              .copyWith(background: Colors.black),
        ),
        home: const SplashScreen(),
        initialRoute: '/',
        routes: {
          NewsArticle.routeName:(context)=>const NewsArticle(),
        },
      ),
    );
  }
}
