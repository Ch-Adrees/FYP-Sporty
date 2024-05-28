import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fyp/Screens/HomeScreen/navigation_bar.dart';
import 'firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:fyp/HelperMaterial/app_themes.dart';
import 'HelperMaterial/routes.dart';
import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late List<ConnectivityResult> result;
  late StreamSubscription<List<ConnectivityResult>> subscription;

  var isConnected = false;

  @override
  void initState() {
    super.initState();
    startStreaming();
  }

  startStreaming() {
    subscription = Connectivity().onConnectivityChanged.listen((event) {
      checkInternet();
    });
  }

  checkInternet() async {
    result = await (Connectivity().checkConnectivity());
    if (result.contains(ConnectivityResult.none)) {
      isConnected = false;
      showMyDialog();
    } else {
      isConnected = true;
    }
    setState(() {});
  }

  @override
  void dispose() {
    subscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Sporty App',
      theme: AppTheme.lightTheme(context),
      //home:const MyAdsScreen(),
      initialRoute: NavBarScreen.routeName,
      //home:const  InternetConnection(),
      //initialRoute: CompleteProfile.routeName,
      routes: listOfRoutes,
    );
  }

  Future<void> showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Connection Lost'),
          content: const SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('disconnected from Internet!'),
                Text('Please Retry to connect again'),
              ],
            ),
          ),
          actions: <Widget>[
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  checkInternet();
                },
                child: const Text("Retry")),
          ],
        );
      },
    );
  }
}
