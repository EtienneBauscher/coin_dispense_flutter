import 'package:flutter/material.dart';

class BreakDown extends StatelessWidget {
  final double amountToBreakDown;
  final twohundred;
  final onehundred;
  final fifty;
  final twenty;
  final ten;
  final five;
  final two;
  final one;
  final fiftyCents;
  final twentyCents;

  const BreakDown(
    this.amountToBreakDown,
    this.twohundred,
    this.onehundred,
    this.fifty,
    this.twenty,
    this.ten,
    this.five,
    this.two,
    this.one,
    this.fiftyCents,
    this.twentyCents,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Dispense Cash'),
        ),
        body: SingleChildScrollView(
            child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const SizedBox(height: 30),
                      Text(
                          'Amount to be returned\nR${amountToBreakDown.toStringAsFixed(2)}'),
                      const SizedBox(
                        height: 30,
                      ),
                      Text('Breakdown:'),
                      twohundred == 0
                          ? SizedBox()
                          : Text('$twohundred x R200.00'),
                      onehundred == 0
                          ? SizedBox()
                          : Text('$onehundred X R100.00'),
                      fifty == 0 ? SizedBox() : Text('$fifty x R50.00'),
                      twenty == 0 ? SizedBox() : Text('$twenty x R20.00'),
                      ten == 0 ? SizedBox() : Text('$ten x R10.00'),
                      five == 0 ? SizedBox() : Text('$five x R5.00'),
                      two == 0 ? SizedBox() : Text('$two x R2.00'),
                      one == 0 ? SizedBox() : Text('$one x R200.00'),
                      fiftyCents == 0
                          ? SizedBox()
                          : Text('$fiftyCents x 50 cents'),
                      twentyCents == 0
                          ? SizedBox()
                          : Text('$twentyCents x 20 cents'),
                      const SizedBox(height: 50),
                      RaisedButton(
                        child: const Text('Reset'),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      )
                    ]))));
  }
}
