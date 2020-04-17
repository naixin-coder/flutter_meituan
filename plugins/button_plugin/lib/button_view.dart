import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

//自定义一个OnClickListener回调
typedef void OnClickListener(Widget view);
typedef void ButtonCreatedCallback(ButtonController controller);

//自定Flutter可以调用的ButtonWidget
class Button extends StatefulWidget {
  //定义属性
  final String text;
  //final double width;
  //final double height;

  //定义一个点击事件
  final OnClickListener onListener;
  //定义一个回调
  final ButtonCreatedCallback onButtonCreatedCallback;

  // 实现一个构造函数 text,width,height 为必传
  const Button(
      {Key key, this.text, this.onListener, this.onButtonCreatedCallback})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return ButtonState();
  }
}

class ButtonState extends State<Button> {
  @override
  Widget build(BuildContext context) {
    //安卓平台
    if (defaultTargetPlatform == TargetPlatform.android) {
      //AndroidView 是包装原生View的关键widget
      return new AndroidView(
          viewType: 'liulin.crunii.com/button', // 自定义唯一viewType
          onPlatformViewCreated: _onPlatformViewCreated,
          creationParams: _creationParams(),
          creationParamsCodec:
              const StandardMessageCodec() //如果设置了creationParams参数，必须要设置creationParamsCodec
          );
    } else if (defaultTargetPlatform == TargetPlatform.iOS) {
      //IOS平台
      //to do list
      return null;
    }
    //该插件暂时还不支持该平台
    return Text(
        '$defaultTargetPlatform is not yet supported by the the button plugin!');
  }

  //封装参数
  Map<String, dynamic> _creationParams() {
    return <String, dynamic>{'text': widget.text};
  }

  void _onPlatformViewCreated(int id) {
    ButtonController controller = ButtonController._(id, widget);
    if (widget.onButtonCreatedCallback != null) {
      widget.onButtonCreatedCallback(controller);
    }
  }
}

class ButtonController {
  final MethodChannel _channel;
  final Button _widget;
  ButtonController._(
    int id,
    this._widget,
  ) : _channel = MethodChannel('liulin.crunii.com/button_$id') {
    _channel.setMethodCallHandler(_methodCallHandler);
  }
  Future<bool> _methodCallHandler(MethodCall call) {
    switch (call.method) {
      case 'onClickListener':
        _widget.onListener(_widget);
        return null;
    }
    //没有该回调，抛异常
    throw MissingPluginException(
        '${call.method} was invoked but has no handler!');
  }
}
