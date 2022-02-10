

// import 'dart:convert';

// import 'package:moviesapp/models/result.dart';

// TopRated topRatedFromJson(String str) => TopRated.fromJson(json.decode(str));

// String topRatedToJson(TopRated data) => json.encode(data.toJson());

// class TopRated {
//     TopRated({
//          this.page,
//          this.resultTopRateds,
//          this.totalPages,
//          this.totalResultTopRateds,
//     });

//     int? page;
//     List<Result>? resultTopRateds;
//     int? totalPages;
//     int? totalResultTopRateds;

//     factory TopRated.fromJson(Map<String, dynamic> json) => TopRated(
//         page: json["page"],
//         resultTopRateds: List<Result>.from(json["resultTopRateds"].map((x) => Result.fromJson(x))),
//         totalPages: json["total_pages"],
//         totalResultTopRateds: json["total_ResultTopRateds"],
//     );

//     Map<String, dynamic> toJson() => {
//         "page": page,
//         "ResultTopRateds": List<dynamic>.from(resultTopRateds!.map((x) => x.toJson())),
//         "total_pages": totalPages,
//         "total_ResultTopRateds": totalResultTopRateds,
//     };
// }


// enum OriginalLanguage { JA, HI, EN, KO }

// final originalLanguageValues = EnumValues({
//     "en": OriginalLanguage.EN,
//     "hi": OriginalLanguage.HI,
//     "ja": OriginalLanguage.JA,
//     "ko": OriginalLanguage.KO
// });

// class EnumValues<T> {
//     Map<String, T> map;
//     late Map<T, String> reverseMap;

//     EnumValues(this.map);

//     Map<T, String> get reverse {
//         if (reverseMap == null) {
//             reverseMap = map.map((k, v) => new MapEntry(v, k));
//         }
//         return reverseMap;
//     }
// }
