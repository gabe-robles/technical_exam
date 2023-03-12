import 'package:cached_network_image/cached_network_image.dart';
import 'package:custom_rating_bar/custom_rating_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:technical_exam/models/product/details.dart';
import 'package:technical_exam/services/functions/navigation.dart';
import 'package:technical_exam/services/network/products.dart';
import 'package:technical_exam/ui/components/layout/appbar/custom.dart';
import 'package:technical_exam/ui/screens/products/images.dart';
import 'package:technical_exam/values/formats.dart';
import 'package:technical_exam/values/styles.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({
    Key? key,
    required this.details,
  }) : super(key: key);

  final ProductDetails details;

  @override
  Widget build(BuildContext context) {

    final NavigationServices nav = NavigationServices();

    final ProductsServices products = Provider.of<ProductsServices>(context);

    final double discountedPrice = products.getDiscountedAmount(
      price: details.price,
      discountPercentage: details.discountPercentage,
    );

    return Scaffold(
      appBar: const CustomAppBar(title: "Product Details"),
      body: SafeArea(
        child: Stack(
          children: [

            // Product Image
            GestureDetector(
              child: Stack(
                children: [
                  CachedNetworkImage(
                    alignment: Alignment.center,
                    fit: BoxFit.fitWidth,
                    height: 200.0,
                    imageUrl: details.imgThumbnail,
                    width: MediaQuery.of(context).size.width,
                  ),

                  // Images button
                  Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.secondary,
                        borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(Styles.radius)
                        )
                      ),
                      child: Text("View images",
                        style: Theme.of(context).textTheme.labelLarge!.copyWith(
                          color: Theme.of(context).colorScheme.onSecondary,
                        ),
                      ),
                    ),
                  )
                ],
              ),
              onTap: () {
                Navigator.of(context).push(nav.createRoute(ProductImagesScreen(images: details.images)));
              },
            ),

            // Main Content
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(top: 180.0),
                child: Container(
                  padding: const EdgeInsets.all(24.0),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.background,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(Styles.radius * 2),
                      topRight: Radius.circular(Styles.radius * 2),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [

                          // Product name
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 2,
                            child: Text(details.title,
                              style: Theme.of(context).textTheme.titleLarge,
                            ),
                          ),

                          // Product rating
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              RatingBar.readOnly(
                                size: 22.0,
                                isHalfAllowed: true,
                                emptyIcon: Icons.star_border_rounded,
                                filledIcon: Icons.star_rounded,
                                halfFilledIcon: Icons.star_half_rounded,
                                initialRating: details.rating,
                                maxRating: 5,
                              ),
                              Text("Rating: ${details.rating}",
                                style: const TextStyle(
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),

                      // Original price
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Text(Formats.currency.format(details.price),
                          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            color: Colors.grey,
                            decoration: TextDecoration.lineThrough,
                          ),
                        ),
                      ),

                      // Discounted price
                      Padding(
                        padding: const EdgeInsets.only(top: 4.0),
                        child: Text(Formats.currency.format(discountedPrice),
                          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                            color: Theme.of(context).colorScheme.secondary,
                          ),
                        ),
                      ),

                      // Product Description
                      Padding(
                        padding: const EdgeInsets.only(top: 32.0),
                        child: Text("Description",
                          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: Colors.grey,
                          ),
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Text(details.description,
                          maxLines: 10,
                          style: Theme.of(context).textTheme.bodyLarge!,
                        ),
                      ),

                      // Category
                      Padding(
                        padding: const EdgeInsets.only(top: 32.0),
                        child: Text("Category: ${details.category}",
                          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: Colors.grey,
                          ),
                        ),
                      ),

                      // Brand
                      Padding(
                        padding: const EdgeInsets.only(top: 4.0),
                        child: Text("Brand: ${details.brand}",
                          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: Colors.grey,
                          ),
                        ),
                      ),

                      // Brand
                      Padding(
                        padding: const EdgeInsets.only(top: 4.0),
                        child: Text("Stock: ${details.stock}",
                          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
