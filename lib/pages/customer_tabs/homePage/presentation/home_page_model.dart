
import '../../../../appStyle/assets_images.dart';

class HomePageModel {
  late String image;
  late String name;
  late String type;
  late String location;
  late String publishedDate;
  late String rating;
  HomePageModel(this.image, this.name, this.type, this.location, this.publishedDate,this.rating);
}

List<HomePageModel> homepageModel = [
  HomePageModel(AssetsBase.dancingEvent, "Kendrick Lamar - The Big Steppers Tour", "Dancing","Royal Exhibition Building, Carlton, Australia","Published on October 26, 2017","4"),
  HomePageModel(AssetsBase.gamingEvent, "LAVER CUP LONDON 2022", "Gaming","Edgbaston Priory Club, Birmingham","Published on June 17, 2022","3"),
  HomePageModel(AssetsBase.dancingEvent, "The Open Championship Golf", "Gaming","Melbourne, Victoria","Published on March 05, 2021","1"),
  HomePageModel(AssetsBase.gamingEvent, "LAVER CUP LONDON 2022", "Dancing","Edgbaston Priory Club, Birmingham","Published on June 17, 2022","0"),
  HomePageModel(AssetsBase.dancingEvent, "Kendrick Lamar - The Big Steppers Tour", "Dancing","Royal Exhibition Building, Carlton, Australia","Published on October 26, 2017","4"),
  HomePageModel(AssetsBase.gamingEvent, "LAVER CUP LONDON 2022", "Gaming","Edgbaston Priory Club, Birmingham","Published on June 17, 2022","3"),
  HomePageModel(AssetsBase.dancingEvent, "The Open Championship Golf", "Gaming","Melbourne, Victoria","Published on March 05, 2021","1"),
  HomePageModel(AssetsBase.gamingEvent, "LAVER CUP LONDON 2022", "Dancing","Edgbaston Priory Club, Birmingham","Published on June 17, 2022","0"),
];


