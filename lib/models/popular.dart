import 'dart:convert';

import 'package:moviesapp/models/result.dart';

Popular popularFromJson(String str) => Popular.fromJson(json.decode(str));

String popularToJson(Popular data) => json.encode(data.toJson());

class Popular {
    Popular({
        this.page,
        this.results,
        this.totalPages,
        this.totalResults,
    });

    int? page;
    List<Result>? results;
    int? totalPages;
    int? totalResults;

    factory Popular.fromJson(Map<String, dynamic> json) => Popular(
        page: json["page"],
        results: List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
        totalPages: json["total_pages"],
        totalResults: json["total_results"],
    );

    Map<String, dynamic> toJson() => {
        "page": page,
        "results": List<dynamic>.from(results!.map((x) => x.toJson())),
        "total_pages": totalPages,
        "total_results": totalResults,
    };
}



enum OriginalLanguage { EN }

final originalLanguageValues = EnumValues({
    "en": OriginalLanguage.EN
});

class EnumValues<T> {
    Map<String, T> map;
    Map<T, String>? reverseMap;

    EnumValues(this.map);

    Map<T, String>? get reverse {
        if (reverseMap == null) {
            reverseMap = map.map((k, v) => new MapEntry(v, k));
        }
        return reverseMap;
    }
}
