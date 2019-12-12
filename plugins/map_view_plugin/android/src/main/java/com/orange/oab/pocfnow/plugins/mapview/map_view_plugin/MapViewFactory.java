package com.orange.oab.pocfnow.plugins.mapview.map_view_plugin;

import android.content.Context;

import java.util.Map;
import java.util.concurrent.atomic.AtomicInteger;

import io.flutter.plugin.common.PluginRegistry;
import io.flutter.plugin.common.StandardMessageCodec;
import io.flutter.plugin.platform.PlatformView;
import io.flutter.plugin.platform.PlatformViewFactory;

public class MapViewFactory extends PlatformViewFactory {

    private final AtomicInteger mActivityState;
    private final PluginRegistry.Registrar mRegistrar;

    MapViewFactory(AtomicInteger state, PluginRegistry.Registrar registrar){
        super(StandardMessageCodec.INSTANCE);
        mActivityState = state;
        mRegistrar = registrar;
    }

    @SuppressWarnings("unchecked")
    @Override
    public PlatformView create(Context context, int id, Object args) {
        Map<String, Object> params = (Map<String, Object>) args;
        String mapHash = (String) params.get("hash");
        if (mapHash == null) return null;
        return new MapView(id, mActivityState, mRegistrar, mapHash);
    }
}
