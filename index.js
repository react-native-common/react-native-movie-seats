import React, { Component } from 'react';
import {
    requireNativeComponent,
    findNodeHandle,
    NativeModules,
    Platform
} from 'react-native';
import PropTypes from 'prop-types';

class MovieSeats extends Component {

    constructor(props) {
        super(props);
        this._onChange = this._onChange.bind(this);//替换为当前this
    }

    _onChange(event: Event) {
        let eventMessage = {};
        eventMessage = event.nativeEvent;
        console.log(eventMessage);
        if(this.props[eventMessage.type])
        {
            this.props[eventMessage.type](eventMessage.data);
        }
    }

    render() {
        let seatInfos = {row:'1', seat:'2'}
        return <RNMovieSeats {...this.props} onChange={this._onChange} seatInfos={seatInfos} />;
    }

    componentDidMount() {
        if (Platform.OS == "ios")
            RNMovieSeatsManager.setupViews(findNodeHandle(this));
    }
}

MovieSeats.propTypes = {
    width: PropTypes.number,
    height: PropTypes.number,
    onChange: PropTypes.func,
    seatInfos: PropTypes.object,
    select: PropTypes.func,
    unselect: PropTypes.func,
    error: PropTypes.func,
    maxSelectedSeatsCount: PropTypes.number,
    selectedSeats: PropTypes.array,
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