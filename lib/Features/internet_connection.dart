import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:fyp/Features/provi_wid.dart';
import 'package:fyp/HelperMaterial/app_themes.dart';

import 'package:fyp/Screens/wrapper_screen.dart';

class InternetConnection extends StatefulWidget {
  const InternetConnection({super.key});

  @override
  State<InternetConnection> createState() => _InternetConnectionState();
}

class _InternetConnectionState extends State<InternetConnection> {
  late List<ConnectivityResult> result;
  late StreamSubscription<List<ConnectivityResult>> subscription;

  var isConnected = false;

  @override
  void initState() {
    super.initState();
    startStreaming();
  }

  @override
  void dispose() {
    subscription.cancel();
    super.dispose();
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

  startStreaming() {
    subscription = Connectivity().onConnectivityChanged.listen((event) {
      checkInternet();
    });
  }

  showDialouge(String message) {
    ProviderWidgets.showFlutterToast(context, message);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Sporty App',
      theme: AppTheme.lightTheme(context),
      home: const WrappeScreen(),
      // initialRoute: OnBoardScreen.routeName,
      // routes: listOfRoutes,
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
