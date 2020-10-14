import 'package:flutter/material.dart';

class BreakDown extends StatefulWidget {
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
  _BreakDownState createState() => _BreakDownState();
}

class _BreakDownState extends State<BreakDown> {
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
                          'Amount to be returned\nR${widget.amountToBreakDown.toStringAsFixed(2)}'),
                      const SizedBox(
                        height: 30,
                      ),
                      Text('Breakdown:'),
                      widget.twohundred == 0
                          ? SizedBox()
                          : Text('${widget.twohundred} x R200.00'),
                      widget.onehundred == 0
                          ? SizedBox()
                          : Text('${widget.onehundred} X R100.00'),
                      widget.fifty == 0
                          ? SizedBox()
                          : Text('${widget.fifty} x R50.00'),
                      widget.twenty == 0
                          ? SizedBox()
                          : Text('${widget.twenty} x R20.00'),
                      widget.ten == 0
                          ? SizedBox()
                          : Text('${widget.ten} x R10.00'),
                      widget.five == 0
                          ? SizedBox()
                          : Text('${widget.five} x R5.00'),
                      widget.two == 0
                          ? SizedBox()
                          : Text('${widget.two} x R2.00'),
                      widget.one == 0
                          ? SizedBox()
                          : Text('${widget.one} x R200.00'),
                      widget.fiftyCents == 0
                          ? SizedBox()
                          : Text('${widget.fiftyCents} x 50 cents'),
                      widget.twentyCents == 0
                          ? SizedBox()
                          : Text('${widget.twentyCents} x 20 cents'),
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
