import 'package:flutter/material.dart';

class MySearchDelegat extends SearchDelegate {
  List<String> searchResults = ['nour stars', 'narin', 'ghaith', 'haya Eid'];

  @override
  List<Widget>? buildActions(BuildContext context) => [
        IconButton(
            onPressed: () {
              if (query.isEmpty) {
                //
              } else {
                query = '';
              }
            },
            icon: const Icon(Icons.clear)),
      ];

  @override
  Widget? buildLeading(BuildContext context) =>
      IconButton(onPressed: () {}, icon: const Icon(Icons.arrow_back));

  @override
  Widget buildResults(BuildContext context) => Center(
        child: Text(
          query,
          style: const TextStyle(fontSize: 64, fontWeight: FontWeight.bold),
        ),
      );

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> sugesstions = searchResults.where((searchResults) {
      final result = searchResults.toLowerCase();
      final input = query.toLowerCase();
      return result.contains(input);
    }).toList();
    return ListView.builder(
        itemBuilder: (context, index) {
          final sugesstion = sugesstions[index];
          return ListTile(
            title: Text(sugesstion),
            onTap: () {
              query = sugesstion;
              showResults(context);
            },
          );
        },
        itemCount: sugesstions.length);
  }
}
