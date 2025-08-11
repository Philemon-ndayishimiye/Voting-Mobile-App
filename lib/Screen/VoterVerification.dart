import 'package:flutter/material.dart';

class VoterVerification extends StatefulWidget {
  const VoterVerification({Key? key}) : super(key: key);

  @override
  State<VoterVerification> createState() => _VoterVerificationState();
}

class _VoterVerificationState extends State<VoterVerification> {
  String _currentFilter = 'All';

  // A simple data model for a voter record
  List<Map<String, String>> voterRecords = [
    {'name': 'Aisha Juma', 'id': '123456789', 'phone': '+254712345678', 'status': 'Pending'},
    {'name': 'Kwame Nkosi', 'id': '987654321', 'phone': '+2348012345678', 'status': 'Verified'},
    {'name': 'Nala Mbatha', 'id': '543219876', 'phone': '+27601234567', 'status': 'Rejected'},
    {'name': 'Sankara Diallo', 'id': '112233445', 'phone': '+221771234567', 'status': 'Pending'},
    {'name': 'Zola Mofokeng', 'id': '678901234', 'phone': '+27712345678', 'status': 'Verified'},
    {'name': 'Omar Traoré', 'id': '988765432', 'phone': '+223654321098', 'status': 'Verified'},
  ];

  // A function to filter the voter records based on the selected status
  List<Map<String, String>> _getFilteredVoters() {
    if (_currentFilter == 'All') {
      return voterRecords;
    }
    return voterRecords.where((voter) => voter['status'] == _currentFilter).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          'Voter Verification',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_none, color: Colors.black),
            onPressed: () {
              // TODO: Add notification action
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Container(
              width: 35,
              height: 35,
              decoration: const BoxDecoration(
                color: Colors.red,
                shape: BoxShape.circle,
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Search Bar
              Container(
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const TextField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search, color: Colors.grey),
                    hintText: 'Search by ID, Phone, or Name',
                    hintStyle: TextStyle(color: Colors.grey),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(vertical: 8),
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Filter Tabs
              Row(
                children: [
                  _buildFilterTab('All'),
                  _buildFilterTab('Verified'),
                  _buildFilterTab('Pending'),
                  _buildFilterTab('Rejected'),
                ],
              ),
              const SizedBox(height: 20),

              // Voter Records section
              Text(
                'Voter Records (${_getFilteredVoters().length})',
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 10),

              // List of voter cards
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: _getFilteredVoters().length,
                itemBuilder: (context, index) {
                  final voter = _getFilteredVoters()[index];
                  return _buildVoterCard(voter);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  // A helper function to build the filter tabs
  Widget _buildFilterTab(String title) {
    bool isSelected = _currentFilter == title;
    return GestureDetector(
      onTap: () {
        setState(() {
          _currentFilter = title;
        });
      },
      child: Container(
        margin: const EdgeInsets.only(right: 10),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? Colors.orange : Colors.grey[200],
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          title,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  // A helper function to build each voter card
  Widget _buildVoterCard(Map<String, String> voter) {
    Color statusColor = Colors.grey[200]!;
    Color statusTextColor = Colors.black;
    Widget? actionWidget;

    switch (voter['status']) {
      case 'Verified':
        statusColor = Colors.green[100]!;
        statusTextColor = Colors.green[800]!;
        break;
      case 'Pending':
        statusColor = Colors.orange[100]!;
        statusTextColor = Colors.orange[800]!;
        actionWidget = Row(
          children: [
            IconButton(
              icon: const Icon(Icons.check, color: Colors.green),
              onPressed: () {
                // TODO: Implement verify logic
                print('Verified ${voter['name']}');
              },
            ),
            IconButton(
              icon: const Icon(Icons.close, color: Colors.red),
              onPressed: () {
                // TODO: Implement reject logic
                print('Rejected ${voter['name']}');
              },
            ),
          ],
        );
        break;
      case 'Rejected':
        statusColor = Colors.red[100]!;
        statusTextColor = Colors.red[800]!;
        break;
    }

    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      margin: const EdgeInsets.only(bottom: 16.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(Icons.person, color: Colors.grey),
                    ),
                    const SizedBox(width: 16),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          voter['name']!,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'National ID: ${voter['id']}',
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: statusColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    voter['status']!,
                    style: TextStyle(
                      color: statusTextColor,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Phone: ${voter['phone']}',
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                ),
                if (actionWidget != null) actionWidget,
              ],
            ),
          ],
        ),
      ),
    );
  }
}
