import 'package:flutter/material.dart';

class NoInternetScreen extends StatelessWidget {
  const NoInternetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.wifi_off,
                size: 100,
                color: Colors.red,
              ),
              SizedBox(height: 20),
              Text(
                'No Internet Connection',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Please check your internet connection and try restarting the app',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
