package com.orange.oab.pocfnow.plugins.mapview.map_view_plugin.models;

import android.location.Location;

public class FnowLocation {
        // latitude
        private final double mX;
        // longitude
        private final double mY;
        private final float mBearing;

        public FnowLocation(){
            this(0,0, 0F);
        }

        public FnowLocation(double x, double y) {
            mX = x;
            mY = y;
            mBearing = 0.0f;
        }

        public FnowLocation(double x, double y,float bearing) {
            mX = x;
            mY = y;
            mBearing = bearing;
        }

        public double getX() {
            return mX;
        }

        public double getY() {
            return mY;
        }


        public float getBearing() {
            return mBearing;
        }

        public Location toNativeLocation() {
            final Location loc = new Location("");
            loc.setLatitude(mX);
            loc.setLongitude(mY);
            loc.setBearing(mBearing);
            return loc;
        }

}
