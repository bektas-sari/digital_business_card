import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

void main() {
  runApp(const DigitalBusinessCardApp());
}

class DigitalBusinessCardApp extends StatelessWidget {
  const DigitalBusinessCardApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Digital Business Card',
      theme: ThemeData(useMaterial3: true, colorSchemeSeed: Colors.deepPurple),
      home: const BusinessCardPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class BusinessCardPage extends StatelessWidget {
  const BusinessCardPage({super.key});

  final String fullName = 'Jane Doe';
  final String title = 'Flutter Developer';
  final String website = 'https://janedoe.dev';
  final String email = 'jane@doe.dev';
  final String linkedin = 'https://www.linkedin.com/in/janedoe';
  final String github = 'https://github.com/janedoe';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple.shade50,
      body: Center(
        child: Card(
          elevation: 8,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          margin: const EdgeInsets.all(24),
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const CircleAvatar(
                  radius: 48,
                  backgroundImage: AssetImage(
                    'assets/profile.jpg',
                  ), // Profil fotoğrafı eklenecek
                ),
                const SizedBox(height: 16),
                Text(
                  fullName,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  title,
                  style: const TextStyle(fontSize: 16, color: Colors.grey),
                ),
                const Divider(height: 32),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.link),
                      tooltip: 'Website',
                      onPressed: () => _launchURL(context, website),
                    ),
                    IconButton(
                      icon: const Icon(Icons.email),
                      tooltip: 'Email',
                      onPressed: () => _launchURL(context, 'mailto:$email'),
                    ),
                    IconButton(
                      icon: const Icon(Icons.code),
                      tooltip: 'GitHub',
                      onPressed: () => _launchURL(context, github),
                    ),
                    IconButton(
                      icon: const Icon(Icons.business),
                      tooltip: 'LinkedIn',
                      onPressed: () => _launchURL(context, linkedin),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                const Text(
                  'Scan QR to visit my LinkedIn:',
                  style: TextStyle(fontSize: 14),
                ),
                const SizedBox(height: 10),
                QrImageView(
                  data: linkedin,
                  version: QrVersions.auto,
                  size: 120,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _launchURL(BuildContext context, String url) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text('Open: $url')));
    // Gerçek projede url_launcher kullanılabilir.
  }
}
