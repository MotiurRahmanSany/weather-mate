import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: (){
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
                '• Accurate Weather Data: Weather Mate fetches real-time weather updates, including temperature, humidity, wind speed, and more.',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 8),
              Text(
                '• Location-Based Forecasts: Automatically get the latest weather updates for your current location or search for forecasts in other cities worldwide.',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 8),
              Text(
                '• Favorites List: Save your favorite locations to easily check the weather in places that matter most to you.',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 8),
              Text(
                '• Customizable Preferences: Choose between Celsius and Fahrenheit for temperature readings, and switch between light and dark themes to suit your style.',
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
                'Weather Mate utilizes the OpenWeatherMap API to deliver precise and reliable weather data from around the globe.',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 24),
              Text(
                'Support the Developer:',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),
              Text(
                'Enjoying Weather Mate? Consider supporting the developer by buying a coffee!',
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
