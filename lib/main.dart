import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:technical_exam/services/network/products.dart';
import 'package:technical_exam/ui/screens/products/list.dart';
import 'package:technical_exam/values/theme.dart';

void main() {
  // Disable HTTP fetching for Google Fonts
  GoogleFonts.config.allowRuntimeFetching = false;

  // License Google Fonts
  LicenseRegistry.addLicense(() async* {
    final license = await rootBundle.loadString('assets/google_fonts/OFL.txt');
    yield LicenseEntryWithLineBreaks(['assets/google_fonts'], license);
  });

  // Run application
  runApp(
    MultiProvider(
      // Change Notifier Providers
      providers: [
        ChangeNotifierProvider<ProductsServices>(create: (_)=> ProductsServices()),
      ],
      child: const TechnicalExam(),
    ),
  );
}

class TechnicalExam extends StatelessWidget {
  const TechnicalExam({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ERNI Technical Exam',
      theme: CustomTheme.data,
      home: const ProductsListScreen(),
    );
  }
}
