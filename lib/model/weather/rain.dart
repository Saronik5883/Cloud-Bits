class Rain {
  double? onehour;

  Rain({this.onehour});

  factory Rain.fromJson(Map<String, dynamic> json) => Rain(
        onehour: (json['1h'] as num?)?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        'onehour': onehour,
      };
}
