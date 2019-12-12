package com.orange.oab.pocfnow.plugins.mapview.map_view_plugin;

import android.app.Activity;
import android.app.Application;
import android.content.Context;
import android.os.Bundle;
import android.view.View;
import android.util.Log;

import com.orange.oab.pocfnow.plugins.mapview.map_view_plugin.models.FnowLocation;
import com.visioglobe.visiomoveessential.VMEMapView;

import java.util.HashMap;
import java.util.Map;
import java.util.concurrent.atomic.AtomicInteger;
import io.flutter.plugin.common.MethodCall;

import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.PluginRegistry;
import io.flutter.plugin.platform.PlatformView;

import static com.orange.oab.pocfnow.plugins.mapview.map_view_plugin.MapViewPlugin.CREATED;
import static com.orange.oab.pocfnow.plugins.mapview.map_view_plugin.MapViewPlugin.DESTROYED;
import static com.orange.oab.pocfnow.plugins.mapview.map_view_plugin.MapViewPlugin.PAUSED;
import static com.orange.oab.pocfnow.plugins.mapview.map_view_plugin.MapViewPlugin.RESUMED;
import static com.orange.oab.pocfnow.plugins.mapview.map_view_plugin.MapViewPlugin.STARTED;
import static com.orange.oab.pocfnow.plugins.mapview.map_view_plugin.MapViewPlugin.STOPPED;

public class MapView implements Application.ActivityLifecycleCallbacks, PlatformView, MethodChannel.MethodCallHandler {

    private final AtomicInteger mState;
    private String mMapHash;
    private VMEMapView mapView;
    private final MethodChannel methodChannel;

    public MapView(int id, AtomicInteger state, PluginRegistry.Registrar registrar, String mapHash) {
        Activity activity = registrar.activity();
        mState = state;
        mapView = new VMEMapView(activity, null);
        mMapHash = mapHash;
        methodChannel =
            new MethodChannel(registrar.messenger(), "plugins.fnow.com/map_view" + id);
        methodChannel.setMethodCallHandler(this);
        switch (state.get()){
            case STOPPED:
                onActivityCreated(activity, null);
                onActivityStarted(activity);
                onActivityResumed(activity);
                onActivityPaused(activity);
                onActivityStopped(activity);
                break;
            case PAUSED:
                onActivityCreated(activity, null);
                onActivityStarted(activity);
                onActivityResumed(activity);
                onActivityPaused(activity);
                break;
            case RESUMED:
                onActivityCreated(activity, null);
                onActivityStarted(activity);
                onActivityResumed(activity);
                break;
            case STARTED:
                onActivityCreated(activity, null);
                onActivityStarted(activity);
                break;
            case CREATED:
                onActivityCreated(activity, null);
                break;
            case DESTROYED:
                break;
            default:
                throw new IllegalArgumentException("Cannot interpret " + state.get() + " as an activity state");
        }
        registrar.activity().getApplication().registerActivityLifecycleCallbacks(this);
    }

    @Override
    public View getView() {
        return mapView;
    }

    @Override
    public void dispose() {

    }

    @Override
    public void onInputConnectionLocked() {}

    @Override
    public void onInputConnectionUnlocked() {}

    @Override
    public void onActivityCreated(Activity activity, Bundle bundle) {
        mapView.setMapHash(mMapHash);
        mapView.loadMap();
    }

    @Override
    public void onActivityStarted(Activity activity) {
    }

    @Override
    public void onActivityResumed(Activity activity) {
        mapView.onResume();
    }

    @Override
    public void onActivityPaused(Activity activity) {
        mapView.onPause();
    }

    @Override
    public void onActivityStopped(Activity activity) {

    }

    @Override
    public void onActivitySaveInstanceState(Activity activity, Bundle bundle) {

    }

    @Override
    public void onActivityDestroyed(Activity activity) {
        dispose();
        mapView.dispose();
    }

    @Override
    public void onMethodCall(MethodCall methodCall, MethodChannel.Result result) {
        switch (methodCall.method) {
            case "map#setLocation":
                HashMap<String, Object> loc= (HashMap<String, Object>) methodCall.arguments;
                if (loc == null) return;
                FnowLocation location = new FnowLocation((double) loc.get("lat"),(double)loc.get("long"),(float)((double)loc.get("bearing")));
                mapView.updateLocation(mapView.createLocationFromLocation(location.toNativeLocation()));
                break;
            default:
                result.notImplemented();
        }
    }

}
