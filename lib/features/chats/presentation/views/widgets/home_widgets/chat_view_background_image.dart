import 'package:chat_app/core/constants/assets_images.dart';

import 'package:flutter/material.dart';

class ChatViewBackgroundImage extends StatelessWidget {
  const ChatViewBackgroundImage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Positioned.fill(
                  child: Image(
                    image: AssetImage(AssetsImages.whatsAppBackground),
                    fit: BoxFit.cover,
                  ),
                );
  }
}