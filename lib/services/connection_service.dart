import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

class ConnectionService {
  Future<bool> isConnected() async {
    return await InternetConnection().hasInternetAccess;
  }
}
