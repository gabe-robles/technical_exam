import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_carousel_slider/flutter_custom_carousel_slider.dart';

class ProductImagesScreen extends StatelessWidget {
  const ProductImagesScreen({
    Key? key,
    required this.images,
  }) : super(key: key);

  final List<String> images;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: const Text("Product Images"),
      ),
      body: Center(
        child: CustomCarouselSlider(
          autoplay: false,
          subHeight: 20.0,
          height: 240,
          items: images.map((String imageUrl) {
            return CarouselItem(
              image: CachedNetworkImageProvider(
                imageUrl
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
