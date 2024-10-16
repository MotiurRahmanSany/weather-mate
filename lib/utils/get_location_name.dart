import 'package:geocoding/geocoding.dart';

String getLocationName (Placemark place){
  if (place.locality != null && place.locality!.isNotEmpty) {
    return place.locality!;
  } else if (place.subAdministrativeArea != null && place.subAdministrativeArea!.isNotEmpty) {
    return place.subAdministrativeArea!;
  } else if (place.administrativeArea != null && place.administrativeArea!.isNotEmpty) {
    return place.administrativeArea!;
  } else if (place.country != null && place.country!.isNotEmpty) {
    return place.country!;
  } else {
    return 'Unknown Location';
  }
}
