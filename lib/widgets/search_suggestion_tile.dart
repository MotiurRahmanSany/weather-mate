import 'package:flutter/material.dart';

class SearchSuggestionTile extends StatelessWidget {
  const SearchSuggestionTile({
    super.key,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 2),
      decoration: const BoxDecoration(),
      child: ListTile(
        title: Text(title),
        subtitle: Text(subtitle),
        onTap: onTap,
        trailing: const Icon(Icons.location_on_outlined),
      ),
    );
  }
}
