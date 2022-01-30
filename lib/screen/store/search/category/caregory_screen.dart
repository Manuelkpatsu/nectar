import 'package:flutter/material.dart';

import '../../../../locator.dart';
import 'category_notifier.dart';
import 'category_listenable.dart';
import 'widget/category_grid_view.dart';
import 'widget/category_title_text.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({ Key? key }) : super(key: key);

  @override
  _CategoryScreenState createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  late final CategoryNotifier notifier;

  @override
  void initState() {
    super.initState();
    notifier = get<CategoryNotifier>(param1: context);
    notifier.init();
  }

  @override
  void dispose() {
    notifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const CategoryTitleText(),
        centerTitle: true,
        automaticallyImplyLeading: false,
        elevation: 0.3,
      ),
      body: CategoryGridView(categoriesListenable: notifier.categories),
    );
  }
}
