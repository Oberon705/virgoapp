import 'package:flutter/material.dart';
import 'package:virgo/pages/report/account/gst_card_screen.dart';
import 'package:virgo/pages/report/account/headwise_screen.dart';
import 'package:virgo/pages/report/account/ledger_screen.dart';
import 'package:virgo/pages/report/account/outstaning_screen.dart';
import 'package:virgo/pages/report/account/sale_register_screen.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.count(
            crossAxisCount: 2, // Number of columns
            mainAxisSpacing: 16, // Vertical spacing between buttons
            crossAxisSpacing: 16, // Horizontal spacing between buttons
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SaleRegisterPage(),
                    ),
                  );
                  print('Button Pressed - Register Report');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue[900], // Button color
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25), // Rounded corners
                  ),
                ),
                child: Text(
                  'Bill Register',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            OutstandingBillsPage() //OutstandingReportPage(),
                        ),
                  );
                  print('Button Pressed - Outstanding Report');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange[800], // Button color
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25), // Rounded corners
                  ),
                ),
                child: Text(
                  'Outstanding',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LedgerReportPage(),
                    ),
                  );
                  print('Button Pressed - Ledger Report');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey[900], // Button color
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25), // Rounded corners
                  ),
                ),
                child: Text(
                  'Ledger',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              ),
              // ElevatedButton(
              //   onPressed: () {
              //     Navigator.push(context,
              //         MaterialPageRoute(builder: (context) => GSTReportPage()));
              //     print('Button Pressed - GST Report');
              //   },
              //   style: ElevatedButton.styleFrom(
              //     backgroundColor: Colors.lightGreen[700], // Button color
              //     shape: RoundedRectangleBorder(
              //       borderRadius: BorderRadius.circular(25), // Rounded corners
              //     ),
              //   ),
              //   child: Text(
              //     'GST Report - Table',
              //     textAlign: TextAlign.center,
              //     style: TextStyle(fontSize: 20, color: Colors.white),
              //   ),
              // ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => LedgerReportCardPage()));
                  print('Button Pressed - GST Report');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.lightGreen[700], // Button color
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25), // Rounded corners
                  ),
                ),
                child: Text(
                  'GST (Goods & Services Tax)',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => HeadwiseReportPage()));
                  print('Button Pressed - Headwise Report');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue, // Button color
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25), // Rounded corners
                  ),
                ),
                child: Text(
                  'Bill Head Wise',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  print('Button Pressed - Aeging Report');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurple[600], // Button color
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25), // Rounded corners
                  ),
                ),
                child: Text(
                  'Aeging',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              )
            ]),
      ),
    );
  }
}
