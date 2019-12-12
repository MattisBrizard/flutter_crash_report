package com.orange.oab.pocfnow.plugins.mapview.map_view_plugin;

import android.app.Activity;
import android.app.Application;
import android.os.Bundle;

import java.util.concurrent.atomic.AtomicInteger;
import io.flutter.plugin.common.PluginRegistry;
import io.flutter.plugin.common.StandardMessageCodec;
import io.flutter.plugin.platform.PlatformView;
import io.flutter.plugin.platform.PlatformViewFactory;

public class MapViewPlugin implements Application.ActivityLifecycleCallbacks {
    static final int CREATED = 1;
    static final int STARTED = 2;
    static final int RESUMED = 3;
    static final int PAUSED = 4;
    static final int STOPPED = 5;
    static final int DESTROYED = 6;
    private final AtomicInteger state = new AtomicInteger(0);
    private final int registrarActivityHashCode;

    public static void registerWith(PluginRegistry.Registrar registrar) {
        if (registrar.activity() == null) return;
        final MapViewPlugin plugin = new MapViewPlugin(registrar);
        registrar.activity().getApplication().registerActivityLifecycleCallbacks(plugin);
        registrar
                .platformViewRegistry()
                .registerViewFactory("plugins.fnow.com/map_view", new MapViewFactory(plugin.getState(), registrar));
    }

    public MapViewPlugin(PluginRegistry.Registrar registrar) {
        registrarActivityHashCode = registrar.activity().hashCode();
    }

    public AtomicInteger getState() {
        return state;
    }

    @Override
    public void onActivityCreated(Activity activity, Bundle bundle) {
        if (activity.hashCode() != registrarActivityHashCode) return;
        state.set(CREATED);
    }

    @Override
    public void onActivityStarted(Activity activity) {
        if (activity.hashCode() != registrarActivityHashCode) return;
        state.set(STARTED);
    }

    @Override
    public void onActivityResumed(Activity activity) {
        if (activity.hashCode() != registrarActivityHashCode) return;
        state.set(RESUMED);
    }

    @Override
    public void onActivityPaused(Activity activity) {
        if (activity.hashCode() != registrarActivityHashCode) return;
        state.set(PAUSED);
    }

    @Override
    public void onActivityStopped(Activity activity) {
        if (activity.hashCode() != registrarActivityHashCode) return;
        state.set(STOPPED);
    }

    @Override
    public void onActivityDestroyed(Activity activity) {
        if (activity.hashCode() != registrarActivityHashCode) return;
        state.set(DESTROYED);
    }

    //region unused
    @Override
    public void onActivitySaveInstanceState(Activity activity, Bundle bundle) {}
    //endregion
}
