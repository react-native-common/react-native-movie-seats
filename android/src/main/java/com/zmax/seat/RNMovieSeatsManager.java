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
    public void setData(RNMovieSeats view, @Nullable ReadableMap data) {
        Type type = new TypeToken<RNMovieSeats.Seat[][]>() {
        }.getType();
        RNMovieSeats.Seat[][] seats;
        try {
            seats = new Gson().fromJson(data.getArray("seat").toString(), type);
        } catch (Exception e) {
            return;
        }
        view.setData(seats);
        ArrayList<String> rows;
        Type rType = new TypeToken<ArrayList<String>>() {
        }.getType();
        try {
            rows = new Gson().fromJson(data.getArray("row").toString(), rType);
        } catch (Exception e) {
            return;
        }
        view.setLineNumbers(rows);
    }

    @ReactProp(name = "selectedSeats")
    public void setValue(RNMovieSeats view, @Nullable ReadableArray data) {
        Type type = new TypeToken<RNMovieSeats.Seat[]>() {
        }.getType();
        RNMovieSeats.Seat[] seats;
        try {
            seats = new Gson().fromJson(data != null ? data.toString() : null, type);
        } catch (Exception e) {
            return;
        }
        view.setselectSeats(seats);
    }

    @ReactProp(name = "maxSelectedSeatsCount")
    public void setMaxSelected(RNMovieSeats view, int max) {
        view.setMaxSelected(max);
    }
    @ReactProp(name = "seatSpace")
    public void setSpace(RNMovieSeats view,int space){
        view.setSpacing(space);
    }

    @ReactProp(name = "seatVerSpace")
    public void setVerSpace(RNMovieSeats view,int verSpace){
        view.setVerSpacing(verSpace);
    }
}
