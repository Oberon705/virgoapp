import 'package:flutter/material.dart';

/*
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

  final List<Map<String, dynamic>> _sampleData = List.generate(
      10,
      (index) => {
            'partyName':
                'CREST Container Lines & Logistics Private Limited, Mumbai 40010${index + 1}',
            'outstandingAmount': 25000.00 + index * 500,
            'outstandingBills': [
              {
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
              },
              {
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
              }
            ]
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
          final party = filteredData[index];
          final bill = party['outstandingBills'][0];
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
            child: Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      party['partyName'],
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Invoice No: ${bill['invoiceNo']}',
                          style: TextStyle(fontSize: 14),
                        ),
                        Text(
                          'Invoice Date: ${bill['invoiceDate']}',
                          style: TextStyle(fontSize: 14),
                        ),
                      ],
                    ),
                    SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Bill Amount: ₹${bill['billAmount'].toStringAsFixed(2)}',
                          style: TextStyle(fontSize: 14),
                        ),
                        Text(
                          'Outstanding: ₹${bill['outstandingAmount'].toStringAsFixed(2)}',
                          style: TextStyle(fontSize: 14, color: Colors.red),
                        ),
                      ],
                    ),
                    SizedBox(height: 8),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: ElevatedButton(
                        onPressed: () {
                          _showDetailsDialog(context, index);
                          // Implement view details action
                        },
                        child: Text('View Details'),
                      ),
                    ),
                  ],
                ),
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
*/

/*
class OutstandingBillsPage extends StatefulWidget {
  @override
  _OutstandingBillsPageState createState() => _OutstandingBillsPageState();
}

class _OutstandingBillsPageState extends State<OutstandingBillsPage> {
  final List<Map<String, dynamic>> _sampleData = List.generate(
    10,
    (index) => {
      'partyName':
          'CREST Container Lines & Logistics Private Limited, Mumbai 40010${index + 1}',
      'outstandingAmount': 25000.00 + index * 500,
      'outstandingBills': [
        {
          'invoiceNo': 'INV100${index + 1}',
          'invoiceDate': '2024-12-${31 - index}',
          'bookingNo': 'BKG100${index + 1}',
          'bookingDate': '2024-12-01',
          'jobNo': 'HBL2425/10000${index + 1}',
          'hblNo': 'HBL100${index + 1}',
          'mblNo': 'MBL100${index + 1}',
          'billAmount': 100000.00 + index * 1000,
          'recievedAmount': 75000.00 + index * 500,
          'outstandingAmount': 25000.00 + index * 500,
          'dueDate': '2025-01-${10 - index}',
          'overDueDays': index,
        }
      ]
    },
  );

  List<Map<String, dynamic>> filteredData = [];
  final TextEditingController _partyNameController = TextEditingController();
  final TextEditingController _minAmountController = TextEditingController();

  @override
  void initState() {
    super.initState();
    filteredData = _sampleData;
  }

  void _filterData() {
    setState(() {
      final partyName = _partyNameController.text.toLowerCase();
      final minAmount = double.tryParse(_minAmountController.text) ?? 0;

      filteredData = _sampleData.where((party) {
        final matchName = party['partyName'].toLowerCase().contains(partyName);
        final matchAmount = party['outstandingAmount'] >= minAmount;
        return matchName && matchAmount;
      }).toList();
    });
  }

  void _exportToExcel() {
    // Logic to export data to Excel
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Export to Excel functionality not implemented')),
    );
  }

  void _shareData() {
    // Logic to share data via media
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Share functionality not implemented')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Outstanding Bills'),
      ),
      body: Column(
        children: [
          // Filter Form
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    TextField(
                      controller: _partyNameController,
                      decoration: InputDecoration(
                        labelText: 'Party Name',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(height: 8),
                    TextField(
                      controller: _minAmountController,
                      decoration: InputDecoration(
                        labelText: 'Minimum Outstanding Amount',
                        border: OutlineInputBorder(),
                      ),
                      keyboardType: TextInputType.number,
                    ),
                    SizedBox(height: 8),
                    ElevatedButton(
                      onPressed: _filterData,
                      child: Text('Filter'),
                    ),
                  ],
                ),
              ),
            ),
          ),
          // Filtered Data Display
          Expanded(
            child: ListView.builder(
              itemCount: filteredData.length,
              itemBuilder: (context, index) {
                final party = filteredData[index];
                final totalOutstanding = party['outstandingAmount'];
                final bills = party['outstandingBills'];

                return Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 8.0, vertical: 4.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Party Name and Actions
                      Card(
                        elevation: 4,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                party['partyName'],
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 4),
                              Text(
                                'Total Outstanding: ₹${totalOutstanding.toStringAsFixed(2)}',
                                style:
                                    TextStyle(fontSize: 14, color: Colors.red),
                              ),
                              SizedBox(height: 8),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  ElevatedButton(
                                    onPressed: _exportToExcel,
                                    child: Text('Export to Excel'),
                                  ),
                                  ElevatedButton(
                                    onPressed: _shareData,
                                    child: Text('Share'),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      Divider(),
                      // Individual Bills
                      ...bills.map<Widget>((bill) {
                        return Card(
                          elevation: 4,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Invoice No and Date
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Invoice No: ${bill['invoiceNo']}',
                                      style: TextStyle(fontSize: 14),
                                    ),
                                    Text(
                                      'Invoice Date: ${bill['invoiceDate']}',
                                      style: TextStyle(fontSize: 14),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 8),
                                // Bill Amount and Outstanding Amount
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Bill Amount: ₹${bill['billAmount'].toStringAsFixed(2)}',
                                      style: TextStyle(fontSize: 14),
                                    ),
                                    Text(
                                      'Outstanding: ₹${bill['outstandingAmount'].toStringAsFixed(2)}',
                                      style: TextStyle(
                                          fontSize: 14, color: Colors.red),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 8),
                                // View Details Button
                                Align(
                                  alignment: Alignment.bottomRight,
                                  child: ElevatedButton(
                                    onPressed: () {
                                      _showBillDetails(context, bill);
                                    },
                                    child: Text('View Details'),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      }).toList(),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  
*/
class OutstandingBillsPage extends StatefulWidget {
  @override
  _OutstandingBillsPageState createState() => _OutstandingBillsPageState();
}

class _OutstandingBillsPageState extends State<OutstandingBillsPage> {
  final List<Map<String, dynamic>> _sampleData = List.generate(
    5,
    (partyIndex) => {
      'partyName': 'Customer - ${String.fromCharCode(65 + partyIndex)}',
      'partyType': 'Customer',
      'outstandingAmount': 25000.00 + partyIndex * 5000,
      'outstandingBills': List.generate(
        5 + partyIndex, // 5 to 10 records per party
        (billIndex) => {
          'invoiceNo': 'INV${partyIndex + 1}${billIndex + 1}',
          'invoiceDate': '2024-12-${31 - billIndex}',
          'bookingNo': 'BKG${partyIndex + 1}${billIndex + 1}',
          'jobNo': 'HBL2425/100${partyIndex + 1}${billIndex + 1}',
          'containerNo': 'CONT${partyIndex + 1}${billIndex + 1}',
          'billAmount': 100000.00 + billIndex * 1000,
          'recievedAmount': 75000.00 + billIndex * 500,
          'outstandingAmount': 25000.00 + billIndex * 500,
          'dueDate': '2025-01-${10 - billIndex}',
          'overDueDays': billIndex,
        },
      ),
    },
  );

  List<Map<String, dynamic>> filteredData = [];
  bool showFilterForm = true;
  String selectedParty = 'Customer - A';
  DateTime? fromDate;
  DateTime? toDate;
  TextEditingController fromDateController = TextEditingController();
  TextEditingController toDateController = TextEditingController();

  @override
  void initState() {
    super.initState();
    filteredData = _sampleData;
  }

  void _filterData() {
    setState(() {
      filteredData = _sampleData.where((party) {
        if (party['partyName'] != selectedParty) return false;

        final filteredBills = party['outstandingBills'].where((bill) {
          final DateTime invoiceDate = DateTime.parse(bill['invoiceDate']);
          fromDate = DateTime.parse(fromDateController.text);
          toDate = DateTime.parse(toDateController.text);
          final matchFromDate =
              fromDate == null || !invoiceDate.isBefore(fromDate!);
          final matchToDate = toDate == null || !invoiceDate.isAfter(toDate!);

          return matchFromDate && matchToDate;
        }).toList();

        if (filteredBills.isNotEmpty) {
          party['outstandingBills'] = filteredBills;
          return true;
        }
        return false;
      }).toList();

      showFilterForm = false; // Hide the filter form
    });
  }

  void _selectDate(
      BuildContext context, TextEditingController controller) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      setState(() {
        controller.text =
            '${picked.toLocal()}'.split(' ')[0]; // Format the date
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Outstanding Bills'),
      ),
      body: showFilterForm
          ? Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                elevation: 4,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      DropdownButtonFormField<String>(
                        value: selectedParty,
                        items: _sampleData
                            .map((party) => DropdownMenuItem<String>(
                                  value: party[
                                      'partyName'], // Ensure this key exists in every map
                                  child: Text(party['partyName']),
                                ))
                            .toList(),
                        onChanged: (value) {
                          setState(() {
                            selectedParty = value!;
                          });
                        },
                        decoration: InputDecoration(
                          labelText: 'Party',
                          border: OutlineInputBorder(),
                        ),
                      ),
                      SizedBox(height: 8),
                      TextFormField(
                        controller: fromDateController,
                        readOnly: true,
                        decoration: InputDecoration(
                          labelText: 'From Date',
                          border: OutlineInputBorder(),
                          suffixIcon: Icon(Icons.calendar_today),
                        ),
                        onTap: () => _selectDate(context, fromDateController),
                      ),
                      SizedBox(height: 8),
                      TextFormField(
                        controller: toDateController,
                        readOnly: true,
                        decoration: InputDecoration(
                          labelText: 'To Date',
                          border: OutlineInputBorder(),
                          suffixIcon: Icon(Icons.calendar_today),
                        ),
                        onTap: () => _selectDate(context, toDateController),
                      ),
                      SizedBox(height: 8),
                      ElevatedButton(
                        onPressed: _filterData,
                        child: Text(
                          'Apply Filter',
                          style: TextStyle(
                            color: Colors.white, // Text color
                            fontSize: 16,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          // Background color of the button
                          backgroundColor: Colors.blue,
                          // Button padding
                          padding: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 15),
                          // Rounded corners
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          : Column(
              children: [
                Row(children: [
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        showFilterForm = true;
                      });
                    },
                    child: Text(
                      'Modify Filter',
                      style: TextStyle(
                        color: Colors.white, // Text color
                        fontSize: 16,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      // Background color of the button
                      backgroundColor: Colors.blue,
                      // Button padding
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                      // Rounded corners
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // Export File Api Call
                    },
                    child: Text(
                      'Export Data',
                      style: TextStyle(
                        color: Colors.white, // Text color
                        fontSize: 16,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      // Background color of the button
                      backgroundColor: Colors.blue,
                      // Button padding
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                      // Rounded corners
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                ]),
                Expanded(
                  child: ListView.builder(
                    itemCount: filteredData.length,
                    itemBuilder: (context, index) {
                      final party = filteredData[index];
                      final bills = party['outstandingBills'];

                      return Card(
                        elevation: 4,
                        margin: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 4),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                party['partyName'],
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                'Total Outstanding: ₹${party['outstandingAmount'].toStringAsFixed(2)}',
                                style:
                                    TextStyle(fontSize: 14, color: Colors.red),
                              ),
                              Divider(),
                              ...bills.map<Widget>((bill) {
                                return Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 4.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                              'Invoice No: ${bill['invoiceNo']}'),
                                          Text(
                                              'Invoice Date: ${bill['invoiceDate']}'),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                              'Bill Amount: ₹${bill['billAmount']}'),
                                          Text(
                                              'Outstanding: ₹${bill['outstandingAmount']}'),
                                        ],
                                      ),
                                      Align(
                                        alignment: Alignment.centerRight,
                                        child: TextButton(
                                          onPressed: () {
                                            // Navigate to detailed view
                                            _showBillDetails(context, bill);
                                          },
                                          child: Text('View Details'),
                                        ),
                                      ),
                                      Divider(),
                                    ],
                                  ),
                                );
                              }).toList(),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
    );
  }

  void _showBillDetails(BuildContext context, Map<String, dynamic> bill) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Bill Details'),
        content: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Invoice No: ${bill['invoiceNo']}'),
              Text('Invoice Date: ${bill['invoiceDate']}'),
              Text('Booking No: ${bill['bookingNo']}'),
              Text('Booking Date: ${bill['bookingDate']}'),
              Text('HBL No: ${bill['hblNo']}'),
              Text('Job No: ${bill['jobNo']}'),
              Text('MBL No: ${bill['mblNo']}'),
              Text('Bill Amount: ₹${bill['billAmount'].toStringAsFixed(2)}'),
              Text('Due Date: ${bill['dueDate']}'),
              Text('Overdue Days: ${bill['overDueDays']}'),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Close'),
          ),
        ],
      ),
    );
  }
}
