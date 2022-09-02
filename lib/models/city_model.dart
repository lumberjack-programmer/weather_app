


class CityModel {
  final List<dynamic> data;

  CityModel({required this.data});

  factory CityModel.fromJson(List<dynamic> json) {
    return CityModel(data: json);
  }



}