import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:luvit/models/models.dart';
import 'package:luvit/providers/providers.dart';
import 'package:luvit/utilities/utilities.dart';
import 'package:luvit/widgets/widgets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _customAppBar(),
      backgroundColor: Palette.appBarBg,
      body: StreamBuilder(
        stream: DatabaseProvider().fetchDataStreamByRef(),
        builder: (context, AsyncSnapshot<LuvitModel> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('An error occurred: ${snapshot.error}'));
          } else {
            final data = snapshot.data;
            return PageView.builder(
              itemCount: data!.toJson().entries.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                Map<String, dynamic> currentModel =
                    data.toJson().entries.toList()[index].value;
                DataModel currentData =
                    dataModelFromJson(jsonEncode(currentModel));
                // print(currentData.toJson());
                return CardView(currentData: currentData);
              },
            );
          }
        },
      ),
    );
  }

  AppBar _customAppBar() {
    return AppBar(
      actions: const [
        Icon(
          Icons.notifications_active_outlined,
          color: Palette.backgroundgreyish,
        ),
      ],
      title: Row(
        children: [
          const Icon(
            Icons.location_on_outlined,
            color: Palette.backgroundgreyish,
          ),
          const SizedBox(width: 2),
          const Text(
            '목이길어슬픈기린님의 새로운 스팟',
            style: TextStyle(color: Palette.text, fontSize: 13),
          ),
          Expanded(child: Container()),
          Container(
            height: 25,
            padding: const EdgeInsets.all(2),
            decoration: BoxDecoration(
              border: Border.all(color: Palette.border),
              borderRadius: BorderRadius.circular(10),
              color: Colors.black,
            ),
            child: const Row(
              children: [
                Icon(Icons.star, color: Palette.pink, size: 20),
                SizedBox(width: 5),
                Text(
                  '323,233',
                  style: TextStyle(color: Palette.text, fontSize: 13),
                ),
              ],
            ),
          ),
        ],
      ),
      backgroundColor: Palette.appBarBg,
    );
  }
}
