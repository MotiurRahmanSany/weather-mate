import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PrefTiles extends ConsumerWidget {
  const PrefTiles({
    super.key,
    required this.title,
    required this.icon,
    this.subtitle,
    this.trailing,
    this.onTap,
  });

  
  final String title;
  final String? subtitle;
  final IconData icon;
  final void Function()? onTap;
  final Widget? trailing;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      margin: const EdgeInsets.all(1),
      padding: const EdgeInsets.all(5),
      child: Card(
        elevation: 1,
        child: ListTile(
          leading: Icon(icon),
          title: Text(title),
          subtitle: subtitle != null ? Text(subtitle!) : null,
          onTap: onTap,
          trailing: trailing ?? const Icon(Icons.arrow_forward_ios),
        ),
      ),
    );
  }
}
