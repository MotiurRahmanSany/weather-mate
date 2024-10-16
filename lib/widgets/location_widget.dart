import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geocoding/geocoding.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:weather_mate/utils/get_location_name.dart';
import 'package:weather_mate/widgets/error_widget.dart';

import '../providers/location_provider.dart';

class LocationWidget extends ConsumerWidget {
  const LocationWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final location = ref.watch(locationProvider);

    return location.when(
      data: (location) {
        return _buildLocationWidget(context, location, false);
      },
      error: (err, st) {
        return const ShowErrorToUser();
      },
      loading: () {
        return _buildLocationWidget(context, null, true);
      },
    );
  }

  Widget _buildLocationWidget(
      BuildContext context, Placemark? location, bool isLoading) {
    return Skeletonizer(
      enabled: isLoading,
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.onSurfaceVariant.withOpacity(.1),
          borderRadius: BorderRadius.circular(15),
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
        ),
        margin: const EdgeInsets.only(top: 10, bottom: 0, left: 10, right: 10),
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(left: 20, right: 20),
              alignment: Alignment.topLeft,
              child: Text(
                location != null
                    ? getLocationName(location)
                    : 'Location',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onSurface,
                  fontSize: 35,
                  height: 2,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
              alignment: Alignment.topLeft,
              child: Text(
                location != null ? location.country! : 'country ...',
                style: TextStyle(
                  fontSize: 14,
                  color: Theme.of(context).colorScheme.onSurface,
                  height: 1.5,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
