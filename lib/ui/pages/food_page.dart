part of 'pages.dart';

class FoodPage extends StatefulWidget {
  @override
  _FoodPageState createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    double listItemWidth =
        MediaQuery.of(context).size.width - 2 * defaultMargin;
    return ListView(
      // Header
      children: <Widget>[
        Column(
          children: <Widget>[
            Container(
              height: 100,
              width: double.infinity,
              color: Colors.white,
              padding: EdgeInsets.symmetric(horizontal: defaultPadding),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "Food Market",
                        style: blackFontStyle1,
                      ),
                      Text(
                        "Let's get somefood",
                        style: greyFontStyle,
                      ),
                    ],
                  ),
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        image: DecorationImage(
                            // image: NetworkImage(
                            //     "https://icdn.football-espana.net/wp-content/uploads/2020/11/merlin_153612873_5bb119b9-8972-4087-b4fd-371cab8c5ba2-superJumbo.jpg"),
                            image: NetworkImage(
                                (context.watch<UserCubit>().state as UserLoaded)
                                    .user
                                    .picturePath),
                            fit: BoxFit.cover)),
                  )
                ],
              ),
            ),
            // List food
            Container(
              height: 258,
              width: double.infinity,
              child: BlocBuilder<FoodCubit, FoodState>(
                  builder: (_, state) => (state is FoodLoaded)
                      ? ListView(scrollDirection: Axis.horizontal, children: [
                          Row(
                              children: state.foods
                                  .map((e) => Padding(
                                        padding: EdgeInsets.only(
                                            left: (e == mockFoods.first)
                                                ? defaultPadding
                                                : 0,
                                            right: defaultPadding),
                                        child: GestureDetector(
                                            onTap: () {
                                              Get.to(FoodPageDetail(
                                                transaction: Transaction(
                                                  food: e,
                                                  user: (context
                                                          .bloc<UserCubit>()
                                                          .state as UserLoaded)
                                                      .user,
                                                ),
                                                onBackButtonPressed: () {
                                                  Get.back();
                                                },
                                              ));
                                            },
                                            child: FoodCard(e)),
                                      ))
                                  .toList())
                        ])
                      : Center(child: loadingIndicator)),
            ),
            Container(
                width: double.infinity,
                color: Colors.white,
                child: Column(
                  children: <Widget>[
                    CustomTabBar(
                      titles: ['New Taste', 'Popular', 'Recomended'],
                      selectedIndex: selectedIndex,
                      onTap: (index) {
                        setState(() {
                          selectedIndex = index;
                        });
                      },
                    ),
                    SizedBox(height: 16),
                    BlocBuilder<FoodCubit, FoodState>(builder: (_, state) {
                      if (state is FoodLoaded) {
                        List<Food> foods = state.foods.where((element) => element.type.contains(
                          (selectedIndex == 0)
                            ? FoodType.new_food
                            : (selectedIndex == 1) ? FoodType.popular : FoodType.recommended
                        )).toList();
                        return Column(
                            children: foods
                                .map((e) => Padding(
                                      padding: EdgeInsets.fromLTRB(
                                          defaultPadding,
                                          0,
                                          defaultPadding,
                                          16),
                                      child: FoodListItem(
                                          food: e, itemWidth: listItemWidth),
                                    ))
                                .toList());
                      } else {
                        return Center(child: loadingIndicator);
                      }
                    }),
                  ],
                )),
            SizedBox(height: 80),
          ],
        ),
      ],
    );
  }
}
