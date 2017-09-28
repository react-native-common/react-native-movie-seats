import React, { Component } from 'react';
import {
    requireNativeComponent,
    findNodeHandle,
    NativeModules,
    Platform,
    View
} from 'react-native';
import PropTypes from 'prop-types';

class MovieSeats extends Component {

    constructor(props) {
        super(props);
        this._onChange = this._onChange.bind(this);//替换为当前this
    }

    _onChange(event: Event) {
        let eventMessage = {};
        try{
            eventMessage =JSON.parse(event.nativeEvent.message)
            eventMessage.data = JSON.parse(eventMessage.data)
        }catch (e){

        }
        if(this.props[eventMessage.type])
        {
            this.props[eventMessage.type](eventMessage.data);
        }
    }

    render() {
        return <RNMovieSeats {...this.props} onChange={this._onChange} />;
    }

    componentDidMount() {
        if (Platform.OS == "ios")
            RNMovieSeatsManager.setupViews(findNodeHandle(this));
    }
}

MovieSeats.propTypes = {
    ...View.propTypes,
    width: PropTypes.number,
    height: PropTypes.number,
    onChange: PropTypes.func,
    seatInfos: PropTypes.object,
    select: PropTypes.func,
    unselect: PropTypes.func,
    error: PropTypes.func,
    maxSelectedSeatsCount: PropTypes.number,
    selectedSeats: PropTypes.array,
    hallName: PropTypes.string,
    seatSpace:PropTypes.number,
    seatVerSpace:PropTypes.number,
}

MovieSeats.defaultProps = {
    select: null,
}

var RNMovieSeats = requireNativeComponent('RNMovieSeats', MovieSeats,{
    nativeOnly: {
        onChange: true
    }
});
var RNMovieSeatsManager = NativeModules.RNMovieSeatsManager;

module.exports = MovieSeats;