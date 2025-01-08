// ignore_for_file: unused_field

import 'package:flutter/material.dart';

class SaleRegisterPage extends StatefulWidget {
  @override
  _SaleRegisterPageState createState() => _SaleRegisterPageState();
}

class _SaleRegisterPageState extends State<SaleRegisterPage> {
  // Dropdown options
  final List<String> _billTypes = ['Receivable', 'Payable'];
  final List<String> _customers = ['Customer A', 'Customer B', 'Customer C'];
  final List<String> _actionFilters = [
    'All',
    'Job Number',
    'Booking Number',
    'HBL Number',
    'MBL Number',
    'Bill Number',
    'Container Number'
  ];

  // Form field values
  String? _selectedBillType;
  String? _selectedParty;
  DateTime? _fromDate;
  DateTime? _toDate;
  String? _selectedActionFilter;
  String? _actionFilterValue = '';

  // Filtered Data Placeholder
  List<Map<String, dynamic>> _filteredData = [];

  // Dummy Table Data
  final List<Map<String, dynamic>> _data = [
    {
      "Date": "2025-01-01",
      "BILL NO": "B001",
      "Job No": "J001",
      "Party Name": "Customer A",
      "GSTIN": "22AAAAA0000A1Z5",
      "State Name": "State A",
      "Marketing Person": "Person A",
      "Bill Type": "Receivable",
      "Bill Currency": "USD",
      "Exchange Rate": 74.5,
      "Bill Amt.(FC)": 1000,
      "Bill Amt.(INR)": 74500,
      "Taxable Amt.(INR)": 70000,
      "SGST Amt.(INR)": 1250,
      "CGST Amt.(INR)": 1250,
      "IGST Amt.(INR)": 0
    }
  ];

  // Filter Data Logic
  void _applyFilter() {
    setState(() {
      _filteredData = _data; // Implement filter logic here
    });
  }

  // Date Picker Helper
  Future<void> _pickDate(BuildContext context, bool isFromDate) async {
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (pickedDate != null) {
      setState(() {
        if (isFromDate) {
          _fromDate = pickedDate;
        } else {
          _toDate = pickedDate;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Sale Register')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Wrap(
              runSpacing: 16.0,
              spacing: 16.0,
              children: [
                DropdownButtonFormField<String>(
                  value: _selectedBillType,
                  items: _billTypes
                      .map((type) =>
                          DropdownMenuItem(value: type, child: Text(type)))
                      .toList(),
                  onChanged: (value) =>
                      setState(() => _selectedBillType = value),
                  decoration: InputDecoration(labelText: 'Bill Type'),
                ),
                DropdownButtonFormField<String>(
                  value: _selectedParty,
                  items: _customers
                      .map((customer) => DropdownMenuItem(
                          value: customer, child: Text(customer)))
                      .toList(),
                  onChanged: (value) => setState(() => _selectedParty = value),
                  decoration: InputDecoration(labelText: 'Party'),
                ),
                TextFormField(
                  readOnly: true,
                  onTap: () => _pickDate(context, true),
                  controller: TextEditingController(
                      text: _fromDate != null
                          ? _fromDate!.toIso8601String().split('T')[0]
                          : ''),
                  decoration: InputDecoration(labelText: 'From Date'),
                ),
                TextFormField(
                  readOnly: true,
                  onTap: () => _pickDate(context, false),
                  controller: TextEditingController(
                      text: _toDate != null
                          ? _toDate!.toIso8601String().split('T')[0]
                          : ''),
                  decoration: InputDecoration(labelText: 'To Date'),
                ),
                DropdownButtonFormField<String>(
                  value: _selectedActionFilter,
                  items: _actionFilters
                      .map((filter) =>
                          DropdownMenuItem(value: filter, child: Text(filter)))
                      .toList(),
                  onChanged: (value) =>
                      setState(() => _selectedActionFilter = value),
                  decoration: InputDecoration(labelText: 'Action Filter'),
                ),
                TextFormField(
                  onChanged: (value) =>
                      setState(() => _actionFilterValue = value),
                  decoration: InputDecoration(labelText: 'Action Filter Value'),
                ),
              ],
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _applyFilter,
              child: Text('Apply Filter'),
            ),
            SizedBox(height: 16.0),
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: DataTable(
                  columns: _data.first.keys
                      .map((key) => DataColumn(label: Text(key)))
                      .toList(),
                  rows: _filteredData.map((row) {
                    return DataRow(
                      cells: row.values
                          .map((value) => DataCell(Text(value.toString())))
                          .toList(),
                    );
                  }).toList(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
