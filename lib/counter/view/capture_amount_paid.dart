import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'breakdown_page.dart';
import '../models/money.dart';
import 'dart:math';

import '../counter.dart';

class SubmitAmount extends StatefulWidget {
  static const double amount_due = 450.50;

  @override
  _SubmitAmountState createState() => _SubmitAmountState();
}

class _SubmitAmountState extends State<SubmitAmount> {
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  var _controller = TextEditingController();
  double amountReceived;
  double amountForBreakdown;
  double twohundred;
  double onehundred;
  double fifty;
  double twenty;
  double ten;
  double five;
  double two;
  double one;
  double fiftycents;
  double twentycents;

  double _roundDouble(double value, int places) {
    double mod = pow(10.0, places);
    return ((value * mod).round().toDouble() / mod);
  }

  void _computeDispense(double breakdownamount) {
    var mod2 = breakdownamount % Money.twentycents;
    var balance = 0.0;
    if (mod2 != 0.0) {
      breakdownamount += mod2;
    }

    twohundred = breakdownamount / Money.twohundred;
    balance = breakdownamount % Money.twohundred;
    onehundred = balance / Money.onehundred;
    balance %= Money.onehundred;
    fifty = balance / Money.fifty;
    balance %= Money.fifty;
    twenty = balance / Money.twenty;
    balance %= Money.twenty;
    ten = balance / Money.ten;
    balance %= Money.ten;
    five = balance / Money.five;
    balance %= Money.five;
    two = balance / Money.two;
    balance %= Money.two;
    one = balance / Money.one;
    balance %= Money.one;
    fiftycents = balance / Money.fiftycents;
    balance %= Money.fiftycents;
    twentycents = balance / Money.twentycents;
    balance %= Money.twentycents;
  }

  void _done(value) {
    amountReceived = double.tryParse(value);
    if (amountReceived == null) {
      return;
    }
    setState(() {
      if (amountReceived > context.bloc<CounterCubit>().state) {
        context.bloc<CounterCubit>().decrement(amountReceived);
        amountForBreakdown = context.bloc<CounterCubit>().state;
      }
      if (amountReceived < context.bloc<CounterCubit>().state) {
        showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
            actions: [
              FlatButton(
                child: Text('Okay'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
            title: Text('The amount submitted is insufficient'),
          ),
        );
      }
    });
  }

  void _submit() {
    if (amountReceived == null) {
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          actions: [
            FlatButton(
              child: Text('Okay'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
          title: Text('You must enter an amount'),
        ),
      );
      return;
    }
    if (amountReceived < SubmitAmount.amount_due) {
      showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
                actions: [
                  FlatButton(
                    child: Text('Okay'),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  )
                ],
                title: Text('The amount submitted is insufficient'),
              ));
    } else {
      _computeDispense(context.bloc<CounterCubit>().state);
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => BreakDown(
              amountForBreakdown,
              twohundred.toInt(),
              onehundred.toInt(),
              fifty.toInt(),
              twenty.toInt(),
              ten.toInt(),
              five.toInt(),
              two.toInt(),
              one.toInt(),
              fiftycents.toInt(),
              twentycents.toInt(),
            ),
          )).then((_) => _resetBreakdown());
      setState(() {
        context.bloc<CounterCubit>().resetcounter();
      });
    }
  }

  void _resetBreakdown() {
    setState(() {
      amountReceived = 0.0;
      amountForBreakdown = 0.0;
      twohundred = 0.0;
      onehundred = 0.0;
      fifty = 0.0;
      twenty = 0.0;
      ten = 0.0;
      five = 0.0;
      two = 0.0;
      one = 0.0;
      fiftycents = 0.0;
      twentycents = 0.0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Coin Dispenser')),
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
                'Amount due: R' + SubmitAmount.amount_due.toString(),
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: _controller,
                decoration: InputDecoration(
                  labelText: 'Submit Amount',
                  suffixIcon: IconButton(
                    onPressed: () => _controller.clear(),
                    icon: Icon(Icons.clear),
                  ),
                ),
                keyboardType: TextInputType.numberWithOptions(),
                textInputAction: TextInputAction.done,
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}')),
                ],
                onSubmitted: (value) => _done(value),
              ),
              const SizedBox(height: 50),
              RaisedButton(
                child: Text('Submit'),
                onPressed: _submit,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
