import 'package:flutter/material.dart';

class HeadwiseReportPage extends StatefulWidget {
  const HeadwiseReportPage({super.key});

  @override
  _HeadwiseReportPageState createState() => _HeadwiseReportPageState();
}

class _HeadwiseReportPageState extends State<HeadwiseReportPage> {
  // Sample data organized by "heads"
  final Map<String, List<Map<String, dynamic>>> _headwiseData = {
    'Sales': [
      {'id': 1, 'name': 'Invoice A', 'amount': 500.00, 'date': '2025-01-01'},
      {'id': 2, 'name': 'Invoice B', 'amount': 750.00, 'date': '2025-01-02'},
    ],
    'Purchases': [
      {'id': 3, 'name': 'Order C', 'amount': 300.00, 'date': '2025-01-03'},
      {'id': 4, 'name': 'Order D', 'amount': 400.00, 'date': '2025-01-04'},
    ],
    'Expenses': [
      {'id': 5, 'name': 'Expense E', 'amount': 150.00, 'date': '2025-01-05'},
      {'id': 6, 'name': 'Expense F', 'amount': 200.00, 'date': '2025-01-06'},
    ],
  };

  String? _selectedHead;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Headwise Report'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Dropdown for selecting head
            DropdownButtonFormField<String>(
              value: _selectedHead,
              decoration: InputDecoration(
                labelText: 'Select Head',
                border: OutlineInputBorder(),
              ),
              items: _headwiseData.keys
                  .map((head) => DropdownMenuItem(
                        value: head,
                        child: Text(head),
                      ))
                  .toList(),
              onChanged: (value) {
                setState(() {
                  _selectedHead = value;
                });
              },
            ),
            SizedBox(height: 16),
            // Display the selected head's data
            Expanded(
              child: _selectedHead == null
                  ? Center(
                      child: Text('Please select a head to view the report'))
                  : ListView.builder(
                      itemCount: _headwiseData[_selectedHead]!.length,
                      itemBuilder: (context, index) {
                        final item = _headwiseData[_selectedHead]![index];
                        return Card(
                          margin: EdgeInsets.symmetric(vertical: 8.0),
                          child: ListTile(
                            leading: CircleAvatar(
                              child: Text(item['id'].toString()),
                            ),
                            title: Text(item['name']),
                            subtitle: Text(
                              'Amount: \$${item['amount']}\nDate: ${item['date']}',
                            ),
                            isThreeLine: true,
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
