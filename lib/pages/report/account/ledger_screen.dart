import 'package:flutter/material.dart';

class LedgerReportPage extends StatefulWidget {
  @override
  _LedgerReportPageState createState() => _LedgerReportPageState();
}

class _LedgerReportPageState extends State<LedgerReportPage> {
  // Filtered Data Placeholder
  List<Map<String, dynamic>> _filteredData = [];

  // Dummy Data
  final List<Map<String, dynamic>> _data = [
    {
      "TranType": "Debit",
      "BillType": "Sale",
      "PartyName": "ABC Services",
      "TransationNo": "TRN-0001",
      "TransationDate": "2024-12-29",
      "Amount": 1250.89,
      "TdsAmount": 125.09
    },
    {
      "TranType": "Debit",
      "BillType": "Payment",
      "PartyName": "Sun Pharma",
      "TransationNo": "TRN-0002",
      "TransationDate": "2024-12-29",
      "Amount": 10000.00,
      "TdsAmount": 100.00
    },
    {
      "TranType": "Credit",
      "BillType": "Purchase",
      "PartyName": "Green House Exporter logistics",
      "TransationNo": "SBIN-0002",
      "TransationDate": "2024-01-01",
      "Amount": 100000.68,
      "TdsAmount": 1000.95
    },
    {
      "TranType": "Credit",
      "BillType": "Reciept",
      "PartyName": "Green House Exporter logistics",
      "TransationNo": "SBIN-0002",
      "TransationDate": "2024-01-01",
      "Amount": 100000.68,
      "TdsAmount": 1000.95
    },
  ];

  @override
  void initState() {
    super.initState();
    _filteredData = _data; // Initialize filtered data
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Ledger Report')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: _filteredData.length,
          itemBuilder: (context, index) {
            final item = _filteredData[index];
            final isDebit = item['TranType'] == 'Debit';

            return Card(
              margin: EdgeInsets.symmetric(vertical: 8.0),
              color: isDebit ? Colors.red[100] : Colors.green[100],
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Row 1: Party Name (left), Transaction Type (right)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          item['PartyName'].toUpperCase(),
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16.0,
                          ),
                        ),
                        Text(
                          item['BillType'],
                          style: TextStyle(
                            color: isDebit ? Colors.red : Colors.green,
                            fontSize: 14.0,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 8.0),
                    // Row 2: Transaction No., Transaction Date, Transaction Amount
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Trans. No: ${item['TransationNo']}",
                          style: TextStyle(fontSize: 14.0),
                        ),
                        Text(
                          "Date: ${item['TransationDate']}",
                          style: TextStyle(fontSize: 14.0),
                        ),
                        // Text(
                        //   "Amt: ${item['Amount']}",
                        //   style: TextStyle(
                        //     fontWeight: FontWeight.bold,
                        //     color: isDebit ? Colors.red : Colors.green,
                        //   ),
                        // ),
                      ],
                    ),
                    SizedBox(height: 8.0),
                    // Row 3: Debit Amount, Credit Amount, TDS Amount
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Debit: ${isDebit ? item['Amount'] : 0.00}",
                          style: TextStyle(fontSize: 14.0),
                        ),
                        Text(
                          "Credit: ${!isDebit ? item['Amount'] : 0.00}",
                          style: TextStyle(fontSize: 14.0),
                        ),
                        Text(
                          "TDS: ${item['TdsAmount']}", // Placeholder for TDS Amount
                          style: TextStyle(fontSize: 14.0),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
