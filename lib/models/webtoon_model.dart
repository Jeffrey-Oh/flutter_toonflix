class WebToonModel {
  final String title, thumb, id;

  // named constructor
  WebToonModel.fromjson(Map<String, dynamic> json)
      : title = json['title'],
        thumb = json['thumb'],
        id = json['id'];
}
