final String tableCatTime = 'cattime';

class CatTimeFields {
  static final List<String> values = [
    /// Add all fields
    id,
    idCatPro,
    bodyLenght,
    heartGirth,
    hearLenghtSide,
    hearLenghtRear,
    hearLenghtTop,
    pixelReference,
    distanceReference,
    imageSide,
    imageRear,
    imageTop,
    date,
    note,
  ];

  static final String id = '_id';
  static final String idCatPro = 'idCatPro';
  static final String bodyLenght = 'bodyLenght';
  static final String heartGirth = 'heartGirth';
  static final String hearLenghtSide = 'hearLenghtSide';
  static final String hearLenghtRear = 'hearLenghtRear';
  static final String hearLenghtTop = 'hearLenghtTop';
  static final String pixelReference = 'pixelReference';
  static final String distanceReference = 'distanceReference';
  static final String imageSide = 'imageSide';
  static final String imageRear = 'imageRear';
  static final String imageTop = 'imageTop';
  static final String date = 'date';
  static final String note = 'note';
}

class CatTime {
  final int? id;
  final int? idCatPro;
  final double bodyLenght;
  final double heartGirth;
  final double hearLenghtSide;
  final double hearLenghtRear;
  final double hearLenghtTop;
  final double pixelReference;
  final double distanceReference;
  final int? imageSide;
  final int? imageRear;
  final int? imageTop;
  final String date;
  final String note;

  const CatTime({
    this.id,
    this.idCatPro,
    required this.bodyLenght,
    required this.heartGirth,
    required this.hearLenghtSide,
    required this.hearLenghtRear,
    required this.hearLenghtTop,
    required this.pixelReference,
    required this.distanceReference,
    this.imageSide,
    this.imageRear,
    this.imageTop,
    required this.date,
    required this.note,
  });

  CatTime copy({
    int? id,
    int? idCatPro,
    double? bodyLenght,
    double? heartGirth,
    double? hearLenghtSide,
    double? hearLenghtRear,
    double? hearLenghtTop,
    double? pixelReference,
    double? distanceReference,
    int? imageSide,
    int? imageRear,
    int? imageTop,
    String? date,
    String? note,
  }) =>
      CatTime(
        id: id ?? this.id,
        idCatPro: idCatPro ?? this.idCatPro,
        bodyLenght: bodyLenght ?? this.bodyLenght,
        heartGirth: heartGirth ?? this.heartGirth,
        hearLenghtSide: hearLenghtSide ?? this.hearLenghtSide,
        hearLenghtRear: hearLenghtRear ?? this.hearLenghtRear,
        hearLenghtTop: hearLenghtTop ?? this.hearLenghtTop,
        pixelReference: pixelReference ?? this.pixelReference,
        distanceReference: distanceReference ?? this.distanceReference,
        imageSide: imageSide ?? this.imageSide,
        imageRear: imageRear ?? this.imageRear,
        imageTop: imageTop ?? this.imageTop,
        date: date ?? this.date,
        note: note ?? this.note,
      );

  static CatTime fromJson(Map<String, Object?> json) => CatTime(
        id: json[CatTimeFields.id] as int?,
        idCatPro: json[CatTimeFields.idCatPro] as int?,
        bodyLenght: json[CatTimeFields.bodyLenght] as double,
        heartGirth: json[CatTimeFields.heartGirth] as double,
        hearLenghtSide: json[CatTimeFields.hearLenghtSide] as double,
        hearLenghtRear: json[CatTimeFields.hearLenghtRear] as double,
        hearLenghtTop: json[CatTimeFields.hearLenghtTop] as double,
        pixelReference: json[CatTimeFields.pixelReference] as double,
        distanceReference: json[CatTimeFields.distanceReference] as double,
        imageSide: json[CatTimeFields.imageSide] as int?,
        imageRear: json[CatTimeFields.imageRear] as int?,
        imageTop: json[CatTimeFields.imageTop] as int?,
        date: json[CatTimeFields.date] as String,
        note: json[CatTimeFields.note] as String,
      );

  Map<String, Object?> toJson() => {
        CatTimeFields.id: id,
        CatTimeFields.idCatPro: idCatPro,
        CatTimeFields.bodyLenght: bodyLenght,
        CatTimeFields.heartGirth: heartGirth,
        CatTimeFields.hearLenghtSide: hearLenghtSide,
        CatTimeFields.hearLenghtRear: hearLenghtRear,
        CatTimeFields.hearLenghtTop: hearLenghtTop,
        CatTimeFields.pixelReference: pixelReference,
        CatTimeFields.distanceReference: distanceReference,
        CatTimeFields.imageSide: imageSide,
        CatTimeFields.imageRear: imageRear,
        CatTimeFields.imageTop: imageTop,
        CatTimeFields.date: date,
        CatTimeFields.note: note,
      };
}
