// ignore: duplicate_ignore
// ignore: file_names
// ignore: file_names

// ignore_for_file: file_names, duplicate_ignore

import 'package:flutter/material.dart';

class DetailScreen extends StatefulWidget {
  final String imageName;

  const DetailScreen({super.key, required this.imageName});
  @override
  // ignore: library_private_types_in_public_api
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  final String src =
      "https://images.pexels.com/photos/315755/pexels-photo-315755.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260";

  final List<RelatedFoods> relatedFoods = [
    RelatedFoods(
        foodName: "Pizza",
        foodUrl:
            "https://images.pexels.com/photos/842519/pexels-photo-842519.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500"),
    RelatedFoods(
        foodName: "Burgger",
        foodUrl:
            "https://images.pexels.com/photos/1082342/pexels-photo-1082342.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500"),
    RelatedFoods(
        foodName: "Burgger",
        foodUrl:
            "https://images.pexels.com/photos/3915857/pexels-photo-3915857.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500"),
    RelatedFoods(
        foodName: "Burgger",
        foodUrl:
            "https://images.pexels.com/photos/3731422/pexels-photo-3731422.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500"),
    RelatedFoods(
        foodName: "Burgger",
        foodUrl:
            "https://images.pexels.com/photos/1653877/pexels-photo-1653877.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverAppBar(
            stretchTriggerOffset: 200,
            onStretchTrigger: () async {},
            shape: const BeveledRectangleBorder(),
            stretch: true,
            pinned: true,
            forceElevated: true,
            excludeHeaderSemantics: true,
            shadowColor: Colors.white24,
            backgroundColor: Colors.white,
            elevation: 0.0,
            expandedHeight: MediaQuery.of(context).size.height * 0.75,
            leading: Padding(
              padding: const EdgeInsets.all(8.0),
              child: RawMaterialButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                // ignore: sort_child_properties_last
                child: const Icon(
                  Icons.arrow_back,
                  color: Colors.black,
                ),
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                constraints: const BoxConstraints(),
                shape: const CircleBorder(),
                fillColor: Colors.white,
              ),
            ),
            flexibleSpace: FlexibleSpaceBar(
              collapseMode: CollapseMode.parallax,
              title: const Text(
                "Veg Pizza",
                style: TextStyle(color: Colors.black),
              ),
              stretchModes: const [
                StretchMode.zoomBackground,
                StretchMode.blurBackground,
              ],
              centerTitle: true,
              background: Stack(
                fit: StackFit.expand,
                children: [
                  Image.network(
                    widget.imageName,
                    height: MediaQuery.of(context).size.height * 0.90,
                    width: MediaQuery.of(context).size.width,
                    fit: BoxFit.cover,
                  ),
                  const DecoratedBox(
                      decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment(0.0, 0.9),
                      end: Alignment(0.0, 0.1),
                      colors: <Color>[
                        Colors.white,
                        Color(0x00000000),
                      ],
                    ),
                  ))
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              height: 850,
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Description",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  const Text(
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
                    style: TextStyle(height: 2, color: Colors.grey),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Row(
                      children: [
                        const Icon(Icons.star, color: Color(0xff0CCD03)),
                        Text(
                          "4.9",
                          style: Theme.of(context)
                              .textTheme
                              .titleSmall!
                              .copyWith(fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        const Icon(
                          Icons.timer,
                          color: Color(0xff0CCD03),
                        ),
                        Text(
                          "10-20 Min",
                          style: Theme.of(context)
                              .textTheme
                              .titleSmall!
                              .copyWith(fontWeight: FontWeight.w500),
                        ),
                        const Spacer(),
                        Text(
                          "\$ 6.50",
                          style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                              fontWeight: FontWeight.bold,
                              color: const Color(0xff0CCD03)),
                        )
                      ],
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 8.0, bottom: 12),
                    child: Row(
                      children: [
                        Icon(
                          Icons.location_on,
                          color: Colors.grey,
                          size: 18,
                        ),
                        Text(
                          "McDonalds",
                          style: TextStyle(color: Colors.grey),
                        )
                      ],
                    ),
                  ),
                  Text(
                    "Related Foods",
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                        children: relatedFoods
                            .map(
                              (item) => Container(
                                height: 120,
                                width: 120,
                                alignment: Alignment.bottomCenter,
                                margin: const EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: NetworkImage(item.foodUrl),
                                      fit: BoxFit.cover),
                                ),
                                child: Container(
                                  width: 120,
                                  height: 30,
                                  color: Colors.black45,
                                  alignment: Alignment.center,
                                  child: Text(
                                    item.foodName,
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            )
                            .toList()),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Row(
                      children: [
                        Text(
                          "Top Reviews",
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        const Spacer(),
                        TextButton(onPressed: () {}, child: const Text("View All"))
                      ],
                    ),
                  ),
                  ListView.builder(
                      itemCount: 4,
                      shrinkWrap: true,
                      padding: const EdgeInsets.all(0),
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return ListTile(
                          leading: CircleAvatar(
                            child: Image.network(
                              "https://png.pngtree.com/element_our/20200702/ourmid/pngtree-cartoon-flat-girl-character-design-free-download-image_2292211.jpg",
                              fit: BoxFit.cover,
                            ),
                          ),
                          title: const Text("Name"),
                          subtitle: const Text("Review Content"),
                          trailing: const Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                Icons.star,
                                color: Color(0xff0CCD03),
                              ),
                              Text(
                                "4.5",
                                style: TextStyle(
                                  color: Color(0xff0CCD03),
                                ),
                              )
                            ],
                          ),
                        );
                      }),
                  const Spacer(),
                  SizedBox(
                    height: 50,
                    width: MediaQuery.of(context).size.width,
                    child: TextButton(
                      style: TextButton.styleFrom(
                        foregroundColor: const Color(0xff0CCD03),
                      ),
                      onPressed: () {},
                      child: Text(
                        "Order Now",
                        style: Theme.of(context)
                            .textTheme
                            .titleLarge!
                            .copyWith(color: Colors.white),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class RelatedFoods {
  String foodUrl;
  String foodName;
  RelatedFoods({
    required this.foodUrl,
    required this.foodName,
  });
}
