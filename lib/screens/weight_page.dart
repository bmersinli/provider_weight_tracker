import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:provider/provider.dart';

import '../models/weight.dart';
import '../state/weight_state.dart';

class WeightPage extends StatelessWidget {
  const WeightPage({Key? key}) : super(key: key);
  final String text = "Weight Tracker Demo";
  final String cardText1 = "Current Weight";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(text),
      ),
      body: Consumer<WeightState>(
        builder: (context, value, child) {
          var weights = value.weights;
          return Container(
            child: Column(
              children: [
                Container(
                  height: 50,
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(cardText1, textScaleFactor: 1.3),
                          Text(
                            weights.first.value.toString(),
                            textScaleFactor: 1.5,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemBuilder: (BuildContext context, index) {
                      var weight = weights[index];
                      return ListTile(
                        title: Text(
                          "${weight.time.day}.${weight.time.month}.${weight.time.year}",
                        ),
                        trailing: Text(
                          weight.value.toString(),
                          textScaleFactor: 1.5,
                        ),
                      );
                    },
                    itemCount: value.weights.length,
                  ),
                ),
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          var state = Provider.of<WeightState>(context, listen: false);
          var result = await showDialog<double>(
              context: context,
              builder: (context) => DecimalNumberPicker(
                  minValue: 10,
                  maxValue: 100,
                  value: state.weights.first.value,
                  onChanged: (result) async {
                    if (result != null && result > 0)
                      state.add(
                        Weight(
                          value: result,
                          time: DateTime.now(),
                        ),
                      );
                  }));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
