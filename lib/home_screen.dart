
import 'package:flutter/material.dart';
import 'package:loginui/kIcons.dart';
import 'colors.dart';
import 'detailScreen.dart';
import 'drawer_Menu.dart';

// ignore: use_key_in_widget_constructors
class HomeScreen extends StatefulWidget {
  @override
  // ignore: library_private_types_in_public_api
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  final List<String> bannersList = [
    "https://images.pexels.com/photos/1583884/pexels-photo-1583884.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
    "https://images.pexels.com/photos/628776/pexels-photo-628776.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
    "https://images.pexels.com/photos/3758053/pexels-photo-3758053.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
    "https://images.pexels.com/photos/1640777/pexels-photo-1640777.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
    "https://images.pexels.com/photos/1279330/pexels-photo-1279330.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500"
  ];

  // double scale = 1;
  bool toggle = false;
  late AnimationController _iconAnimationController;
  late AnimationController _scaleController;
  late AnimationController _transformController;
  late Animation<Offset> _transitionAnimation;

  @override
  void initState() {
    _iconAnimationController =
        AnimationController(vsync: this, duration: const Duration(milliseconds: 500));
    _scaleController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
      lowerBound: 0.8,
      upperBound: 1,
    );
    _scaleController.addListener(() {
      setState(() {});
    });

    _scaleController.forward();

    _transformController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );

    _transitionAnimation = Tween<Offset>(
      begin: const Offset(0, 0),
      end: const Offset(200, 60),
    ).animate(_transformController)
      ..addListener(() {
        setState(() {});
      });

    super.initState();
  }

  @override
  void dispose() {
    _iconAnimationController.dispose();
    _scaleController.dispose();
    _transformController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        DrawerMenu(),
        AnimatedBuilder(
          animation: _scaleController,
          builder: (context, child) {
            return ScaleTransition(
              scale: AlwaysStoppedAnimation<double>(_scaleController.value),
              child: Transform.translate(
                offset: _transitionAnimation.value,
                child: child,
              ),
            );
          },
          child: ClipRRect(
            borderRadius:
                (toggle) ? BorderRadius.circular(20) : BorderRadius.circular(0),
            child: Scaffold(
              appBar: AppBar(
                leading: IconButton(
                    icon: AnimatedIcon(
                        icon: AnimatedIcons.menu_arrow,
                        color: Colors.black,
                        progress: _iconAnimationController),
                    onPressed: () {
                      toggle = !toggle;
                      if (toggle) {
                        _transformController.forward();
                        _iconAnimationController.forward();
                        _scaleController.reverse();
                      } else {
                        _transformController.reverse();
                        _iconAnimationController.reverse();
                        _scaleController.forward();
                      }
                      setState(() {});
                    }),
                backgroundColor: Colors.transparent,
                elevation: 0.0,
                title: currentLocationWidget(context),
              ),
              body: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      searchWidget(context),
                      const SizedBox(height: 20),
                      titleWidget(context, "Category"),
                      topCategoryWidget(),
                      titleWidget(context, "Popular"),
                      for (int i = 0; i < bannersList.length; i++) ...{
                        FoodBannerWidget(bannersList[i])
                      }
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  // ignore: non_constant_identifier_names
  Widget FoodBannerWidget(String banner) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailScreen(
              imageName: banner, 
            ),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 15),
        decoration: BoxDecoration(
            color: Colors.grey.shade100,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.shade300, spreadRadius: 5, blurRadius: 5)
            ]),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 220,
              margin: const EdgeInsets.only(bottom: 5),
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
                image: DecorationImage(
                    image: NetworkImage(banner), fit: BoxFit.cover),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "Food Product Name",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                children: [
                  Icon(
                    Icons.star,
                    color: primaryColor,
                  ),
                  Text(
                    "4.5",
                    style: TextStyle(color: primaryColor),
                  ),
                  Text("(128 ratings)"),
                  Spacer(),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text("Cafe Western Food"),
                  ),
                  Text("\$5"),
                ],
              ),
            ),
            const SizedBox(
              height: 5,
            )
          ],
        ),
      ),
    );
  }

  Container topCategoryWidget() {
    // ignore: sized_box_for_whitespace
    return Container(
      height: 115,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: listCards.length,
          itemBuilder: (context, index) {
            return CategoryCard(
              categoryModel: listCards[index],
            );
          }),
    );
  }

  Row searchWidget(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 45,
            margin: const EdgeInsets.symmetric(vertical: 5),
            padding: const EdgeInsets.only(left: 10),
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: BorderRadius.circular(30),
            ),
            child: Material(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(30),
              child: InkWell(
                borderRadius: BorderRadius.circular(30),
                onTap: () {},
                child: Row(
                  children: [
                    Image.asset(
                      SEARCH_ICON,
                      height: 18,
                      width: 18,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Search Foods",
                      style: Theme.of(context)
                          .textTheme
                          // ignore: deprecated_member_use
                          .subtitle1!
                          .copyWith(color: Colors.black45),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: Image.asset(
            FILTER_ICON,
            height: 18,
            width: 18,
            color: primaryColor,
          ),
        ),
      ],
    );
  }

  Column currentLocationWidget(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Delivering to",
          style: Theme.of(context)
              .textTheme
              // ignore: deprecated_member_use
              .subtitle2!
              .copyWith(color: Colors.black45),
        ),
        InkWell(
          onTap: () {
            // ignore: avoid_print
            print("Delivery Location Button Clicked");
          },
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Current Location",
                style: Theme.of(context)
                    .textTheme
                    // ignore: deprecated_member_use
                    .headline6!
                    .copyWith(fontWeight: FontWeight.bold),
              ),
              const Icon(
                Icons.keyboard_arrow_down,
                color: primaryColor,
                size: 30,
              )
            ],
          ),
        )
      ],
    );
  }

  Widget titleWidget(BuildContext context, String title) {
    return Text(
      title,
      style: Theme.of(context)
          .textTheme
          // ignore: deprecated_member_use
          .headline6!
          .copyWith(fontWeight: FontWeight.bold, fontSize: 18),
    );
  }
}

class CategoryCard extends StatelessWidget {
  final CategoryModel categoryModel;
  // ignore: use_key_in_widget_constructors
  const CategoryCard({required this.categoryModel});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(17),
          margin: const EdgeInsets.only(top: 5, bottom: 2, right: 5, left: 8),
          height: 70,
          width: 70,
          decoration: BoxDecoration(
              color: Colors.green.withOpacity(0.15),
              borderRadius: BorderRadius.circular(10)),
          child: Image.asset(categoryModel.imageUrl),
        ),
        Text(categoryModel.title,
            style: Theme.of(context)
                .textTheme
                // ignore: deprecated_member_use
                .subtitle2!
                .copyWith(fontWeight: FontWeight.bold, color: Colors.black87))
      ],
    );
  }
}

class CategoryModel {
  String imageUrl;
  String title;
  String remoteUrl;
  CategoryModel(this.imageUrl, this.title, {required this.remoteUrl});
}

List<CategoryModel> listCards = [
  CategoryModel("assets/offers.png", "Offers", remoteUrl: ''),
  CategoryModel("assets/drinks.png", "Drinks", remoteUrl: ''),
  CategoryModel("assets/asian.png", "Asian", remoteUrl: ''),
  CategoryModel("assets/pizza.png", "Pizza", remoteUrl: ''),
  CategoryModel("assets/burger.png", "Burger", remoteUrl: ''),
];

class PopularItemModel {
  String imageUrl;
  String foodName;
  String hotelName;
  double rating;
  double amount;
  int ratingCount;
  PopularItemModel({
    required this.imageUrl,
    required this.foodName,
    required this.hotelName,
    required this.rating,
    required this.amount,
    required this.ratingCount,
  });
}
