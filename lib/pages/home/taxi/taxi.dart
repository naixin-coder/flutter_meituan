import 'package:amap_location_fluttify/amap_location_fluttify.dart';
import 'package:amap_map_fluttify/amap_map_fluttify.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_meituan/config/application.dart';
import 'package:permission_handler/permission_handler.dart';

class TaxiPage extends StatefulWidget {
  TaxiPage({Key key}) : super(key: key);

  @override
  _TaxiPageState createState() => _TaxiPageState();
}

class _TaxiPageState extends State<TaxiPage> {
  // Location location;
  LatLng latLng;
  @override
  void initState() {
    super.initState();
    getLocation();
  }

  Future<void> initKeys() async {
    await AmapService.init(
        iosKey: '', androidKey: 'd7215b5fb4999610a1551837ccb54269	');
  }

  Future<bool> requestPermission() async {
    final status = await Permission.location.status;
    if (status == PermissionStatus.granted) {
      return true;
    } else {
      print('需要定位');
      await [Permission.location].request();
      return false;
    }
  }

  Future<void> getLocation() async {
    if (await requestPermission()) {
      Location location = await AmapLocation.fetchLocation();
      setState(() {
        latLng = location.latLng;
      });
      print("======================");
    }
  }

  Widget map() => AmapView(
        // 地图类型 (可选)
        mapType: MapType.Standard,
        // 是否显示缩放控件 (可选)
        showZoomControl: false,
        // 是否显示指南针控件 (可选)
        showCompass: false,
        // 是否显示比例尺控件 (可选)
        showScaleControl: false,
        // 是否使能缩放手势 (可选)
        zoomGesturesEnabled: true,
        // 是否使能滚动手势 (可选)
        scrollGesturesEnabled: true,
        // 是否使能旋转手势 (可选)
        rotateGestureEnabled: true,
        // 是否使能倾斜手势 (可选)
        tiltGestureEnabled: true,
        // 缩放级别 (可选)
        zoomLevel: 18,
        // 中心点坐标 (可选)
        centerCoordinate: latLng,
        // 标记 (可选)
        markers: <MarkerOption>[],
        // 标识点击回调 (可选)
        onMarkerClicked: (Marker marker) {},
        // 地图点击回调 (可选)
        onMapClicked: (LatLng coord) {},
        // 地图拖动开始 (可选)
        onMapMoveStart: (MapMove move) {},
        // 地图拖动结束 (可选)
        onMapMoveEnd: (MapMove move) {},
        // 地图创建完成回调 (可选)
        onMapCreated: (controller) async {
          if (await requestPermission()) {
            await controller.showMyLocation(MyLocationOption(show: true));
          }
        },
      );

  Widget back(BuildContext context) => GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          Application.router.pop(context);
        },
        child: Container(
          padding: EdgeInsets.all(5.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20.0),
            boxShadow: [
              BoxShadow(
                color: Colors.grey[300],
                blurRadius: 5.0,
              ),
            ],
          ),
          child: Icon(FontAwesome.long_arrow_left),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        AmapView(),
        Positioned(
          top: 30.0,
          left: 10.0,
          child: back(context),
        ),
      ],
    );
  }
}
