import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart'; // Import Firestore package
import 'package:health_track_ai/models/record_model.dart';

class AddRecordPage extends StatefulWidget {
  final Record? record;

  const AddRecordPage({this.record, super.key});

  @override
  State<AddRecordPage> createState() => _AddRecordPageState();
}

class _AddRecordPageState extends State<AddRecordPage> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _symptomController = TextEditingController();
  final _startedController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _leadingCauseController = TextEditingController();
  final _moodController = TextEditingController();

  @override
  void initState() {
    print('Record');
    super.initState();
    if (widget.record != null) {
      _titleController.text = widget.record!.title;
      _symptomController.text = widget.record!.symptom;
      _startedController.text = widget.record!.started;
      _descriptionController.text = widget.record!.description;
      _leadingCauseController.text = widget.record!.leadingCause;
      _moodController.text = widget.record!.mood;
    }
  }

  @override
  void dispose() {
    _titleController.dispose();
    _symptomController.dispose();
    _startedController.dispose();
    _descriptionController.dispose();
    _leadingCauseController.dispose();
    _moodController.dispose();
    super.dispose();
  }

  void _submitForm() async {
    print('Submitting form');
    if (_formKey.currentState!.validate()) {
      final newRecord = {
        "title": _titleController.text,
        "symptom": _symptomController.text,
        "started": _startedController.text,
        "description": _descriptionController.text,
        "leadingCause": _leadingCauseController.text,
        "mood": _moodController.text,
      };

      try {
        print('Adding record');
        await FirebaseFirestore.instance.collection('records').add(newRecord);
        print('Record added successfully');
        Navigator.pop(context);
      } catch (e) {
        print('Failed to add record: $e');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to add record: $e')),
        );
      }
    } else {
      print('Form is not valid');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('New Health Record'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: _titleController,
                decoration: InputDecoration(
                  labelText: 'Title',
                  hintText: 'Enter the title',
                  filled: true,
                  fillColor: const Color(0xFFECF1FF),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.blue),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.blue, width: 2),
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a title';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _symptomController,
                decoration: InputDecoration(
                  labelText: 'Symptom',
                  hintText: 'Name the symptoms you have',
                  filled: true,
                  fillColor: const Color(0xFFECF1FF),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.blue),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.blue, width: 2),
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a symptom';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _startedController,
                decoration: InputDecoration(
                  labelText: 'Started',
                  hintText: 'When did it start?',
                  filled: true,
                  fillColor: const Color(0xFFECF1FF),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.blue),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.blue, width: 2),
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter when it started';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _descriptionController,
                decoration: InputDecoration(
                  labelText: 'Description',
                  hintText: 'Describe what you are feeling',
                  filled: true,
                  fillColor: const Color(0xFFECF1FF),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.blue),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.blue, width: 2),
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a description';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _leadingCauseController,
                decoration: InputDecoration(
                  labelText: 'Leading Cause',
                  hintText: 'What do you think caused it?',
                  filled: true,
                  fillColor: const Color(0xFFECF1FF),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.blue),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.blue, width: 2),
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a leading cause';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _moodController,
                decoration: InputDecoration(
                  labelText: 'Mood',
                  hintText: 'Happy/Sad/Anxious/Annoyed',
                  filled: true,
                  fillColor: const Color(0xFFECF1FF),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.blue),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.blue, width: 2),
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your mood';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _submitForm,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    padding: const EdgeInsets.all(16),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                  ),
                  child: const Text('Add Record'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}