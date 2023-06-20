
class HomeModel{
  List<Articles>arc=[];
  HomeModel.fromJson(Map<String,dynamic>json){
    json['articles'].forEach((e){
      arc.add(Articles.fromJson(e));
    });
  }
}

class Articles{
  dynamic publishedAt;
  dynamic urlToImage;
  dynamic url;
  dynamic author;
  dynamic title;
  dynamic description;
  Articles.fromJson(Map<String,dynamic>json){
    publishedAt=json['publishedAt']??'';
    urlToImage=json['urlToImage']??'';
    url=json['url']??'';
    author=json['author']??'';
    title=json['title']??'';
    description=json['description']??'';

  }
}