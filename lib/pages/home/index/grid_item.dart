import 'package:flutter/material.dart';
import 'package:flutter_meituan/common/tag.dart';
import 'package:flutter_meituan/model/home/product.dart';

class GridItem extends StatefulWidget {
  const GridItem({
    Key key,
    this.margin,
    this.product,
  }) : super(key: key);

  final EdgeInsetsGeometry margin;

  final Product product;

  @override
  _GridItemState createState() => _GridItemState();
}

class _GridItemState extends State<GridItem> {
  @override
  Widget build(BuildContext context) {
    Product product = widget.product;
    List<Widget> prices = [];

    if (product.nowPrice is String && product.nowPrice != 'null') {
      Widget mark = Text(
        '￥',
        style: TextStyle(
          color: Color(0xFFFB6604),
          fontWeight: FontWeight.w600,
          fontSize: 12.0,
        ),
      );
      Widget nowPrice = Text(
        product.nowPrice,
        style: TextStyle(
          color: Color(0xFFFB6604),
          fontWeight: FontWeight.w600,
          fontSize: 22.0,
        ),
      );
      prices.add(mark);
      prices.add(nowPrice);
    }
    if (product.oldPrice is String && product.oldPrice != 'null') {
      Widget oldPrice = Text(
        "￥" + product.oldPrice,
        style: TextStyle(
          color: Color(0xFF9A989A),
          fontSize: 14.0,
          decorationStyle: TextDecorationStyle.solid,
          decoration: TextDecoration.lineThrough,
        ),
      );
      prices.add(oldPrice);
    }
    if (product.discount is String && product.discount != 'null') {
      Widget discount = Tag(
        product.discount + '折',
        color: Color(0xFFFA5050),
        borderColor: Color(0xFFF4E2E3),
        backgroundColor: Color(0xFFFFF4F5),
      );
      prices.add(discount);
    }

    Widget tag = Container(
      margin: EdgeInsets.only(top: 7.0),
    );
    List<Widget> tags = [];
    if (product.tags is List) {
      for (var tag in product.tags) {
        Widget tagItem = Tag(
          tag,
          color: Color(0xFFFA5050),
          borderColor: Color(0xFFF4E2E3),
          backgroundColor: Color(0xFFFFF4F5),
        );
        tags.add(tagItem);
      }
      tag = Container(
          margin: EdgeInsets.only(top: 7.0), child: Row(children: tags));
    }

    return Card(
      elevation: 0,
      margin: widget.margin,
      child: Column(
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10.0),
                topRight: Radius.circular(10.0)),
            child: Image.network(product.imageUrl),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(5.0, 10.0, 10.0, 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  product.title,
                  style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w700),
                  textAlign: TextAlign.start,
                ),
                Container(
                  margin: EdgeInsets.only(top: 10.0),
                  child: Row(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(right: 5.0),
                        child: Text(
                          product.score,
                          style: TextStyle(
                              color: Color(0xFFFB6604),
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                      Expanded(
                        child: Text(
                          product.evaluation,
                          style: TextStyle(color: Color(0xFF6A686A)),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 10.0),
                  child: Row(
                    children: prices,
                  ),
                ),
                tag,
                Container(
                  margin: EdgeInsets.only(top: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        product.sales,
                        style: TextStyle(
                          color: Color(0xFF727173),
                          fontSize: 13.0,
                        ),
                      ),
                      Icon(
                        Icons.more_horiz,
                        color: Color(0xFFE1DFE1),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// class GridItem extends StatelessWidget {
//   const GridItem({
//     Key key,
//     this.margin,
//     this.product,
//   }) : super(key: key);

//   final EdgeInsetsGeometry margin;

//   final Product product;

//   @override
//   Widget build(BuildContext context) {
//     return
//   }
// }

//  new Container(
//       child: Card(
//         elevation: 0,
//         margin: EdgeInsets.only(
//           left: !index.isEven ? 5.0 : 10.0,
//           right: index.isEven ? 5.0 : 10.0,
//           bottom: 10.0,
//         ),
//         child: Column(
//           children: <Widget>[
//             ClipRRect(
//               borderRadius: BorderRadius.only(
//                   topLeft: Radius.circular(10.0),
//                   topRight: Radius.circular(10.0)),
//               child: Image.network(
//                   'http://pic27.nipic.com/20130126/5563735_160140678000_2.jpg'),
//             ),
//             Padding(
//               padding: EdgeInsets.fromLTRB(5.0, 10.0, 10.0, 10.0),
//               child: Column(
//                 children: <Widget>[
//                   Text(
//                     '50元代金券1张，可叠加',
//                     style:
//                         TextStyle(fontSize: 14.0, fontWeight: FontWeight.w700),
//                   ),
//                   Container(
//                     margin: EdgeInsets.only(top: 10.0),
//                     child: Row(
//                       children: <Widget>[
//                         Container(
//                           margin: EdgeInsets.only(right: 5.0),
//                           child: Text(
//                             '4.7分',
//                             style: TextStyle(
//                                 color: Color(0xFFFB6604),
//                                 fontWeight: FontWeight.w600),
//                           ),
//                         ),
//                         Expanded(
//                           child: Text(
//                             '吃点好的 食材新鲜 菜',
//                             style: TextStyle(color: Color(0xFF6A686A)),
//                             overflow: TextOverflow.ellipsis,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   Container(
//                     margin: EdgeInsets.only(top: 10.0),
//                     child: Row(
//                       children: <Widget>[
//                         Text(
//                           '￥',
//                           style: TextStyle(
//                             color: Color(0xFFFB6604),
//                             fontWeight: FontWeight.w600,
//                             fontSize: 12.0,
//                           ),
//                         ),
//                         Text(
//                           '48',
//                           style: TextStyle(
//                             color: Color(0xFFFB6604),
//                             fontWeight: FontWeight.w600,
//                             fontSize: 22.0,
//                           ),
//                         ),
//                         Text(
//                           '￥50',
//                           style: TextStyle(
//                             color: Color(0xFF9A989A),
//                             fontSize: 14.0,
//                             decorationStyle: TextDecorationStyle.solid,
//                             decoration: TextDecoration.lineThrough,
//                           ),
//                         ),
//                         Container(
//                           margin: EdgeInsets.only(left: 5.0),
//                           padding: EdgeInsets.fromLTRB(5.0, 0.0, 5.0, 1.0),
//                           decoration: BoxDecoration(
//                             color: Color(0xFFFFF4F5),
//                             border: Border.all(
//                               color: Color(0xFFF4E2E3),
//                             ),
//                             borderRadius: BorderRadius.circular(3.0),
//                           ),
//                           child: Text(
//                             '9.6折',
//                             style: TextStyle(
//                               fontSize: 12.0,
//                               color: Color(0xFFFA5050),
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   Container(
//                     margin: EdgeInsets.only(top: 20.0),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       crossAxisAlignment: CrossAxisAlignment.center,
//                       children: <Widget>[
//                         Text(
//                           '已售 410732',
//                           style: TextStyle(
//                             color: Color(0xFF727173),
//                             fontSize: 13.0,
//                           ),
//                         ),
//                         Icon(
//                           Icons.more_horiz,
//                           color: Color(0xFFE1DFE1),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     ),
