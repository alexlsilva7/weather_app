// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class AutoCompleteModel {
  int? version;
  String? key;
  String? type;
  int? rank;
  String? localizedName;
  Country? country;
  AdministrativeArea? administrativeArea;

  AutoCompleteModel(this.version, this.key, this.type, this.rank,
      this.localizedName, this.country, this.administrativeArea);

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'version': version,
      'key': key,
      'type': type,
      'rank': rank,
      'localizedName': localizedName,
      'country': country?.toMap(),
      'administrativeArea': administrativeArea?.toMap(),
    };
  }

  factory AutoCompleteModel.fromMap(Map<String, dynamic> map) {
    return AutoCompleteModel(
      map['Version'] != null ? map['Version'] as int : null,
      map['Key'] != null ? map['Key'] as String : null,
      map['Type'] != null ? map['Type'] as String : null,
      map['Rank'] != null ? map['Rank'] as int : null,
      map['LocalizedName'] != null ? map['LocalizedName'] as String : null,
      map['Country'] != null
          ? Country.fromMap(map['Country'] as Map<String, dynamic>)
          : null,
      map['AdministrativeArea'] != null
          ? AdministrativeArea.fromMap(
              map['AdministrativeArea'] as Map<String, dynamic>)
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory AutoCompleteModel.fromJson(String source) =>
      AutoCompleteModel.fromMap(json.decode(source) as Map<String, dynamic>);
}

class AdministrativeArea {
  String? iD;
  String? localizedName;

  AdministrativeArea({this.iD, this.localizedName});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'ID': iD,
      'LocalizedName': localizedName,
    };
  }

  factory AdministrativeArea.fromMap(Map<String, dynamic> map) {
    return AdministrativeArea(
      iD: map['ID'] != null ? map['ID'] as String : null,
      localizedName:
          map['LocalizedName'] != null ? map['LocalizedName'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory AdministrativeArea.fromJson(String source) =>
      AdministrativeArea.fromMap(json.decode(source) as Map<String, dynamic>);
}

class Country {
  String? iD;
  String? localizedName;

  Country({this.iD, this.localizedName});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'ID': iD,
      'localizedName': localizedName,
    };
  }

  factory Country.fromMap(Map<String, dynamic> map) {
    return Country(
      iD: map['ID'] != null ? map['ID'] as String : null,
      localizedName:
          map['LocalizedName'] != null ? map['LocalizedName'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Country.fromJson(String source) =>
      Country.fromMap(json.decode(source) as Map<String, dynamic>);
}
