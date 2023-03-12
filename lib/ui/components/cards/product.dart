import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:technical_exam/models/product/details.dart';
import 'package:technical_exam/models/product/item.dart';
import 'package:technical_exam/services/functions/navigation.dart';
import 'package:technical_exam/services/network/products.dart';
import 'package:technical_exam/ui/screens/products/details.dart';
import 'package:technical_exam/values/formats.dart';
import 'package:technical_exam/values/styles.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    Key? key,
    required this.product,
    required this.scaffoldKey,
  }) : super(key: key);

  final ProductItem product;
  final GlobalKey<ScaffoldState> scaffoldKey;

  final _imageSize = 120.0;

  @override
  Widget build(BuildContext context) {

    final NavigationServices nav = NavigationServices();
    final Styles styles = Styles();

    final ProductsServices products = Provider.of<ProductsServices>(context);

    final double discountedPrice = products.getDiscountedAmount(
      price: product.price,
      discountPercentage: product.discountPercentage,
    );

    return Padding(
      padding: const EdgeInsets.only(bottom: 24.0),
      child: InkWell( // For button press animation
        borderRadius: styles.borderRadius,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [

                // Product image
                SizedBox(
                  width: _imageSize,
                  height: _imageSize,
                  child: Stack(
                    children: [

                      // Product thumbnail
                      ClipRRect( // Round top left and bottom left of product image
                        borderRadius: BorderRadius.circular(Styles.radius),
                        child: CachedNetworkImage(
                          imageUrl: product.imgThumbnail,
                          width: _imageSize,
                          height: _imageSize,
                          fit: BoxFit.fitHeight,
                        ),
                      ),

                      // Discount
                      Align(
                        alignment: Alignment.topLeft,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8.0,
                            vertical: 6.0,
                          ),
                          decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.secondary,
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(Styles.radius),
                              bottomRight: Radius.circular(Styles.radius),
                            )
                          ),
                          child: Text("-${product.discountPercentage}%",
                            style: Theme.of(context).textTheme.labelSmall!.copyWith(
                              color: Theme.of(context).colorScheme.onSecondary,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                // Details
                Padding(
                  padding: const EdgeInsets.only(left: 24.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      // Product Name
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 3,
                        child: Text(product.title,
                          maxLines: 2,
                          style: Theme.of(context).textTheme.titleMedium!.copyWith(
                            fontSize: 18.0,
                            color: Theme.of(context).colorScheme.onBackground,
                          ),
                        ),
                      ),

                      // Stock
                      Padding(
                        padding: const EdgeInsets.only(top: 4.0),
                        child: Text("Stock: ${product.stock}",
                          style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            color: Colors.grey,
                          ),
                        ),
                      ),

                      const SizedBox(height: 24.0),

                      // Original Price
                      Text(Formats.currency.format(product.price),
                        style: Theme.of(context).textTheme.labelLarge!.copyWith(
                          decoration: TextDecoration.lineThrough,
                          color: Colors.grey.withOpacity(0.6),
                        ),
                      ),

                      // Discounted Price
                      Text(Formats.currency.format(discountedPrice),
                        style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          fontSize: 18.0,
                          color: Theme.of(context).colorScheme.secondary,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),

            // View Button
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: CircleAvatar(
                backgroundColor: Theme.of(context).colorScheme.primary.withOpacity(0.1),
                child: FaIcon(FontAwesomeIcons.chevronRight,
                  size: 14.0,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
            ),
          ],
        ),
        onTap: () async {

          // Get product details before displaying on a new screen
          await products.getDetails(scaffoldKey.currentContext!,
            productId: product.id,
          ).then((ProductDetails details) {
            Navigator.of(scaffoldKey.currentContext!)
                .push(nav.createRoute(ProductDetailsScreen(details: details)));
          });
        },
      ),
    );
  }
}
