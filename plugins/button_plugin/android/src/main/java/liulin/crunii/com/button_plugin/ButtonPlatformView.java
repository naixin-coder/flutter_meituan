package liulin.crunii.com.button_plugin;

import android.content.Context;
import android.view.View;
import android.widget.Button;

import java.util.Map;

import io.flutter.plugin.common.BinaryMessenger;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.platform.PlatformView;

/**
 * Created by mi on 2019/5/20
 */
class ButtonPlatformView implements PlatformView {

    private Context context;
    private Button button;

    private MethodChannel channel;

    ButtonPlatformView(Context context, int id, Map<String, Object> params, BinaryMessenger messenger) {
        this.context = context;
        this.button =  new Button(context);
        this.channel  = new MethodChannel(messenger,"liulin.crunii.com/button_"+id);

        // 属性参数设置
        if(params != null && params.containsKey("text")){
            Object text = params.get("text");
            button.setText(text.toString());
        }

        // 其他属性设置....

        //设置监听
        button.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                channel.invokeMethod("onClickListener",null);
            }
        });
    }

    @Override
    public View getView() {
        return button;
    }

    @Override
    public void dispose() {
        channel.setMethodCallHandler(null);
    }
}