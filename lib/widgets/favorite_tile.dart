import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_mate/helper/format_temp.dart';
import 'package:weather_mate/models/favorite_location.dart';

class FavoriteTile extends ConsumerWidget {
  const FavoriteTile({super.key, required this.location, required this.onTap});
  final FavoriteLocation location;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
        color: Theme.of(context).colorScheme.onSurfaceVariant.withOpacity(.12),
        ),
        child: ListTile(
          leading: Image.asset(
            'assets/weather/${location.icon}.png',
            height: 50,
            width: 50,
          ),
          title: Text(location.city, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Theme.of(context).colorScheme.onSurfaceVariant,),),
          subtitle: Text(location.country, style: TextStyle(fontSize: 15, color: Theme.of(context).colorScheme.onSurfaceVariant.withOpacity(.7),),),
          trailing: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                formatTemperature(ref, location.temp!),
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                ),
              ),
              Text(
                location.description ?? '',
                style: TextStyle(
                  fontSize: 15,
                  color: Theme.of(context)
                      .colorScheme
                      .onSurfaceVariant
                      .withOpacity(.7),
                ),
              ),
            ],
          ),
          onTap: onTap,
        ),
      ),
    );
  }
}
