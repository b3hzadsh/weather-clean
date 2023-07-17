Map<String, String> weatherImageMap = {
  "01d": "01d.jpg",
  "02d": "02d.jpg",
  "03d": "03d-n--04d-n.jpg",
  "04d": "03d-n--04d-n.jpg",
  "09d": "09-10--n-d.jpg",
  "10d": "09-10--n-d.jpg",
  "11d": "11n-11d.jpg",
  "13d": "13n-d.jpg",
  "50d": ".jpg",
  "01n": "01n.jpg",
  "02n": "02n.jpg",
  "03n": "03d-n--04d-n.jpg",
  "04n": "03d-n--04d-n.jpg",
  "09n": "09-10--n-d.jpg",
  "10n": "09-10--n-d.jpg",
  "11n": "11n-11d.jpg",
  "13n": "13n-d.jpg",
  "50n": "50n-d.jpg",
};
Map<String, String> weatherMap = {
  "01n": "مهتابی",
  "02n": "نیمه ابری",
  "03n": "ابری",
  "04n": "پراکندگی ابر",
  "09n": "بارانی",
  "10n": "بارانی",
  "11n": "طوفانی",
  "13n": "برفی",
  "50n": "وزش باد",
  "01d": "آفتابی",
  "02d": "نیمه ابری",
  "03d": "ابری",
  "04d": "پراکندگی ابر",
  "09d": "بارانی",
  "10d": "بارانی",
  "11d": "طوفانی",
  "13d": "برفی",
  "50d": "وزش باد",
};

class WeatherService {
  static const String apiKey = 'WTFPEoHG4wSCWxCOqPDZQNT56aFySLGB';
  static const String findCityNameAPIStart =
      "http://dataservice.accuweather.com/locations/v1/cities/geoposition/search?";
  static const String findWeatherAPIStart =
      "http://dataservice.accuweather.com/currentconditions/v1/";
  String apiComEnd = "apikey=$apiKey&q={latitude}%2C{longitude}";
  String requestCityNameUrl(
      {required double latitude, required double longitude}) {
    String res = '';
    res += findCityNameAPIStart;
    res += 'apikey=$apiKey&q=$latitude,$longitude';
    // res += 'apikey=$apiKey&q=$latitude%2C$longitude';
    return res;
  }

  String requestCityWeatherUrl({required String cityCode}) {
    String res = '';
    res += findWeatherAPIStart;
    res += '$cityCode?apikey=$apiKey';
    return res;
  }

  static String weatherTextToImagePath(String weatherText) {
    Map weatherTextToImagePathMap = {
      "Sunny": "assets/images/weather_types/01d.svg",
      "Mostly sunny": "assets/images/weather_types/01d.svg",
      "Partly sunny": "assets/images/weather_types/02d.svg",
      "Cloudy": "assets/images/weather_types/04d.svg",
      "Mostly cloudy": "assets/images/weather_types/04d.svg",
      "Partly cloudy": "assets/images/weather_types/04d.svg",
      "Rainy": "assets/images/weather_types/09n.svg",
      "Showers": "assets/images/weather_types/09d.svg",
      "Thunderstorms": "assets/images/weather_types/11d.svg",
      "Snowy": "assets/images/weather_types/13d.svg",
      "Flurries": "assets/images/weather_types/13d.svg",
      "Hazy": "assets/images/weather_types/42d.svg",
      "Foggy": "assets/images/weather_types/42d.svg",
      "Windy": "assets/images/weather_types/50d.svg",
    };
    return weatherTextToImagePathMap[weatherText];
  }
}
