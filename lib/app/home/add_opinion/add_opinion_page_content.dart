import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AddOpinionPageContent extends StatefulWidget {
  const AddOpinionPageContent({
    super.key,
  });

  @override
  State<AddOpinionPageContent> createState() => _AddOpinionPageContentState();
}

class _AddOpinionPageContentState extends State<AddOpinionPageContent> {
  var restaurantName = '';
  var kebabName = '';
  var reating = 3.0;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            decoration: const InputDecoration(
              hintText: 'Podaj nazwę restauracji',
            ),
            onChanged: (newValue) {
              setState(() {
                restaurantName = newValue;
              });
            },
          ),
          TextField(
            decoration: const InputDecoration(
              hintText: 'Podaj nazwę kebaba',
            ),
            onChanged: (newValue) {
              setState(() {
                kebabName = newValue;
              });
            },
          ),
          Slider(
            onChanged: (newValue) {
              setState(() {
                reating = newValue;
              });
            },
            value: reating,
            min: 1.0,
            max: 6.0,
            divisions: 10,
            label: reating.toString(),
          ),
          ElevatedButton(
            onPressed: () {
              FirebaseFirestore.instance.collection('restaurants').add({
                'name': restaurantName,
                'kebab': kebabName,
                'reating': reating,
              });
            },
            child: const Text('Dodaj'),
          ),
        ],
      ),
    );
  }
}
