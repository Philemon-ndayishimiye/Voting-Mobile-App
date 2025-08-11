import 'package:flutter/material.dart';
import 'package:voting/Screen/Candidate.dart'; // Import the Candidates page

// This is the main widget for the Selection screen.
class Selection extends StatelessWidget {
  const Selection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'AfriVote Home',
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
          // Placeholder for the profile picture
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Container(
              width: 35,
              height: 35,
              decoration: const BoxDecoration(
                color: Colors.grey,
                shape: BoxShape.circle,
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
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
                    hintText: 'Search elections...',
                    hintStyle: TextStyle(color: Colors.grey),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(vertical: 8),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              // Section title
              const Text(
                'Your Elections',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 20),
              // Election cards grid
              GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 16.0,
                mainAxisSpacing: 16.0,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(), // Disables scrolling
                children: [
                  _buildElectionCard(
                    context: context,
                    title: 'Village Council Election',
                    status: 'Ongoing',
                    statusColor: Colors.pink[50],
                    statusTextColor: Colors.pink[800],
                    dateLabel: 'Ends:',
                    date: '2024-10-26',
                    buttonText: 'Vote Now',
                    buttonColor: Colors.black,
                  ),
                  _buildElectionCard(
                    context: context,
                    title: 'Regional Assembly Poll',
                    status: 'Upcoming',
                    statusColor: Colors.red[50],
                    statusTextColor: Colors.red[800],
                    dateLabel: 'Starts:',
                    date: '2024-11-15',
                    buttonText: 'View Details',
                    buttonColor: Colors.orange,
                  ),
                  _buildElectionCard(
                    context: context,
                    title: 'District School Board Vote',
                    status: 'Ongoing',
                    statusColor: Colors.pink[50],
                    statusTextColor: Colors.pink[800],
                    dateLabel: 'Ends:',
                    date: '2024-12-01',
                    buttonText: 'Vote Now',
                    buttonColor: Colors.black,
                  ),
                  _buildElectionCard(
                    context: context,
                    title: 'Community Leader Election',
                    status: 'Past',
                    statusColor: Colors.grey[200],
                    statusTextColor: Colors.black,
                    dateLabel: 'Ended:',
                    date: '2024-09-10',
                    buttonText: 'View Details',
                    buttonColor: Colors.orange,
                  ),
                  _buildElectionCard(
                    context: context,
                    title: 'Water Management Referendum',
                    status: 'Upcoming',
                    statusColor: Colors.red[50],
                    statusTextColor: Colors.red[800],
                    dateLabel: 'Starts:',
                    date: '2025-01-20',
                    buttonText: 'View Details',
                    buttonColor: Colors.orange,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  // A helper function to build each election card
  Widget _buildElectionCard({
    required BuildContext context,
    required String title,
    required String status,
    required Color? statusColor,
    required Color? statusTextColor,
    required String dateLabel,
    required String date,
    required String buttonText,
    required Color buttonColor,
  }) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.topRight,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: statusColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  status,
                  style: TextStyle(
                    color: statusTextColor,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              '$dateLabel\n$date',
              style: const TextStyle(
                fontSize: 12,
                color: Colors.grey,
              ),
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // This will now navigate to the Candidates page.
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Candidates(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: buttonColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text(buttonText, style: const TextStyle(color: Colors.white)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
