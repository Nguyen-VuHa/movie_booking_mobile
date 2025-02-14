import 'package:flutter/material.dart';
import 'package:visibility_detector/visibility_detector.dart';
import 'package:shimmer/shimmer.dart';

class LazyLoadImage extends StatefulWidget {
  final String imageUrl;
  final double width;
  final double height;
  final BoxFit fit;

  const LazyLoadImage({
    super.key,
    required this.imageUrl,
    this.width = double.infinity,
    this.height = 200,
    this.fit = BoxFit.cover,
  });

  @override
  _LazyLoadImageState createState() => _LazyLoadImageState();
}

class _LazyLoadImageState extends State<LazyLoadImage> {
  bool _isVisible = false;
  static final Set<String> _loadedImages = {}; // Bộ nhớ cache ảnh

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: Key(widget.imageUrl),
      onVisibilityChanged: (visibilityInfo) {
        if (visibilityInfo.visibleFraction > 0 && !_isVisible) {
          setState(() {
            _isVisible = true;
            _loadedImages.add(widget.imageUrl); // Đánh dấu ảnh đã tải
          });
        }
      },
      child: _loadedImages.contains(widget.imageUrl)
          ? Image.network(
              widget.imageUrl,
              width: widget.width,
              height: widget.height,
              fit: widget.fit,
            )
          : _isVisible
              ? Image.network(
                  widget.imageUrl,
                  width: widget.width,
                  height: widget.height,
                  fit: widget.fit,
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) return child;
                    return _buildSkeleton(); // Hiển thị hiệu ứng skeleton
                  },
                  errorBuilder: (context, error, stackTrace) =>
                      const Center(child: Icon(Icons.error, color: Colors.red)),
                )
              : _buildSkeleton(), // Nếu chưa sẵn sàng, hiển thị skeleton
    );
  }

  /// Hiển thị hiệu ứng skeleton loading
  Widget _buildSkeleton() {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Container(
        width: widget.width,
        height: widget.height,
        color: Colors.white,
      ),
    );
  }
}
