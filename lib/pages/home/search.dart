import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class Search extends StatelessWidget {
  const Search({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> list = ['麻辣烫', '老麻抄手', '独一处烤鱼'];
    return Expanded(
      child: Container(
        height: 40.0,
        margin: EdgeInsets.only(left: 10.0),
        padding: EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 10.0),
        decoration: new BoxDecoration(
          borderRadius: BorderRadius.circular(5.0),
          color: Colors.white,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Icon(
              Feather.search,
              color: Color(0xFFA6A4A6),
              size: 15.0,
            ),
            Expanded(
              child: GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: () => {print('搜索')},
                child: Swiper(
                  itemBuilder: (BuildContext context, int index) {
                    return Text(
                      list[index],
                      style:
                          TextStyle(color: Color(0xFFA6A4A6), fontSize: 12.0),
                    );
                  },
                  itemCount: 3,
                  scrollDirection: Axis.vertical,
                  autoplay: true,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
