final String tableCatPro = 'catpro';

class CatProFields {
  static final List<String> values = [
    /// Add all fields
    id, name, gender, species
  ];

  static final String id = '_id';
  static final String name = 'name';
  static final String gender = 'gender';
  static final String species = 'species';
}

class CatPro {
  final int? id;
  final String name;
  final bool gender;
  final String species;

  const CatPro({
    this.id,
    required this.name,
    required this.gender,
    required this.species,
  });

  CatPro copy({int? id, String? name, bool? gender, String? species}) => CatPro(
        id: id ?? this.id,
        name: name ?? this.name,
        gender: gender ?? this.gender,
        species: species ?? this.species,
      );

  static CatPro fromJson(Map<String, Object?> json) => CatPro(
        id: json[CatProFields.id] as int?,
        name: json[CatProFields.name] as String,
        gender: json[CatProFields.gender] == 1,
        species: json[CatProFields.species] as String,
      );

  Map<String, Object?> toJson() => {
        CatProFields.id: id,
        CatProFields.name: name,
        CatProFields.gender: gender ? 1 : 0,
        CatProFields.species: species,
      };
}
