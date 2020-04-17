package liulin.crunii.com.button_plugin;

import android.content.Context;

import java.util.Map;

import io.flutter.plugin.common.BinaryMessenger;
import io.flutter.plugin.common.StandardMessageCodec;
import io.flutter.plugin.platform.PlatformView;
import io.flutter.plugin.platform.PlatformViewFactory;

/**
 * Created by mi on 2019/5/20
 */
@SuppressWarnings("ALL")
class ButtonFactory extends PlatformViewFactory {

    private final  BinaryMessenger messenger;
    ButtonFactory(BinaryMessenger messenger) {
        super(StandardMessageCodec.INSTANCE);
        this.messenger = messenger;
    }

    @Override
    public PlatformView create(Context context, int id, Object params) {
        return new ButtonPlatformView(context,id,(Map<String,Object>)params,messenger);
    }
}
