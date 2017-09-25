package com.zmax.seat;


import android.support.annotation.Nullable;

import com.facebook.react.bridge.ReadableArray;
import com.facebook.react.bridge.ReadableMap;
import com.facebook.react.uimanager.SimpleViewManager;
import com.facebook.react.uimanager.ThemedReactContext;
import com.facebook.react.uimanager.annotations.ReactProp;
import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;

import java.lang.reflect.Type;
import java.util.ArrayList;

/**
 * Created by Administrator on 2017/9/21.
 */

public class RNMovieSeatsManager extends SimpleViewManager<RNMovieSeats> {
    @Override
    public String getName() {
        return "RNMovieSeats";
    }

    @Override
    protected RNMovieSeats createViewInstance(ThemedReactContext reactContext) {
        return new RNMovieSeats(reactContext);
    }

    @ReactProp(name = "seatInfos")
    public void setData(RNMovieSeats RNMovieSeats, @Nullable ReadableMap data) {
        Type type = new TypeToken<RNMovieSeats.Seat[][]>() {
        }.getType();
        RNMovieSeats.Seat[][] seats;
        try {
            seats = new Gson().fromJson(data.getArray("seat").toString(), type);
        } catch (Exception e) {
            return;
        }
        RNMovieSeats.setData(seats);
        ArrayList<String> rows;
        Type rType = new TypeToken<ArrayList<String>>() {
        }.getType();
        try {
            rows = new Gson().fromJson(data.getArray("row").toString(), rType);
        } catch (Exception e) {
            return;
        }
        RNMovieSeats.setLineNumbers(rows);
    }

    @ReactProp(name = "selectedSeats")
    public void setValue(RNMovieSeats RNMovieSeats, @Nullable ReadableArray data) {
        Type type = new TypeToken<RNMovieSeats.Seat[]>() {
        }.getType();
        RNMovieSeats.Seat[] seats;
        try {
            seats = new Gson().fromJson(data != null ? data.toString() : null, type);
        } catch (Exception e) {
            return;
        }
        RNMovieSeats.setselectSeats(seats);
    }

    @ReactProp(name = "maxSelectedSeatsCount")
    public void setMaxSelected(RNMovieSeats RNMovieSeats, int max) {
        RNMovieSeats.setMaxSelected(max);
    }

}
