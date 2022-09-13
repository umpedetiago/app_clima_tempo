class SearchCityEntity {
  final String? wind;
  final String? temperature;
  final String? description;
  final String? day;
  final List<SearchCityEntity>? forecast;

  SearchCityEntity(
      {this.wind, this.temperature, this.description, this.forecast, this.day});
}
