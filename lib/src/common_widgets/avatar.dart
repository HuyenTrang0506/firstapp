import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class Avatar extends StatelessWidget {
  const Avatar({
    Key? key,
    required this.radius,
    this.borderColor,
    this.borderWidth,
  }) : super(key: key);

  final double radius;
  final Color? borderColor;
  final double? borderWidth;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String>(
      future: _getImageUrl(), // Fetch image URL from Firebase Storage
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          // Show loading indicator while fetching image
          return CircularProgressIndicator();
        } else if (snapshot.hasError) {
          // Show error message if image loading fails
          return Text('Error loading image');
        } else if (snapshot.hasData) {
          // Display avatar with fetched image
          return Container(
            decoration: _borderDecoration(),
            child: ClipOval(
              child: CircleAvatar(
                radius: radius,
                backgroundColor: Colors.black12,
                backgroundImage: const AssetImage('assets/voting-box.png'),
              ),
            ),
          );
        } else {
          return SizedBox(); // Placeholder widget if no image is available
        }
      },
    );
  }

  // Function to fetch image URL from Firebase Storage
  Future<String> _getImageUrl() async {
    try {
      // Get reference to the image in Firebase Storage
      final ref = FirebaseStorage.instance.ref('profile.png');

      // Get the download URL of the image
      final url = await ref.getDownloadURL();

      return url; // Return the download URL
    } catch (e) {
      // Handle errors if image URL fetching fails
      print('Error fetching image URL: $e');
      return ''; // Return empty string in case of error
    }
  }

  // Function to create border decoration
  Decoration? _borderDecoration() {
    if (borderColor != null && borderWidth != null) {
      return BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: borderColor!,
          width: borderWidth!,
        ),
      );
    }
    return null;
  }
}
