import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios_new),
        ),
        title: const Text('About Weather Mate'),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'About Weather Mate',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16),
              Text(
                'Welcome to Weather Mate, your reliable companion for accurate and up-to-date weather information. '
                'Whether you\'re planning your day or preparing for unexpected weather changes, Weather Mate ensures '
                'you have the most current conditions right at your fingertips.',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 24),
              Text(
                'Key Features:',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),
              Text(
                '• Accurate Weather Data: Weather Mate provides real-time weather updates, including temperature, humidity, wind speed, and more.',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 8),
              Text(
                '• Location-Based Forecasts: Get weather updates for your current location or search for forecasts in other cities worldwide.',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 8),
              Text(
                '• Favorites List: Easily save and check the weather for your favorite locations.',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 8),
              Text(
                '• Offline Mode: Access previously loaded weather data when offline, ensuring you stay informed no matter the connection.',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 8),
              Text(
                '• Customizable Preferences: Switch between Celsius and Fahrenheit, and choose between light and dark themes.',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 24),
              Text(
                'Powered by OpenWeatherMap API:',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),
              Text(
                'Weather Mate uses the OpenWeatherMap API to deliver reliable and accurate weather data from around the globe.',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 24),
              Text(
                'Developed by Motiur Rahman Sany:',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),
              Text(
                'Weather Mate was built with care and dedication by Motiur Rahman Sany, aiming to deliver a seamless and user-friendly weather experience. '
                'If you enjoy the app and find it useful, feel free to support the development.',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 24),
              Center(
                child: Text(
                  '© 2024 Motiur Rahman Sany',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Colors.grey,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
