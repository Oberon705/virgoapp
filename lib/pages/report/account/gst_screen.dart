import 'package:flutter/material.dart';

class GSTReportPage extends StatefulWidget {
  @override
  _GSTReportPageState createState() => _GSTReportPageState();
}

class _GSTReportPageState extends State<GSTReportPage> {
  // Sample GST data
  final Map<String, List<Map<String, dynamic>>> _gstData = {
    'All': [
      {
        "Date": "2025-01-06",
        "Bill No": "INV001",
        "Party Name": "ABC Pvt Ltd",
        "GST No.": "27AAAAA1234A1Z5",
        "State": "Maharashtra",
        "Job No.": "JOB001",
        "Bill Amt(BOS)": 50000,
        "Bill Amt(REG)": 45000,
        "Taxable Amt 5%": 10000,
        "CGST 2.5%": 250,
        "SGST 2.5%": 250,
        "IGST 5%": 500,
        "Taxable Amt 12%": 12000,
        "CGST 6%": 720,
        "SGST 6%": 720,
        "IGST 12%": 1440,
        "Taxable Amt 18%": 15000,
        "CGST 9%": 1350,
        "SGST 9%": 1350,
        "IGST 18%": 2700,
        "Total GST": 8400
      },
      {
        "Date": "2025-01-07",
        "Bill No": "INV002",
        "Party Name": "XYZ Enterprises",
        "GST No.": "27BBBBB5678B1Z6",
        "State": "Delhi",
        "Job No.": "JOB002",
        "Bill Amt(BOS)": 75000,
        "Bill Amt(REG)": 72000,
        "Taxable Amt 5%": 15000,
        "CGST 2.5%": 375,
        "SGST 2.5%": 375,
        "IGST 5%": 750,
        "Taxable Amt 12%": 18000,
        "CGST 6%": 1080,
        "SGST 6%": 1080,
        "IGST 12%": 2160,
        "Taxable Amt 18%": 25000,
        "CGST 9%": 2250,
        "SGST 9%": 2250,
        "IGST 18%": 4500,
        "Total GST": 11400
      },
      {
        "Date": "2025-01-01",
        "Bill No": "INV001",
        "Party Name": "ABC Pvt Ltd",
        "GST No.": "27AAAAA1234A1Z5",
        "State": "Maharashtra",
        "Job No.": "JOB001",
        "IGST 5%": 500,
        "IGST 12%": 1440,
        "IGST 18%": 2700,
        "Total IGST": 4640
      },
      {
        "Date": "2025-01-02",
        "Bill No": "INV002",
        "Party Name": "XYZ Enterprises",
        "GST No.": "27BBBBB5678B1Z6",
        "State": "Delhi",
        "Job No.": "JOB002",
        "IGST 5%": 750,
        "IGST 12%": 2160,
        "IGST 18%": 4500,
        "Total IGST": 7410
      },
      {
        "Date": "2025-01-03",
        "Bill No": "INV003",
        "Party Name": "Global Traders",
        "GST No.": "27CCCCC2345C2Z7",
        "State": "Gujarat",
        "Job No.": "JOB003",
        "IGST 5%": 600,
        "IGST 12%": 1800,
        "IGST 18%": 3600,
        "Total IGST": 6000
      },
      {
        "Date": "2025-01-04",
        "Bill No": "INV004",
        "Party Name": "Tech Innovators",
        "GST No.": "27DDDDD7890D4Z9",
        "State": "Tamil Nadu",
        "Job No.": "JOB004",
        "IGST 5%": 650,
        "IGST 12%": 1950,
        "IGST 18%": 3900,
        "Total IGST": 6500
      },
      {
        "Date": "2025-01-05",
        "Bill No": "INV005",
        "Party Name": "A1 Solutions",
        "GST No.": "27EEEEE3456E5Z8",
        "State": "Karnataka",
        "Job No.": "JOB005",
        "IGST 5%": 700,
        "IGST 12%": 2100,
        "IGST 18%": 4200,
        "Total IGST": 7000
      },
      {
        "Date": "2025-01-06",
        "Bill No": "INV006",
        "Party Name": "Creative Solutions",
        "GST No.": "27FFFFF5678F9Z4",
        "State": "Madhya Pradesh",
        "Job No.": "JOB006",
        "IGST 5%": 550,
        "IGST 12%": 1650,
        "IGST 18%": 3300,
        "Total IGST": 5500
      },
      {
        "Date": "2025-01-07",
        "Bill No": "INV007",
        "Party Name": "Prime Services",
        "GST No.": "27GGGGG1234G1Z5",
        "State": "Uttar Pradesh",
        "Job No.": "JOB007",
        "IGST 5%": 800,
        "IGST 12%": 2400,
        "IGST 18%": 4800,
        "Total IGST": 8000
      },
      {
        "Date": "2025-01-08",
        "Bill No": "INV008",
        "Party Name": "Pioneer Ltd",
        "GST No.": "27HHHHH9876H2Z3",
        "State": "West Bengal",
        "Job No.": "JOB008",
        "IGST 5%": 650,
        "IGST 12%": 1950,
        "IGST 18%": 3900,
        "Total IGST": 6500
      },
      {
        "Date": "2025-01-09",
        "Bill No": "INV009",
        "Party Name": "Elite Ventures",
        "GST No.": "27IIIII6789I0Z6",
        "State": "Andhra Pradesh",
        "Job No.": "JOB009",
        "IGST 5%": 600,
        "IGST 12%": 1800,
        "IGST 18%": 3600,
        "Total IGST": 6000
      },
      {
        "Date": "2025-01-10",
        "Bill No": "INV010",
        "Party Name": "Max Enterprises",
        "GST No.": "27JJJJJ2345J3Z7",
        "State": "Kerala",
        "Job No.": "JOB010",
        "IGST 5%": 750,
        "IGST 12%": 2160,
        "IGST 18%": 4500,
        "Total IGST": 7410
      },
      {
        "Date": "2025-01-01",
        "Bill No": "INV001",
        "Party Name": "ABC Pvt Ltd",
        "GST No.": "27AAAAA1234A1Z5",
        "State": "Maharashtra",
        "Job No.": "JOB001",
        "CGST 2.5%": 250,
        "SGST 2.5%": 250,
        "Total CGST/SGST": 500
      },
      {
        "Date": "2025-01-02",
        "Bill No": "INV002",
        "Party Name": "XYZ Enterprises",
        "GST No.": "27BBBBB5678B1Z6",
        "State": "Delhi",
        "Job No.": "JOB002",
        "CGST 2.5%": 375,
        "SGST 2.5%": 375,
        "Total CGST/SGST": 750
      },
      {
        "Date": "2025-01-03",
        "Bill No": "INV003",
        "Party Name": "Global Traders",
        "GST No.": "27CCCCC2345C2Z7",
        "State": "Gujarat",
        "Job No.": "JOB003",
        "CGST 2.5%": 300,
        "SGST 2.5%": 300,
        "Total CGST/SGST": 600
      },
      {
        "Date": "2025-01-04",
        "Bill No": "INV004",
        "Party Name": "Tech Innovators",
        "GST No.": "27DDDDD7890D4Z9",
        "State": "Tamil Nadu",
        "Job No.": "JOB004",
        "CGST 2.5%": 325,
        "SGST 2.5%": 325,
        "Total CGST/SGST": 650
      },
      {
        "Date": "2025-01-05",
        "Bill No": "INV005",
        "Party Name": "A1 Solutions",
        "GST No.": "27EEEEE3456E5Z8",
        "State": "Karnataka",
        "Job No.": "JOB005",
        "CGST 2.5%": 350,
        "SGST 2.5%": 350,
        "Total CGST/SGST": 700
      },
      {
        "Date": "2025-01-06",
        "Bill No": "INV006",
        "Party Name": "Creative Solutions",
        "GST No.": "27FFFFF5678F9Z4",
        "State": "Madhya Pradesh",
        "Job No.": "JOB006",
        "CGST 2.5%": 275,
        "SGST 2.5%": 275,
        "Total CGST/SGST": 550
      },
      {
        "Date": "2025-01-07",
        "Bill No": "INV007",
        "Party Name": "Prime Services",
        "GST No.": "27GGGGG1234G1Z5",
        "State": "Uttar Pradesh",
        "Job No.": "JOB007",
        "CGST 2.5%": 400,
        "SGST 2.5%": 400,
        "Total CGST/SGST": 800
      },
      {
        "Date": "2025-01-08",
        "Bill No": "INV008",
        "Party Name": "Pioneer Ltd",
        "GST No.": "27HHHHH9876H2Z3",
        "State": "West Bengal",
        "Job No.": "JOB008",
        "CGST 2.5%": 325,
        "SGST 2.5%": 325,
        "Total CGST/SGST": 650
      },
      {
        "Date": "2025-01-09",
        "Bill No": "INV009",
        "Party Name": "Elite Ventures",
        "GST No.": "27IIIII6789I0Z6",
        "State": "Andhra Pradesh",
        "Job No.": "JOB009",
        "CGST 2.5%": 300,
        "SGST 2.5%": 300,
        "Total CGST/SGST": 600
      },
      {
        "Date": "2025-01-10",
        "Bill No": "INV010",
        "Party Name": "Max Enterprises",
        "GST No.": "27JJJJJ2345J3Z7",
        "State": "Kerala",
        "Job No.": "JOB010",
        "CGST 2.5%": 375,
        "SGST 2.5%": 375,
        "Total CGST/SGST": 750
      }
    ],
    'GST - Invoice Within State': [
      {
        "Date": "2025-01-01",
        "Bill No": "INV001",
        "Party Name": "ABC Pvt Ltd",
        "GST No.": "27AAAAA1234A1Z5",
        "State": "Maharashtra",
        "Job No.": "JOB001",
        "CGST 2.5%": 250,
        "SGST 2.5%": 250,
        "Total CGST/SGST": 500
      },
      {
        "Date": "2025-01-02",
        "Bill No": "INV002",
        "Party Name": "XYZ Enterprises",
        "GST No.": "27BBBBB5678B1Z6",
        "State": "Delhi",
        "Job No.": "JOB002",
        "CGST 2.5%": 375,
        "SGST 2.5%": 375,
        "Total CGST/SGST": 750
      },
      {
        "Date": "2025-01-03",
        "Bill No": "INV003",
        "Party Name": "Global Traders",
        "GST No.": "27CCCCC2345C2Z7",
        "State": "Gujarat",
        "Job No.": "JOB003",
        "CGST 2.5%": 300,
        "SGST 2.5%": 300,
        "Total CGST/SGST": 600
      },
      {
        "Date": "2025-01-04",
        "Bill No": "INV004",
        "Party Name": "Tech Innovators",
        "GST No.": "27DDDDD7890D4Z9",
        "State": "Tamil Nadu",
        "Job No.": "JOB004",
        "CGST 2.5%": 325,
        "SGST 2.5%": 325,
        "Total CGST/SGST": 650
      },
      {
        "Date": "2025-01-05",
        "Bill No": "INV005",
        "Party Name": "A1 Solutions",
        "GST No.": "27EEEEE3456E5Z8",
        "State": "Karnataka",
        "Job No.": "JOB005",
        "CGST 2.5%": 350,
        "SGST 2.5%": 350,
        "Total CGST/SGST": 700
      },
      {
        "Date": "2025-01-06",
        "Bill No": "INV006",
        "Party Name": "Creative Solutions",
        "GST No.": "27FFFFF5678F9Z4",
        "State": "Madhya Pradesh",
        "Job No.": "JOB006",
        "CGST 2.5%": 275,
        "SGST 2.5%": 275,
        "Total CGST/SGST": 550
      },
      {
        "Date": "2025-01-07",
        "Bill No": "INV007",
        "Party Name": "Prime Services",
        "GST No.": "27GGGGG1234G1Z5",
        "State": "Uttar Pradesh",
        "Job No.": "JOB007",
        "CGST 2.5%": 400,
        "SGST 2.5%": 400,
        "Total CGST/SGST": 800
      },
      {
        "Date": "2025-01-08",
        "Bill No": "INV008",
        "Party Name": "Pioneer Ltd",
        "GST No.": "27HHHHH9876H2Z3",
        "State": "West Bengal",
        "Job No.": "JOB008",
        "CGST 2.5%": 325,
        "SGST 2.5%": 325,
        "Total CGST/SGST": 650
      },
      {
        "Date": "2025-01-09",
        "Bill No": "INV009",
        "Party Name": "Elite Ventures",
        "GST No.": "27IIIII6789I0Z6",
        "State": "Andhra Pradesh",
        "Job No.": "JOB009",
        "CGST 2.5%": 300,
        "SGST 2.5%": 300,
        "Total CGST/SGST": 600
      },
      {
        "Date": "2025-01-10",
        "Bill No": "INV010",
        "Party Name": "Max Enterprises",
        "GST No.": "27JJJJJ2345J3Z7",
        "State": "Kerala",
        "Job No.": "JOB010",
        "CGST 2.5%": 375,
        "SGST 2.5%": 375,
        "Total CGST/SGST": 750
      }
    ],
    'GST - Invoice Other State': [
      {
        "Date": "2025-01-01",
        "Bill No": "INV001",
        "Party Name": "ABC Pvt Ltd",
        "GST No.": "27AAAAA1234A1Z5",
        "State": "Maharashtra",
        "Job No.": "JOB001",
        "IGST 5%": 500,
        "IGST 12%": 1440,
        "IGST 18%": 2700,
        "Total IGST": 4640
      },
      {
        "Date": "2025-01-02",
        "Bill No": "INV002",
        "Party Name": "XYZ Enterprises",
        "GST No.": "27BBBBB5678B1Z6",
        "State": "Delhi",
        "Job No.": "JOB002",
        "IGST 5%": 750,
        "IGST 12%": 2160,
        "IGST 18%": 4500,
        "Total IGST": 7410
      },
      {
        "Date": "2025-01-03",
        "Bill No": "INV003",
        "Party Name": "Global Traders",
        "GST No.": "27CCCCC2345C2Z7",
        "State": "Gujarat",
        "Job No.": "JOB003",
        "IGST 5%": 600,
        "IGST 12%": 1800,
        "IGST 18%": 3600,
        "Total IGST": 6000
      },
      {
        "Date": "2025-01-04",
        "Bill No": "INV004",
        "Party Name": "Tech Innovators",
        "GST No.": "27DDDDD7890D4Z9",
        "State": "Tamil Nadu",
        "Job No.": "JOB004",
        "IGST 5%": 650,
        "IGST 12%": 1950,
        "IGST 18%": 3900,
        "Total IGST": 6500
      },
      {
        "Date": "2025-01-05",
        "Bill No": "INV005",
        "Party Name": "A1 Solutions",
        "GST No.": "27EEEEE3456E5Z8",
        "State": "Karnataka",
        "Job No.": "JOB005",
        "IGST 5%": 700,
        "IGST 12%": 2100,
        "IGST 18%": 4200,
        "Total IGST": 7000
      },
      {
        "Date": "2025-01-06",
        "Bill No": "INV006",
        "Party Name": "Creative Solutions",
        "GST No.": "27FFFFF5678F9Z4",
        "State": "Madhya Pradesh",
        "Job No.": "JOB006",
        "IGST 5%": 550,
        "IGST 12%": 1650,
        "IGST 18%": 3300,
        "Total IGST": 5500
      },
      {
        "Date": "2025-01-07",
        "Bill No": "INV007",
        "Party Name": "Prime Services",
        "GST No.": "27GGGGG1234G1Z5",
        "State": "Uttar Pradesh",
        "Job No.": "JOB007",
        "IGST 5%": 800,
        "IGST 12%": 2400,
        "IGST 18%": 4800,
        "Total IGST": 8000
      },
      {
        "Date": "2025-01-08",
        "Bill No": "INV008",
        "Party Name": "Pioneer Ltd",
        "GST No.": "27HHHHH9876H2Z3",
        "State": "West Bengal",
        "Job No.": "JOB008",
        "IGST 5%": 650,
        "IGST 12%": 1950,
        "IGST 18%": 3900,
        "Total IGST": 6500
      },
      {
        "Date": "2025-01-09",
        "Bill No": "INV009",
        "Party Name": "Elite Ventures",
        "GST No.": "27IIIII6789I0Z6",
        "State": "Andhra Pradesh",
        "Job No.": "JOB009",
        "IGST 5%": 600,
        "IGST 12%": 1800,
        "IGST 18%": 3600,
        "Total IGST": 6000
      },
      {
        "Date": "2025-01-10",
        "Bill No": "INV010",
        "Party Name": "Max Enterprises",
        "GST No.": "27JJJJJ2345J3Z7",
        "State": "Kerala",
        "Job No.": "JOB010",
        "IGST 5%": 750,
        "IGST 12%": 2160,
        "IGST 18%": 4500,
        "Total IGST": 7410
      }
    ],
  };

  String? _selectedGSTCategory;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GST Report'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Dropdown for GST category selection
            DropdownButtonFormField<String>(
              value: _selectedGSTCategory,
              decoration: InputDecoration(
                labelText: 'Select GST Category',
                border: OutlineInputBorder(),
              ),
              items: _gstData.keys
                  .map((category) => DropdownMenuItem(
                        value: category,
                        child: Text(category),
                      ))
                  .toList(),
              onChanged: (value) {
                setState(() {
                  _selectedGSTCategory = value;
                });
              },
            ),
            SizedBox(height: 16),
            // Display selected GST data in a table
            Expanded(
              child: _selectedGSTCategory == null
                  ? Center(
                      child: Text(
                          'Please select a GST category to view the report'),
                    )
                  : _gstData[_selectedGSTCategory]!.isEmpty
                      ? Center(
                          child: Text('No data available for this category'))
                      : SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: DataTable(
                            columns: [
                              DataColumn(label: Text('Bill Date')),
                              DataColumn(label: Text('Bill No')),
                              DataColumn(label: Text('Party Name')),
                              DataColumn(label: Text('GST No.')),
                              DataColumn(label: Text('State')),
                              DataColumn(label: Text('Job No.')),
                              DataColumn(label: Text('Bill Amt(BOS)')),
                              DataColumn(label: Text('Bill Amt(REG)')),
                              DataColumn(label: Text('Taxable Amt 5%')),
                              DataColumn(label: Text('CGST 2.5%')),
                              DataColumn(label: Text('SGST 2.5%')),
                              DataColumn(label: Text('IGST 5%')),
                              DataColumn(label: Text('Taxable Amt 12%')),
                              DataColumn(label: Text('CGST 6%')),
                              DataColumn(label: Text('SGST 6%')),
                              DataColumn(label: Text('IGST 12%')),
                              DataColumn(label: Text('Taxable Amt 18%')),
                              DataColumn(label: Text('CGST 9%')),
                              DataColumn(label: Text('SGST 9%')),
                              DataColumn(label: Text('IGST 18%')),
                              DataColumn(label: Text('Total GST')),
                            ],
                            rows: _gstData[_selectedGSTCategory]!
                                .map((item) => DataRow(cells: [
                                      DataCell(Text(item['Date'])),
                                      DataCell(Text(item['Bill No'])),
                                      DataCell(Text(item['Party Name'])),
                                      DataCell(Text(item['GST No.'])),
                                      DataCell(Text(item['State'])),
                                      DataCell(Text(item['Job No.'])),
                                      DataCell(Text(
                                          item['Bill Amt(BOS)'].toString())),
                                      DataCell(Text(
                                          item['Bill Amt(REG)'].toString())),
                                      DataCell(Text(
                                          item['Taxable Amt 5%'].toString())),
                                      DataCell(
                                          Text(item['CGST 2.5%'].toString())),
                                      DataCell(
                                          Text(item['SGST 2.5%'].toString())),
                                      DataCell(
                                          Text(item['IGST 5%'].toString())),
                                      DataCell(Text(
                                          item['Taxable Amt 12%'].toString())),
                                      DataCell(
                                          Text(item['CGST 6%'].toString())),
                                      DataCell(
                                          Text(item['SGST 6%'].toString())),
                                      DataCell(
                                          Text(item['IGST 12%'].toString())),
                                      DataCell(Text(
                                          item['Taxable Amt 18%'].toString())),
                                      DataCell(
                                          Text(item['CGST 9%'].toString())),
                                      DataCell(
                                          Text(item['SGST 9%'].toString())),
                                      DataCell(
                                          Text(item['IGST 18%'].toString())),
                                      DataCell(
                                          Text(item['Total GST'].toString())),
                                    ]))
                                .toList(),
                          ),
                        ),
            ),
          ],
        ),
      ),
    );
  }
}
