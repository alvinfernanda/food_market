part of 'pages.dart';

class OrderHistoryPage extends StatefulWidget {
  @override
  _OrderHistoryPageState createState() => _OrderHistoryPageState();
}

class _OrderHistoryPageState extends State<OrderHistoryPage> {
  int selectedIndex = 0;
  // List<Transaction> inProgress = mockTransactions
  //     .where((element) =>
  //         element.status == TransactionStatus.on_delivery ||
  //         element.status == TransactionStatus.pending)
  //     .toList();
  // List<Transaction> past = mockTransactions
  //     .where((element) =>
  //         element.status == TransactionStatus.delivered ||
  //         element.status == TransactionStatus.cancelled)
  //     .toList();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TransactionCubit, TransactionState>(builder: (_, state) {
      if (state is TransactionLoaded) {
        if (state.transaction.length == 0) {
          return Center(
              child: IllustrationPage(
                  title: 'Ouch! Hungry',
                  subtitle: 'Seem like you have not\nordered any food yet',
                  picturePath: 'assets/love_burger.png',
                  buttonTitle1: 'Find Foods',
                  buttonTap1: () {}));
        } else {
          double itemWidthList =
              MediaQuery.of(context).size.width - 2 * defaultMargin;

          return ListView(
            children: <Widget>[
              Column(
                children: <Widget>[
                  Container(
                      height: 100,
                      width: double.infinity,
                      color: Colors.white,
                      margin: EdgeInsets.only(bottom: defaultMargin),
                      padding: EdgeInsets.symmetric(horizontal: defaultPadding),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text('Your Orders', style: blackFontStyle1),
                          Text('Wait for the best meal',
                              style: greyFontStyle.copyWith(
                                  fontWeight: FontWeight.w300)),
                        ],
                      )),
                  Container(
                    width: double.infinity,
                    color: Colors.white,
                    child: Column(
                      children: <Widget>[
                        CustomTabBar(
                          titles: ['In Progres', 'Past Orders'],
                          selectedIndex: selectedIndex,
                          onTap: (index) {
                            setState(() {
                              selectedIndex = index;
                            });
                          },
                        ),
                        SizedBox(height: 16),
                        Builder(builder: (_) {
                          List<Transaction> transactions = (selectedIndex == 0)
                              ? state.transaction
                                  .where((element) =>
                                      element.status ==
                                          TransactionStatus.on_delivery ||
                                      element.status ==
                                          TransactionStatus.pending)
                                  .toList()
                              : state.transaction
                                  .where((element) =>
                                      element.status ==
                                          TransactionStatus.delivered ||
                                      element.status ==
                                          TransactionStatus.cancelled)
                                  .toList();
                          return Column(
                              children: (transactions
                                  .map((e) => Padding(
                                        padding: const EdgeInsets.only(
                                            left: defaultPadding,
                                            right: defaultPadding,
                                            bottom: 16),
                                        child: OrderListItem(
                                            transaction: e,
                                            itemWidth: itemWidthList),
                                      ))
                                  .toList()));
                        }),
                      ],
                    ),
                  )
                ],
              ),
            ],
          );
        }
      } else {
        return Center(child: loadingIndicator);
      }
    });
  }
}
