import 'package:flutter/material.dart';
import 'package:voting_app/src/constants/strings.dart';

class InfoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: <Color>[Colors.indigo, Colors.blue],
            ),
          ),
        ),
        elevation: 0.0,
        title: const Text(Strings.info),
        actions: [
          IconButton(
            color: Colors.white,
            icon: Icon(Icons.how_to_vote_rounded),
            onPressed: () {
              // Add functionality for the IconButton
            },
          ),
          Container(
            decoration: BoxDecoration(shape: BoxShape.circle),
            child: IconButton(
              color: Colors.white,
              icon: Icon(Icons.info_outline_rounded),
              onPressed: () {
                // Show an About dialog when IconButton is pressed
                showAboutDialog(
                  context: context,
                  applicationVersion: '^1.0.0',
                  applicationName: 'ElectChain',
                );
              },
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        // Add this
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              // Center the image vertically
              child: Image.asset(
                'assets/voting.png',
                width: 200, // Increase the width
                height: 200, // Increase the height
                semanticLabel: 'Voting box',
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  StepItem(
                    stepNumber: 1,
                    stepTitle: 'Step 1: Add New Election',
                    stepDescription:
                        'Fill in the details of the new election, such as its name, start date, end date, and any additional information.',
                  ),
                  StepItem(
                    stepNumber: 2,
                    stepTitle: 'Step 2: Set the Time and Information',
                    stepDescription:
                        'Set the start and end time for the election, and provide any additional information or instructions.',
                  ),
                  StepItem(
                    stepNumber: 3,
                    stepTitle: 'Step 3: Change Election Options',
                    stepDescription:
                        'Modify the voting options available to voters, such as candidate names or referendum choices.',
                  ),
                  StepItem(
                    stepNumber: 4,
                    stepTitle: 'Step 4: Review and Publish',
                    stepDescription:
                        'Review all details of the election, make any necessary changes, and publish the election for voters to participate.',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class StepItem extends StatelessWidget {
  final int stepNumber;
  final String stepTitle;
  final String stepDescription;

  const StepItem({
    required this.stepNumber,
    required this.stepTitle,
    required this.stepDescription,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          stepTitle,
          style: TextStyle(
              fontSize: 18, fontWeight: FontWeight.bold, color: Colors.blue),
        ),
        SizedBox(height: 4),
        Text(stepDescription),
        SizedBox(height: 16),
      ],
    );
  }
}
