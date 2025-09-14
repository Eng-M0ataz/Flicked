// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MovieEntityAdapter extends TypeAdapter<MovieEntity> {
  @override
  final int typeId = 0;

  @override
  MovieEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MovieEntity(
      imageUrl: fields[1] as String,
      movieId: fields[0] as int,
      movieTitle: fields[2] as String,
      movieLanguage: fields[3] as String,
      isAdult: fields[4] as String,
      movieReleaseDate: fields[5] as String,
      movieAvarageVote: fields[6] as String,
      movieDescruption: fields[7] as String,
    );
  }

  @override
  void write(BinaryWriter writer, MovieEntity obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.movieId)
      ..writeByte(1)
      ..write(obj.imageUrl)
      ..writeByte(2)
      ..write(obj.movieTitle)
      ..writeByte(3)
      ..write(obj.movieLanguage)
      ..writeByte(4)
      ..write(obj.isAdult)
      ..writeByte(5)
      ..write(obj.movieReleaseDate)
      ..writeByte(6)
      ..write(obj.movieAvarageVote)
      ..writeByte(7)
      ..write(obj.movieDescruption);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MovieEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
