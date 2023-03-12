import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';
import 'package:technical_exam/models/product/item.dart';
import 'package:technical_exam/services/network/products.dart';
import 'package:technical_exam/ui/components/cards/product.dart';
import 'package:technical_exam/ui/components/display/message.dart';
import 'package:technical_exam/ui/components/hud/loading.dart';
import 'package:technical_exam/ui/components/layout/appbar/search.dart';
import 'package:technical_exam/ui/components/layout/pagination/bar.dart';

class ProductsListScreen extends StatefulWidget {
  const ProductsListScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<ProductsListScreen> createState() => _ProductsListScreenState();
}

class _ProductsListScreenState extends State<ProductsListScreen> {

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      // Populate list view on screen load
      populateListView();
    });
  }

  void populateListView() {
    final ProductsServices products = Provider.of<ProductsServices>(context, listen: false);
    products.updateListFuture();
  }

  @override
  Widget build(BuildContext context) {

    final ProductsServices products = Provider.of<ProductsServices>(context);

    return Scaffold(
      key: _scaffoldKey,
      appBar: const AppBarWithSearch(title: "Products"),
      body: ModalProgressHUD(
        inAsyncCall: products.isLoading,
        progressIndicator: const LoadingWidget(),
        child: SafeArea( // Contain widgets within the safe area of the device
          child: FutureBuilder<List<ProductItem>>(
            future: products.listFuture,
            builder: (context, snapshot) {
              // Display if successful
              if (snapshot.connectionState == ConnectionState.done && snapshot.hasData) {

                // Products list as variable
                final List<ProductItem> productsList = snapshot.data!;

                // If data was returned from API
                if (productsList.isNotEmpty) {
                  return Stack(
                    children: [
                      ListView.builder(
                        controller: _scrollController,
                        padding: const EdgeInsets.fromLTRB(16.0, 24.0, 16.0, 90.0),
                        itemCount: productsList.length,
                        itemBuilder: (context, index) {

                          // Set product value
                          final ProductItem product = productsList[index];

                          // Display as list tile
                          return ProductCard(
                            product: product,
                            scaffoldKey: _scaffoldKey,
                          );
                        },
                      ),
                      const Align(
                        alignment: Alignment.bottomCenter,
                        child: PaginationBar()
                      ),
                    ],
                  );

                  // If no data was returned from API
                } else {
                  return const DisplayMessage(
                    message: "No items returned.",
                  );
                }

                // Display an error message
              } else if (snapshot.hasError) {
                return DisplayMessage(
                  message: "${snapshot.error}",
                );

                // Loading
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
