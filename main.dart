import 'package:flutter/material.dart';

void main() {
  runApp(const HealthTrackAIApp());
}

class HealthTrackAIApp extends StatelessWidget {
  const HealthTrackAIApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Health-Track AI',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  static final List<Widget> _widgetOptions = <Widget>[
    SymptomTrackingScreen(),
    DiagnosisScreen(),
    const TreatmentScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Health-Track AI'),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.track_changes),
            label: 'Symptom Tracking',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.medical_services),
            label: 'Diagnosis',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.healing),
            label: 'Treatment',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     // I just added the button for later use. It is just there for no reason now!
      //   },
      //   child: const Icon(Icons.add),
      // ),
    );
  }
}

class SymptomTrackingScreen extends StatelessWidget {
  SymptomTrackingScreen({super.key});
  // For the mean time this will be the list of symptoms haha
  final List<String> symptoms = [
    'Headache',
    'Fever',
    'Cough',
    'Sore Throat',
    'Fatigue'
  ];

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Track your symptoms here:',
            style: TextStyle(fontSize: 24),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () {
                // We will later Implement functionality to allow users to add symptoms
              },
              child: const Text('Add Symptom'),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: symptoms.length, // Use the actual symptom list length
              itemBuilder: (context, index) {
                return ListTile(
                  leading: const Icon(Icons.report_problem),
                  title: Text(symptoms[index]), // Display actual symptoms
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class DiagnosisScreen extends StatelessWidget {
  DiagnosisScreen({super.key});
  // Placeholder for diagnosis data
  final List<String> diagnoses = [
    'Diagnosis 1',
    'Diagnosis 2',
    'Diagnosis 3',
    'Diagnosis 4',
    'Diagnosis 5',
    'Diagnosis 6'
  ]; // Replace with actual diagnosis data from AI model

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      children: List.generate(diagnoses.length, (index) {
        return Container(
          margin: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Center(
            child: Text(
              diagnoses[index], // Display actual diagnosis
              style: const TextStyle(color: Colors.white),
            ),
          ),
        );
      }),
    );
  }
}

class TreatmentScreen extends StatelessWidget {
  const TreatmentScreen({super.key});
  // Placeholder for treatment suggestions
  final String treatmentPlanUrl =
      'https://blog.ipleaders.in/wp-content/uploads/2020/01/Health-Insurance-696x696.jpg';

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Treatment Suggestions',
            style: TextStyle(fontSize: 24),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Align(
              alignment: Alignment.center,
              child: Chip(
                avatar: Icon(Icons.healing),
                label: Text('Follow Treatment Plan'),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(16.0),
            child: Image.network(
              treatmentPlanUrl,
              height: 150,
              width: 150,
            ),
          ),
          ConstrainedBox(
            constraints: BoxConstraints.tight(Size(200, 50)),
            child: ElevatedButton(
              onPressed: () {
                // Handle treatment suggestion
                // Implement functionality to provide a treatment plan
              },
              child: const Text('Get Treatment Plan'),
            ),
          ),
        ],
      ),
    );
  }
}
