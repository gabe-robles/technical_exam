import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:technical_exam/services/network/products.dart';

class PaginationBar extends StatelessWidget {
  const PaginationBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final ProductsServices products = Provider.of<ProductsServices>(context);

    const double iconSize = 12.0;

    int page = (products.pagination ~/ products.limit) + 1;
    int totalPages = products.totalItems! ~/ 10;

    return Padding(
      padding: const EdgeInsets.only(bottom: 24.0),
      child: Container(
        width: 140.0,
        decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.circular(50.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 4,
              blurRadius: 7,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Previous Button
            IconButton(
              icon: FaIcon(FontAwesomeIcons.chevronLeft,
                size: iconSize,
                color: page <= 1 ? Colors.white.withOpacity(0.3) : Colors.white,
              ),
              onPressed: () {
                products.previousPagination();
              },
            ),

            Text("$page",
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                fontWeight: FontWeight.w900,
                color: Colors.white,
              ),
            ),

            // Next Button
            IconButton(
              icon: FaIcon(FontAwesomeIcons.chevronRight,
                size: iconSize,
                color: page == totalPages
                    ? Colors.white.withOpacity(0.3)
                    : Colors.white,
              ),
              onPressed: () {
                products.nextPagination();
              },
            ),
          ],
        ),
      ),
    );
  }
}
