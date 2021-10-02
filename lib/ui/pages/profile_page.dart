part of 'pages.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Column(children: [
          Container(
            color: Colors.white,
            width: double.infinity,
            padding: EdgeInsets.symmetric(vertical: defaultPadding),
            margin: EdgeInsets.only(bottom: defaultMargin),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: 110,
                  height: 110,
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.only(bottom: 16),
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/photo_border.png'))),
                  child: Container(
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: NetworkImage(
                                (context.watch<UserCubit>().state as UserLoaded).user.picturePath),
                            fit: BoxFit.cover)),
                  ),
                ),
                Text(
                  (context.watch<UserCubit>().state as UserLoaded).user.name,
                  style: GoogleFonts.poppins(
                      fontSize: 18, fontWeight: FontWeight.w500),
                ),
                Text(
                  (context.watch<UserCubit>().state as UserLoaded).user.email,
                  style: greyFontStyle,
                ),
              ],
            ),
          ),
          Container(
            width: double.infinity,
            color: Colors.white,
            child: Column(
              children: <Widget>[
                CustomTabBar(
                  titles: ['Account', 'FoodMarket'],
                  selectedIndex: selectedIndex,
                  onTap: (index) {
                    setState(() {
                      selectedIndex = index;
                    });
                  },
                ),
                SizedBox(height: 16),
                Column(
                  children: ((selectedIndex == 0)
                          ? [
                              'Edit Profile',
                              'Home Address',
                              'Security',
                              'Payment'
                            ]
                          : [
                              'Rate App',
                              'Help Center',
                              'Privacy & Policy',
                              'Term Condition'
                            ])
                      .map((e) => Padding(
                            padding: const EdgeInsets.only(
                                left: defaultPadding,
                                right: defaultPadding,
                                bottom: 16),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(e, style: blackFontStyle3),
                                SizedBox(
                                  width: 24,
                                  height: 24,
                                  child: Image.asset('assets/right_arrow.png',
                                      fit: BoxFit.contain),
                                )
                              ],
                            ),
                          ))
                      .toList(),
                )
              ],
            ),
          ),
        ])
      ],
    );
  }
}
