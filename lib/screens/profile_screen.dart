import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wisata_candi/providers/auth_provider.dart';
import 'package:wisata_candi/providers/favorite_provider.dart';
import 'package:wisata_candi/screens/sign_in_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String fullName = '';

  void editProfile() {
    debugPrint('Ikon edit ditekan');
  }

  @override
  Widget build(BuildContext context) {
    final auth = context.watch<AuthProvider>();
    final favoriteCount =
        context.watch<FavoriteProvider>().count;

    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: 200,
            width: double.infinity,
            color: Colors.deepPurple,
          ),
          Column(
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: Padding(
                  padding: const EdgeInsets.only(top: 200 - 50),
                  child: Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.deepPurple,
                            width: 2,
                          ),
                          shape: BoxShape.circle,
                        ),
                        child: const CircleAvatar(
                          radius: 50,
                          backgroundImage: AssetImage(
                            'images/placeholder_image.png',
                          ),
                        ),
                      ),
                      if (auth.isSignedIn)
                        IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.camera_alt,
                            color: Colors.deepPurple.shade50,
                          ),
                        ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    const SizedBox(height: 20),
                    ProfileInfoItem(
                      icon: Icons.lock,
                      label: 'Pengguna',
                      value: auth.username,
                      iconColor: Colors.amber,
                    ),
                    const SizedBox(height: 4),
                    Divider(color: Colors.deepPurple[100]),
                    const SizedBox(height: 4),
                    ProfileInfoItem(
                      icon: Icons.person,
                      label: 'Nama',
                      value: fullName,
                      showEditIcon: auth.isSignedIn,
                      onEditPressed: editProfile,
                      iconColor: Colors.blue,
                    ),
                    const SizedBox(height: 4),
                    Divider(color: Colors.deepPurple[100]),
                    const SizedBox(height: 4),
                    ProfileInfoItem(
                      icon: Icons.favorite,
                      label: 'Favorit',
                      value: favoriteCount > 0 ? '$favoriteCount' : '',
                      iconColor: Colors.red,
                    ),
                    const SizedBox(height: 4),
                    Divider(color: Colors.deepPurple[100]),
                    const SizedBox(height: 20),
                    auth.isSignedIn
                        ? TextButton(
                            onPressed: () =>
                                context.read<AuthProvider>().signOut(),
                            child: const Text('Sign Out'),
                          )
                        : TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const SignInScreen(),
                                ),
                              );
                            },
                            child: const Text('Sign In'),
                          ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class ProfileInfoItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  final bool showEditIcon;
  final VoidCallback? onEditPressed;
  final Color? iconColor;

  const ProfileInfoItem({
    super.key,
    required this.icon,
    required this.label,
    required this.value,
    this.showEditIcon = false,
    this.onEditPressed,
    this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: iconColor ?? Colors.deepPurple),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: const TextStyle(fontSize: 12, color: Colors.grey),
              ),
              Text(
                value,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      if (showEditIcon)
        IconButton(
          icon: const Icon(Icons.edit, color: Colors.deepPurple),
          onPressed: onEditPressed,
        ),
      ],
    );
  }
}
