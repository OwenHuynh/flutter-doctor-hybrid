import 'package:flutter/material.dart';
import 'package:flutter_doctors_demo/utils/constants/app_strings.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(final BuildContext context) => SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Scaffold(
          backgroundColor: Colors.white,
          body: Center(
            child: Text(AppStrings.pleaseAddContent),
          ),
        ),
      );
}
