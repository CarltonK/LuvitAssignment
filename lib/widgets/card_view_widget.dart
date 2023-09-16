import 'package:flutter/material.dart';
import 'package:luvit/models/models.dart';
import 'package:luvit/utilities/utilities.dart';

class CardView extends StatelessWidget {
  const CardView({
    super.key,
    required this.currentData,
  });

  final DataModel currentData;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        top: 20,
        left: 30,
        right: 20,
        bottom: 10,
      ),
      margin: const EdgeInsets.all(10),
      height: 505,
      width: 350,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        image: const DecorationImage(
          image: AssetImage('assets/potrait.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        children: [
          Container(
            height: 5,
            color: Colors.grey,
            child: ListView.builder(
              itemCount: currentData.images.length,
              itemBuilder: (context, index) {
                return Row(
                  children: [
                    Container(
                      height: 5,
                      width: 100,
                      color: Palette.pink,
                    ),
                  ],
                );
              },
            ),
          ),
          // PageView.builder(
          //   itemCount: currentData.images.length,
          //   itemBuilder: (context, index) {
          //     final currentImg = currentData.images[index];
          //     return Image.network(currentImg);
          //   },
          // ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 25,
                decoration: BoxDecoration(
                  border: Border.all(color: Palette.border),
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.black,
                ),
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(
                      Icons.star,
                      color: Palette.darkIcon,
                      size: 20,
                    ),
                    const SizedBox(width: 5),
                    Text(
                      '${currentData.likeCount}',
                      style: const TextStyle(
                        color: Palette.text,
                        fontSize: 13,
                      ),
                    )
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const Text(
                            '잭과분홍콩나물',
                            style: TextStyle(
                              fontSize: 24,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(width: 2),
                          Text(
                            '${currentData.age}',
                            style: const TextStyle(
                              fontSize: 24,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      const Row(
                        children: [
                          Text(
                            '서울',
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            '2km 거리에 있음',
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 50,
                        width: 200,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: [
                            ...currentData.tags
                                .map(
                                  (e) => Container(
                                    margin: const EdgeInsets.symmetric(
                                      horizontal: 5,
                                    ),
                                    child: Chip(label: Text(e)),
                                  ),
                                )
                                .toList(),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Image.asset(
                    "assets/like.png",
                  )
                ],
              ),
              Center(
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.keyboard_arrow_down,
                    color: Colors.white,
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
