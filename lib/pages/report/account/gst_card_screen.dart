import 'package:flutter/material.dart';

class LedgerReportCardPage extends StatelessWidget {
  final List<Map<String, dynamic>> invoiceData = [
    {
      'Date': '2025-01-06',
      'Bill No': 'INV001',
      'Party Name': 'ABC Pvt Ltd',
      'GST No.': '27AAAAA1234A1Z5',
      'State': 'Maharashtra',
      'Job No.': 'JOB001',
      'Total GST': 8400,
    },
    {
      'Date': '2025-01-07',
      'Bill No': 'INV002',
      'Party Name': 'XYZ Enterprises',
      'GST No.': '27BBBBB5678B1Z6',
      'State': 'Delhi',
      'Job No.': 'JOB002',
      'Total GST': 11400,
    },

    {
      'Date': '2025-01-07',
      'Bill No': 'INV003',
      'Party Name': 'XYZ Enterprises',
      'GST No.': '27BBBBB5678B1Z6',
      'State': 'Delhi',
      'Job No.': 'JOB002',
      'Total GST': 14000,
    },
    // Add more sample data here
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Invoice Cards'),
        backgroundColor: Colors.blueAccent,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: invoiceData.map((invoice) {
            return Card(
              margin: EdgeInsets.symmetric(vertical: 8),
              elevation: 6,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              color: Color.fromRGBO(180, 191, 253, 0.884),
              child: Padding(
                padding: EdgeInsets.all(15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Bill No: ${invoice['Bill No']}',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'Date: ${invoice['Date']}',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey[900],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Party Name: ${invoice['Party Name']}',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      'GST No.: ${invoice['GST No.']}',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey[700],
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      'State: ${invoice['State']}',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey[700],
                      ),
                    ),
                    SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Job No: ${invoice['Job No.']}',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          'Total GST: ₹${invoice['Total GST']}',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.green,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
