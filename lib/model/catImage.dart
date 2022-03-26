final String tableCatImage = 'catimage';

class CatImageFields {
  static final List<String> values = [
    /// Add all fields
    id, idCatPro, idCatTime, imagePath
  ];

  static final String id = '_id';
  static final String idCatPro = 'idCatPro';
  static final String idCatTime = 'idCatTime';
  static final String imagePath = 'imagePath';
}

class CatImage {
  final int? id;
  final int? idCatPro;
  final int? idCatTime;
  final String imagePath;

  const CatImage({
    this.id,
    this.idCatPro,
    this.idCatTime,
    required this.imagePath,
  });

  CatImage copy({int? id, int? idCatPro, int? idCatTime, String? imagePath}) =>
      CatImage(
        id: id ?? this.id,
        idCatPro: idCatPro ?? this.idCatPro,
        idCatTime: idCatTime ?? this.idCatTime,
        imagePath: imagePath ?? this.imagePath,
      );

  static CatImage fromJson(Map<String, Object?> json) => CatImage(
        id: json[CatImageFields.id] as int?,
        idCatPro: json[CatImageFields.idCatPro] as int?,
        idCatTime: json[CatImageFields.idCatTime] as int?,
        imagePath: json[CatImageFields.imagePath] as String,
      );

  Map<String, Object?> toJson() => {
        CatImageFields.id: id,
        CatImageFields.idCatPro: idCatPro,
        CatImageFields.idCatTime: idCatTime,
        CatImageFields.imagePath: imagePath,
      };
}
