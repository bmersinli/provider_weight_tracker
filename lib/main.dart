import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_weight_tracker/screens/weight_page.dart';
import 'package:provider_weight_tracker/state/weight_state.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (BuildContext context) => WeightState(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Provider Weight Tracker Demo',
        home: WeightPage(),
      ),
    );
  }
}
