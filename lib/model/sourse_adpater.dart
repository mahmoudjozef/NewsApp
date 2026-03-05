import 'package:hive_flutter/adapters.dart' show TypeAdapter, BinaryReader, BinaryWriter;
import 'package:news_app/model/sourseResponse.dart';
class SourseResponseAdapter extends TypeAdapter<SourseResponse> {
  @override
  final int typeId = 0;

  @override
  SourseResponse read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SourseResponse(
      status: fields[0] as String?,
      sources: (fields[1] as List?)?.cast<Sources>(),
    );
  }

  @override
  void write(BinaryWriter writer, SourseResponse obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.status)
      ..writeByte(1)
      ..write(obj.sources);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is SourseResponseAdapter &&
              runtimeType == other.runtimeType &&
              typeId == other.typeId;
}

class SourcesAdapter extends TypeAdapter<Sources> {
  @override
  final int typeId = 1;

  @override
  Sources read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Sources(
      id: fields[0] as String?,
      name: fields[1] as String?,
      description: fields[2] as String?,
      url: fields[3] as String?,
      category: fields[4] as String?,
      language: fields[5] as String?,
      country: fields[6] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, Sources obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.description)
      ..writeByte(3)
      ..write(obj.url)
      ..writeByte(4)
      ..write(obj.category)
      ..writeByte(5)
      ..write(obj.language)
      ..writeByte(6)
      ..write(obj.country);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is SourcesAdapter &&
              runtimeType == other.runtimeType &&
              typeId == other.typeId;
}