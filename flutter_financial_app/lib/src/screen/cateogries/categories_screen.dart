import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_financial_app/src/models/add_categories.dart';
import 'package:flutter_financial_app/src/screen/cateogries/add_categories.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive_flutter/adapters.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key});

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  File? image;
  var history;
  final box = Hive.box<Add_Categories>('categories');
  final List<String> day = [
    'Monday',
    "Tuesday",
    "Wednesday",
    "Thursday",
    'friday',
    'saturday',
    'sunday'
  ];
  final TextEditingController catgories = TextEditingController();
  FocusNode cat = FocusNode();

  @override
  void initState() {
    super.initState();
    cat.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: ValueListenableBuilder(
        valueListenable: box.listenable(),
        builder: (context, value, child) => CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: SizedBox(
                height: 100,
                child: _head(),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Expanded(
                      child: Divider(
                        thickness: 1,
                        endIndent: 8,
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: const Text(
                        'See All',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 15,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  history = box.values.toList()[index];
                  return getList(history, index);
                },
                childCount: box.length,
              ),
            ),
          ],
        ),
      )),
    );
  }

  Widget getList(Add_Categories history, int index) {
    return Dismissible(
      key: UniqueKey(),
      onDismissed: (direction) => showDialog(
        context: context,
        builder: (context) => CupertinoAlertDialog(
          title: const Text("Confirmation"),
          actions: [
            CupertinoDialogAction(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text("Cancelar")),
            CupertinoDialogAction(
                onPressed: () {
                  history.delete();
                  Navigator.of(context).pop();
                },
                child: const Text("Confirmar")),
          ],
          content: const Text("Are your certain you want to continue?"),
        ),
      ),
      child: getListTile(index, history),
    );
  }

  ListTile getListTile(int index, Add_Categories history) {
    return ListTile(
      /* leading: ClipRRect(
        borderRadius: BorderRadius.circular(5),
        child: Image.asset(
          history.imgPath,
          height: 40,
        ),
      ),*/
      title: Text(
        history.name,
        style: const TextStyle(
          fontSize: 17,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  Widget _head() {
    return Stack(
      children: [
        Column(
          children: [
            Container(
              width: double.infinity,
              height: 100,
              decoration: const BoxDecoration(
                color: Color(0xff368983),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
              ),
              child: Stack(
                children: [
                  Positioned(
                    top: 35,
                    left: 340,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(7),
                      child: GestureDetector(
                        onTap: () => Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const AddCategoriesScreen(),
                          ),
                        ),
                        child: Container(
                          height: 40,
                          width: 40,
                          color: const Color.fromRGBO(250, 250, 250, 0.1),
                          child: const Icon(
                            Icons.add_circle_outline,
                            size: 30,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 35,
                      left: 10,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'Categories',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 20,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
