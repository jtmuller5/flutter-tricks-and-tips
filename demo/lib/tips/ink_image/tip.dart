import 'package:flutter/material.dart';

class InkImage extends StatelessWidget {
  const InkImage({super.key});

  final String imageUrl =
      'https://images.pexels.com/photos/29404625/pexels-photo-29404625/free-photo-of-scenic-mountain-cabin-in-tatra-mountains-poland.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          InkWell(
            onTap: () => print('Image tapped'),
            child: Image.network(
              imageUrl,
              height: 400,
            ),
          ),
          const SizedBox(height: 24),
          InkWell(
            onTap: () => print('Ink image tapped'),
            child: Ink.image(
              height: 400,
              image: NetworkImage(imageUrl),
            ),
          )
        ],
      ),
    );
  }
}
