import 'package:flutter/material.dart';

class OutstandingReportPage extends StatefulWidget {
  const OutstandingReportPage({Key? key}) : super(key: key);

  @override
  _OutstandingReportPageState createState() => _OutstandingReportPageState();
}

class _OutstandingReportPageState extends State<OutstandingReportPage> {
  String _billType = 'Receivable';
  String? _selectedParty;
  DateTime? _fromDate;
  DateTime? _toDate;
  String? _selectedAction;

  final List<String> _parties = [
    'CREST Container Lines & Logistics',
    'Party A',
    'Party B'
  ];
  final List<String> _actions = [
    'Booking No',
    'Job No',
    'HBL No',
    'MBL No',
    'Bill No',
    'Container No'
  ];
  var outstandingAmount = 254890.02;
  final List<Map<String, dynamic>> _sampleData = List.generate(
      10,
      (index) => {
            'partyName':
                'CREST Container Lines & Logistics Private Limited, Mumbai',
            'jobNo': 'HBL2425/10000${index + 1}',
            'bookingNo': 'BKG100${index + 1}',
            'bookingDate': '2024-12-01',
            'invoiceNo': 'INV100${index + 1}',
            'invoiceDate': '2024-12-${31 - index}',
            'billAmount': 100000.00 + index * 1000,
            'recievedAmount': 75000.00 + index * 500,
            'outstandingAmount': 25000.00 + index * 500,
            'dueDate': '2025-01-${10 - index}',
            'overDueDays': index,
          });

  void _submitForm() {
    // Filter logic can be added here
    // For demonstration, we'll show the sample data
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => FilterResultsScreen(filteredData: _sampleData),
      ),
    );
  }

  Future<void> _selectDate(BuildContext context, bool isFromDate) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      setState(() {
        if (isFromDate) {
          _fromDate = picked;
        } else {
          _toDate = picked;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Outstanding')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Bill Type Toggle
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Bill Type:', style: TextStyle(fontSize: 16)),
                ToggleButtons(
                  isSelected: [
                    _billType == 'Payable',
                    _billType == 'Receivable'
                  ],
                  onPressed: (index) {
                    setState(() {
                      _billType = index == 0 ? 'Payable' : 'Receivable';
                    });
                  },
                  children: const [
                    Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        child: Text('Payable')),
                    Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        child: Text('Receivable')),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 16),

            // Party Dropdown
            DropdownButtonFormField<String>(
              decoration: const InputDecoration(labelText: 'Party'),
              items: _parties
                  .map((party) =>
                      DropdownMenuItem(value: party, child: Text(party)))
                  .toList(),
              value: _selectedParty,
              onChanged: (value) {
                setState(() {
                  _selectedParty = value;
                });
              },
            ),
            const SizedBox(height: 16),

            // Date Pickers
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    readOnly: true,
                    decoration: InputDecoration(
                      labelText: 'From Date',
                      suffixIcon: IconButton(
                        icon: const Icon(Icons.calendar_today),
                        onPressed: () => _selectDate(context, true),
                      ),
                    ),
                    controller: TextEditingController(
                      text: _fromDate != null
                          ? '${_fromDate!.year}-${_fromDate!.month.toString().padLeft(2, '0')}-${_fromDate!.day.toString().padLeft(2, '0')}'
                          : '',
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: TextFormField(
                    readOnly: true,
                    decoration: InputDecoration(
                      labelText: 'To Date',
                      suffixIcon: IconButton(
                        icon: const Icon(Icons.calendar_today),
                        onPressed: () => _selectDate(context, false),
                      ),
                    ),
                    controller: TextEditingController(
                      text: _toDate != null
                          ? '${_toDate!.year}-${_toDate!.month.toString().padLeft(2, '0')}-${_toDate!.day.toString().padLeft(2, '0')}'
                          : '',
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),

            // Action Dropdown
            DropdownButtonFormField<String>(
              decoration: const InputDecoration(labelText: 'Action'),
              items: _actions
                  .map((action) =>
                      DropdownMenuItem(value: action, child: Text(action)))
                  .toList(),
              value: _selectedAction,
              onChanged: (value) {
                setState(() {
                  _selectedAction = value;
                });
              },
            ),
            const SizedBox(height: 16),

            // Submit Button
            Center(
              child: ElevatedButton(
                onPressed: _submitForm,
                child: const Text('Submit'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FilterResultsScreen extends StatelessWidget {
  final List<Map<String, dynamic>> filteredData;

  const FilterResultsScreen({required this.filteredData, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(filteredData[0]['partyName'])),
      body: ListView.builder(
        itemCount: filteredData.length,
        itemBuilder: (context, index) {
          final data = filteredData[index];
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text("Invoice No: ${data['invoiceNo']}",
                            style: TextStyle(
                                fontSize: 14, color: Colors.grey[700])),
                      ),
                      Text("Invoice Date: ${data['invoiceDate']}",
                          style:
                              TextStyle(fontSize: 14, color: Colors.grey[700])),
                    ],
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Amount : ₹${data['billAmount']}",
                            style: TextStyle(
                                fontSize: 14, color: Colors.grey[700])),
                        Text("Outstanding : ₹${data['outstandingAmount']}",
                            style: TextStyle(fontSize: 14, color: Colors.red)),
                      ]),

                  const SizedBox(height: 12),
                  // Button to show other details
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {
                        _showDetailsDialog(context, index);
                      },
                      child: const Text("View Details"),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  void _showDetailsDialog(BuildContext context, index) {
    showDialog(
      context: context,
      builder: (context) {
        var reportData = filteredData[index];
        return AlertDialog(
          title: Text("Details for #${reportData['invoiceNo'] ?? '-'}"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Booking No    : ${reportData['bookingNo'] ?? '-'}"),
              Text("Invoice No    : ${reportData['invoiceNo'] ?? '-'}"),
              Text("Invoice Date  : ${reportData['invoiceDate'] ?? '-'}"),
              Text("Job No        : ${reportData['jobNo'] ?? '-'}"),
              Text("Bill Amount   : ${reportData['billAmount'] ?? '-'}"),
              Text("Outstanding   : ${reportData['outstandingAmount'] ?? '-'}"),
              Text("Recieved Amt  : ${reportData['recievedAmount'] ?? '-'}"),
              Text("Bill Due Date : ${reportData['dueDate'] ?? '-'}"),
              Text("Bill Due Days : ${reportData['overDueDays'] ?? '-'}"),
              // Add more details as needed
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Close"),
            ),
          ],
        );
      },
    );
  }
}
