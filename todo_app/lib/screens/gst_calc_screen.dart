import 'package:flutter/material.dart';

class GSTCalcScreen extends StatefulWidget {
  const GSTCalcScreen({super.key});

  @override
  State<GSTCalcScreen> createState() => _GSTCalcScreenState();
}

class _GSTCalcScreenState extends State<GSTCalcScreen> {
  TextEditingController txtAmnt = TextEditingController();
  TextEditingController txtPer = TextEditingController();
  TextEditingController txtTotalAmnt = TextEditingController();
  double igst = 0;
  double sgst = 0;
  double cgst = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('GST Calc'),
        ),
        body: Column(
          children: [
            TextField(
              controller: txtAmnt,
              decoration: InputDecoration(
                hintText: 'Enter Amount/Price',
                labelText: 'Amount/Price',
              ),
            ),
            TextField(
              controller: txtPer,
              decoration: InputDecoration(
                hintText: 'Enter GST Per',
                labelText: 'GST Per',
              ),
            ),
            Text('IGST ${igst}'),
            Text('CGST ${cgst}'),
            Text('SGST ${sgst}'),
            TextField(
              controller: txtTotalAmnt,
              decoration: InputDecoration(
                hintText: 'Enter Total Amount',
                labelText: 'Total Amount',
              ),
            ),
            ElevatedButton(
              onPressed: () {},
              child: Text('Calculate'),
            ),
          ],
        ));
  }
}
