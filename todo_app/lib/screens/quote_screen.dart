import 'package:flutter/material.dart';
import 'package:todo_app/models/quote.dart';
import 'package:todo_app/services/api_calls.dart';

class QuoteScreen extends StatefulWidget {
  const QuoteScreen({super.key});

  @override
  State<QuoteScreen> createState() => _QuoteScreenState();
}

class _QuoteScreenState extends State<QuoteScreen> {
  List<Quote> quote = [];
  @override
  void initState() {
    super.initState();
    fetchQuote();
  }

  fetchQuote() async {
    var ret = await APICalls.fetchQuote();
    if (ret.lenght > 0) {
      quote = ret;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Quote Screen')),
        body: Column(children: [
          Expanded(
            child: Text(''),
          ),
          ElevatedButton(
            onPressed: () {
              //logic to call api
            },
            child: Text('Fetch new Quote'),
          ),
        ]));
  }
}
