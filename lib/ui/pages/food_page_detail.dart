part of 'pages.dart';

class FoodPageDetail extends StatefulWidget {
  final Function onBackButtonPressed;
  final Transaction transaction;

  FoodPageDetail({this.onBackButtonPressed, this.transaction});

  @override
  _FoodPageDetailState createState() => _FoodPageDetailState();
}

class _FoodPageDetailState extends State<FoodPageDetail> {
  int quantity = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(color: mainColor),
          SafeArea(
              child: Container(
            color: Colors.white,
          )),
          SafeArea(
              child: Container(
            height: 300,
            width: double.infinity,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(widget.transaction.food.picturePath),
                    fit: BoxFit.cover)),
          )),
          SafeArea(
              child: ListView(children: [
            Column(children: [
              //// Back Button
              Container(
                  height: 100,
                  padding: EdgeInsets.symmetric(horizontal: defaultPadding),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: GestureDetector(
                      onTap: () {
                        if (widget.onBackButtonPressed != null) {
                          widget.onBackButtonPressed();
                        }
                      },
                      child: Container(
                        padding: EdgeInsets.all(3),
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.black12),
                        child: Image.asset('assets/back_arrow_white.png'),
                      ),
                    ),
                  )),
              Container(
                  margin: EdgeInsets.only(top: 180),
                  padding: EdgeInsets.symmetric(vertical: 26, horizontal: 16),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(12),
                          topRight: Radius.circular(12)),
                      color: Colors.white),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                    width: MediaQuery.of(context).size.width -
                                        134, // 32 + 102
                                    child: Text(widget.transaction.food.name)),
                                SizedBox(height: 6),
                                Rating(widget.transaction.food.rate)
                              ]),
                          Row(
                            children: <Widget>[
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    quantity = max(1, quantity - 1);
                                  });
                                },
                                child: Container(
                                    width: 26,
                                    height: 26,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        border: Border.all(width: 1),
                                        image: DecorationImage(
                                            image: AssetImage(
                                                'assets/btn_min.png')))),
                              ),
                              SizedBox(
                                  width: 50,
                                  child: Text(
                                    quantity.toString(),
                                    textAlign: TextAlign.center,
                                    style: blackFontStyle2,
                                  )),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    quantity = min(999, quantity + 1);
                                  });
                                },
                                child: Container(
                                    width: 26,
                                    height: 26,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        border: Border.all(width: 1),
                                        image: DecorationImage(
                                            image: AssetImage(
                                                'assets/btn_add.png')))),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 14, 0, 16),
                        child: Text(
                          widget.transaction.food.description,
                          style: blackFontStyle2,
                        ),
                      ),
                      Text("Ingredients", style: blackFontStyle3),
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 4, 0, 41),
                        child: Text(
                          widget.transaction.food.ingredients,
                          style: greyFontStyle,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Total Price",
                                  style: greyFontStyle.copyWith(fontSize: 13),
                                ),
                                Text(
                                  NumberFormat.currency(
                                          locale: 'id-ID',
                                          symbol: 'IDR',
                                          decimalDigits: 0)
                                      .format(quantity *
                                          widget.transaction.food.price),
                                  style: blackFontStyle2.copyWith(fontSize: 18),
                                )
                              ]),
                          SizedBox(
                              width: 163,
                              height: 45,
                              child: RaisedButton(
                                onPressed: () {
                                  Get.to(PaymentPage(
                                    transaction: widget.transaction.copyWith(
                                      quantity: quantity,
                                      total: quantity * widget.transaction.food.price
                                    ),
                                  ));
                                },
                                color: mainColor,
                                elevation: 0,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8)),
                                child: Text(
                                  'Order Now',
                                  style: blackFontStyle3.copyWith(
                                      fontWeight: FontWeight.w500),
                                ),
                              ))
                        ],
                      )
                    ],
                  ))
            ])
          ]))
        ],
      ),
    );
  }
}
