
# react-native-movie-seats

## Getting started

`$ npm install react-native-movie-seats --save`

### Mostly automatic installation

`$ react-native link react-native-movie-seats`

### Manual installation


#### iOS

1. In XCode, in the project navigator, right click `Libraries` ➜ `Add Files to [your project's name]`
2. Go to `node_modules` ➜ `react-native-movie-seats` and add `RNMovieSeats.xcodeproj`
3. In XCode, in the project navigator, select your project. Add `libRNMovieSeats.a` to your project's `Build Phases` ➜ `Link Binary With Libraries`
4. Run your project (`Cmd+R`)<

#### Android

1. Open up `android/app/src/main/java/[...]/MainActivity.java`
  - Add `import com.reactlibrary.RNMovieSeatsPackage;` to the imports at the top of the file
  - Add `new RNMovieSeatsPackage()` to the list returned by the `getPackages()` method
2. Append the following lines to `android/settings.gradle`:
  	```
  	include ':react-native-movie-seats'
  	project(':react-native-movie-seats').projectDir = new File(rootProject.projectDir, 	'../node_modules/react-native-movie-seats/android')
  	```
3. Insert the following lines inside the dependencies block in `android/app/build.gradle`:
  	```
      compile project(':react-native-movie-seats')
  	```


## Usage
```javascript
import RNMovieSeats from 'react-native-movie-seats';

// TODO: What to do with the module?
RNMovieSeats;
```
  