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
  bool isReverse = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('GST Calc'),
        ),
        body: Column(
          children: [
            SwitchListTile(
              value: isReverse,
              onChanged: (v) {
                isReverse = v;
                setState(() {});
              },
              title: Text('isReverse'),
            ),
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
              onPressed: () {
                if (txtAmnt.text.isNotEmpty && txtPer.text.isNotEmpty) {
                  igst = double.parse(txtAmnt.text) *
                      double.parse(txtPer.text) *
                      0.01;
                  cgst = igst * 0.5;
                  sgst = cgst;
                  txtTotalAmnt.text =
                      (double.parse(txtAmnt.text) + igst).toString();
                  setState(() {});
                }
              },
              child: Text('Calculate'),
            ),
          ],
        ));
  }
}
