import 'package:flutter/material.dart';

/// Destination photograph with a loading indicator and a graceful,
/// branded fallback when the image cannot be downloaded.
class RemoteImage extends StatelessWidget {
  const RemoteImage({
    super.key,
    required this.url,
    this.fit = BoxFit.cover,
    this.fallbackIcon = Icons.terrain_outlined,
  });

  final String url;
  final BoxFit fit;

  /// Icon shown inside the fallback when loading fails.
  final IconData fallbackIcon;

  @override
  Widget build(BuildContext context) {
    return Image.network(
      url,
      fit: fit,
      loadingBuilder: (context, child, progress) {
        if (progress == null) return child;
        return Stack(
          fit: StackFit.expand,
          children: [
            const ColoredBox(color: Color(0xFF17253E)),
            Center(
              child: SizedBox(
                width: 28,
                height: 28,
                child: CircularProgressIndicator(
                  strokeWidth: 2.4,
                  color: Colors.white.withValues(alpha: 0.85),
                ),
              ),
            ),
          ],
        );
      },
      errorBuilder: (context, error, stackTrace) => ColoredBox(
        color: const Color(0xFF17253E),
        child: Center(
          child: Icon(fallbackIcon, size: 40, color: Colors.white24),
        ),
      ),
    );
  }
}
