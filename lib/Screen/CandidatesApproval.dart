import 'package:flutter/material.dart';

class CandidatesApproval extends StatefulWidget {
  const CandidatesApproval({Key? key}) : super(key: key);

  @override
  State<CandidatesApproval> createState() => _CandidatesApprovalState();
}

class _CandidatesApprovalState extends State<CandidatesApproval> {
  // A simple data model for a candidate. In a real app, this would likely come from a database.
  List<Map<String, String>> candidates = [
    {'name': 'Aisha Juma', 'party': 'Unity for Progress'},
    {'name': 'Kwame Nkosi', 'party': 'Community Voice'},
    {'name': 'Zola Mfana', 'party': 'Future Forward'},
    {'name': 'Palesa Dube', 'party': 'Independent'},
    {'name': 'Thabo Mbeki', 'party': 'African Unity Party'},
  ];

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
          'Candidate Approval',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Review and Approve Candidates',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 20),
              // Use a ListView.builder for performance with a long list of candidates
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: candidates.length,
                itemBuilder: (context, index) {
                  final candidate = candidates[index];
                  return _buildCandidateCard(
                    name: candidate['name']!,
                    party: candidate['party']!,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  // A helper function to build each candidate approval card
  Widget _buildCandidateCard({
    required String name,
    required String party,
  }) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      margin: const EdgeInsets.only(bottom: 16.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                // Placeholder for candidate profile picture
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
                      name,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      party,
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Row(
              children: [
                // Approve button
                IconButton(
                  icon: const Icon(Icons.check_circle_outline, color: Colors.green, size: 30),
                  onPressed: () {
                    // TODO: Implement approve logic
                    // This could change the candidate's status or remove them from the unapproved list.
                    print('Approved $name');
                  },
                ),
                const SizedBox(width: 8),
                // Reject button
                IconButton(
                  icon: const Icon(Icons.cancel_outlined, color: Colors.red, size: 30),
                  onPressed: () {
                    // TODO: Implement reject logic
                    // This could remove the candidate from the list or mark them as rejected.
                    print('Rejected $name');
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
