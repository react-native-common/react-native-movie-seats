import React, { Component } from 'react';
import { requireNativeComponent, findNodeHandle, NativeModules} from 'react-native';
import PropTypes from 'prop-types';

class MovieSeats extends Component {
    render() {
        return <RNMovieSeats {...this.props} />;
    }

    componentDidMount() {
        RNMovieSeatsManager.setupViews(findNodeHandle(this));
    }
}

MovieSeats.propTypes = {
    width: PropTypes.number,
    height: PropTypes.number
}

var RNMovieSeats = requireNativeComponent('RNMovieSeats', MovieSeats);
var RNMovieSeatsManager = NativeModules.RNMovieSeatsManager;

module.exports = MovieSeats;