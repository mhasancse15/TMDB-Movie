// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $WatchlistEntriesTable extends WatchlistEntries
    with TableInfo<$WatchlistEntriesTable, WatchlistEntry> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $WatchlistEntriesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _posterPathMeta =
      const VerificationMeta('posterPath');
  @override
  late final GeneratedColumn<String> posterPath = GeneratedColumn<String>(
      'poster_path', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _backdropPathMeta =
      const VerificationMeta('backdropPath');
  @override
  late final GeneratedColumn<String> backdropPath = GeneratedColumn<String>(
      'backdrop_path', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _voteAverageMeta =
      const VerificationMeta('voteAverage');
  @override
  late final GeneratedColumn<double> voteAverage = GeneratedColumn<double>(
      'vote_average', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _releaseDateMeta =
      const VerificationMeta('releaseDate');
  @override
  late final GeneratedColumn<String> releaseDate = GeneratedColumn<String>(
      'release_date', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _mediaTypeMeta =
      const VerificationMeta('mediaType');
  @override
  late final GeneratedColumn<String> mediaType = GeneratedColumn<String>(
      'media_type', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant('movie'));
  static const VerificationMeta _addedAtMeta =
      const VerificationMeta('addedAt');
  @override
  late final GeneratedColumn<DateTime> addedAt = GeneratedColumn<DateTime>(
      'added_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        title,
        posterPath,
        backdropPath,
        voteAverage,
        releaseDate,
        mediaType,
        addedAt
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'watchlist_entries';
  @override
  VerificationContext validateIntegrity(Insertable<WatchlistEntry> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('poster_path')) {
      context.handle(
          _posterPathMeta,
          posterPath.isAcceptableOrUnknown(
              data['poster_path']!, _posterPathMeta));
    }
    if (data.containsKey('backdrop_path')) {
      context.handle(
          _backdropPathMeta,
          backdropPath.isAcceptableOrUnknown(
              data['backdrop_path']!, _backdropPathMeta));
    }
    if (data.containsKey('vote_average')) {
      context.handle(
          _voteAverageMeta,
          voteAverage.isAcceptableOrUnknown(
              data['vote_average']!, _voteAverageMeta));
    } else if (isInserting) {
      context.missing(_voteAverageMeta);
    }
    if (data.containsKey('release_date')) {
      context.handle(
          _releaseDateMeta,
          releaseDate.isAcceptableOrUnknown(
              data['release_date']!, _releaseDateMeta));
    } else if (isInserting) {
      context.missing(_releaseDateMeta);
    }
    if (data.containsKey('media_type')) {
      context.handle(_mediaTypeMeta,
          mediaType.isAcceptableOrUnknown(data['media_type']!, _mediaTypeMeta));
    }
    if (data.containsKey('added_at')) {
      context.handle(_addedAtMeta,
          addedAt.isAcceptableOrUnknown(data['added_at']!, _addedAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id, mediaType};
  @override
  WatchlistEntry map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return WatchlistEntry(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      title: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}title'])!,
      posterPath: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}poster_path']),
      backdropPath: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}backdrop_path']),
      voteAverage: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}vote_average'])!,
      releaseDate: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}release_date'])!,
      mediaType: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}media_type'])!,
      addedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}added_at'])!,
    );
  }

  @override
  $WatchlistEntriesTable createAlias(String alias) {
    return $WatchlistEntriesTable(attachedDatabase, alias);
  }
}

class WatchlistEntry extends DataClass implements Insertable<WatchlistEntry> {
  final int id;
  final String title;
  final String? posterPath;
  final String? backdropPath;
  final double voteAverage;
  final String releaseDate;
  final String mediaType;
  final DateTime addedAt;
  const WatchlistEntry(
      {required this.id,
      required this.title,
      this.posterPath,
      this.backdropPath,
      required this.voteAverage,
      required this.releaseDate,
      required this.mediaType,
      required this.addedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['title'] = Variable<String>(title);
    if (!nullToAbsent || posterPath != null) {
      map['poster_path'] = Variable<String>(posterPath);
    }
    if (!nullToAbsent || backdropPath != null) {
      map['backdrop_path'] = Variable<String>(backdropPath);
    }
    map['vote_average'] = Variable<double>(voteAverage);
    map['release_date'] = Variable<String>(releaseDate);
    map['media_type'] = Variable<String>(mediaType);
    map['added_at'] = Variable<DateTime>(addedAt);
    return map;
  }

  WatchlistEntriesCompanion toCompanion(bool nullToAbsent) {
    return WatchlistEntriesCompanion(
      id: Value(id),
      title: Value(title),
      posterPath: posterPath == null && nullToAbsent
          ? const Value.absent()
          : Value(posterPath),
      backdropPath: backdropPath == null && nullToAbsent
          ? const Value.absent()
          : Value(backdropPath),
      voteAverage: Value(voteAverage),
      releaseDate: Value(releaseDate),
      mediaType: Value(mediaType),
      addedAt: Value(addedAt),
    );
  }

  factory WatchlistEntry.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return WatchlistEntry(
      id: serializer.fromJson<int>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      posterPath: serializer.fromJson<String?>(json['posterPath']),
      backdropPath: serializer.fromJson<String?>(json['backdropPath']),
      voteAverage: serializer.fromJson<double>(json['voteAverage']),
      releaseDate: serializer.fromJson<String>(json['releaseDate']),
      mediaType: serializer.fromJson<String>(json['mediaType']),
      addedAt: serializer.fromJson<DateTime>(json['addedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'title': serializer.toJson<String>(title),
      'posterPath': serializer.toJson<String?>(posterPath),
      'backdropPath': serializer.toJson<String?>(backdropPath),
      'voteAverage': serializer.toJson<double>(voteAverage),
      'releaseDate': serializer.toJson<String>(releaseDate),
      'mediaType': serializer.toJson<String>(mediaType),
      'addedAt': serializer.toJson<DateTime>(addedAt),
    };
  }

  WatchlistEntry copyWith(
          {int? id,
          String? title,
          Value<String?> posterPath = const Value.absent(),
          Value<String?> backdropPath = const Value.absent(),
          double? voteAverage,
          String? releaseDate,
          String? mediaType,
          DateTime? addedAt}) =>
      WatchlistEntry(
        id: id ?? this.id,
        title: title ?? this.title,
        posterPath: posterPath.present ? posterPath.value : this.posterPath,
        backdropPath:
            backdropPath.present ? backdropPath.value : this.backdropPath,
        voteAverage: voteAverage ?? this.voteAverage,
        releaseDate: releaseDate ?? this.releaseDate,
        mediaType: mediaType ?? this.mediaType,
        addedAt: addedAt ?? this.addedAt,
      );
  WatchlistEntry copyWithCompanion(WatchlistEntriesCompanion data) {
    return WatchlistEntry(
      id: data.id.present ? data.id.value : this.id,
      title: data.title.present ? data.title.value : this.title,
      posterPath:
          data.posterPath.present ? data.posterPath.value : this.posterPath,
      backdropPath: data.backdropPath.present
          ? data.backdropPath.value
          : this.backdropPath,
      voteAverage:
          data.voteAverage.present ? data.voteAverage.value : this.voteAverage,
      releaseDate:
          data.releaseDate.present ? data.releaseDate.value : this.releaseDate,
      mediaType: data.mediaType.present ? data.mediaType.value : this.mediaType,
      addedAt: data.addedAt.present ? data.addedAt.value : this.addedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('WatchlistEntry(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('posterPath: $posterPath, ')
          ..write('backdropPath: $backdropPath, ')
          ..write('voteAverage: $voteAverage, ')
          ..write('releaseDate: $releaseDate, ')
          ..write('mediaType: $mediaType, ')
          ..write('addedAt: $addedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, title, posterPath, backdropPath,
      voteAverage, releaseDate, mediaType, addedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is WatchlistEntry &&
          other.id == this.id &&
          other.title == this.title &&
          other.posterPath == this.posterPath &&
          other.backdropPath == this.backdropPath &&
          other.voteAverage == this.voteAverage &&
          other.releaseDate == this.releaseDate &&
          other.mediaType == this.mediaType &&
          other.addedAt == this.addedAt);
}

class WatchlistEntriesCompanion extends UpdateCompanion<WatchlistEntry> {
  final Value<int> id;
  final Value<String> title;
  final Value<String?> posterPath;
  final Value<String?> backdropPath;
  final Value<double> voteAverage;
  final Value<String> releaseDate;
  final Value<String> mediaType;
  final Value<DateTime> addedAt;
  final Value<int> rowid;
  const WatchlistEntriesCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.posterPath = const Value.absent(),
    this.backdropPath = const Value.absent(),
    this.voteAverage = const Value.absent(),
    this.releaseDate = const Value.absent(),
    this.mediaType = const Value.absent(),
    this.addedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  WatchlistEntriesCompanion.insert({
    required int id,
    required String title,
    this.posterPath = const Value.absent(),
    this.backdropPath = const Value.absent(),
    required double voteAverage,
    required String releaseDate,
    this.mediaType = const Value.absent(),
    this.addedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        title = Value(title),
        voteAverage = Value(voteAverage),
        releaseDate = Value(releaseDate);
  static Insertable<WatchlistEntry> custom({
    Expression<int>? id,
    Expression<String>? title,
    Expression<String>? posterPath,
    Expression<String>? backdropPath,
    Expression<double>? voteAverage,
    Expression<String>? releaseDate,
    Expression<String>? mediaType,
    Expression<DateTime>? addedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (posterPath != null) 'poster_path': posterPath,
      if (backdropPath != null) 'backdrop_path': backdropPath,
      if (voteAverage != null) 'vote_average': voteAverage,
      if (releaseDate != null) 'release_date': releaseDate,
      if (mediaType != null) 'media_type': mediaType,
      if (addedAt != null) 'added_at': addedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  WatchlistEntriesCompanion copyWith(
      {Value<int>? id,
      Value<String>? title,
      Value<String?>? posterPath,
      Value<String?>? backdropPath,
      Value<double>? voteAverage,
      Value<String>? releaseDate,
      Value<String>? mediaType,
      Value<DateTime>? addedAt,
      Value<int>? rowid}) {
    return WatchlistEntriesCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      posterPath: posterPath ?? this.posterPath,
      backdropPath: backdropPath ?? this.backdropPath,
      voteAverage: voteAverage ?? this.voteAverage,
      releaseDate: releaseDate ?? this.releaseDate,
      mediaType: mediaType ?? this.mediaType,
      addedAt: addedAt ?? this.addedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (posterPath.present) {
      map['poster_path'] = Variable<String>(posterPath.value);
    }
    if (backdropPath.present) {
      map['backdrop_path'] = Variable<String>(backdropPath.value);
    }
    if (voteAverage.present) {
      map['vote_average'] = Variable<double>(voteAverage.value);
    }
    if (releaseDate.present) {
      map['release_date'] = Variable<String>(releaseDate.value);
    }
    if (mediaType.present) {
      map['media_type'] = Variable<String>(mediaType.value);
    }
    if (addedAt.present) {
      map['added_at'] = Variable<DateTime>(addedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('WatchlistEntriesCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('posterPath: $posterPath, ')
          ..write('backdropPath: $backdropPath, ')
          ..write('voteAverage: $voteAverage, ')
          ..write('releaseDate: $releaseDate, ')
          ..write('mediaType: $mediaType, ')
          ..write('addedAt: $addedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $FavoriteEntriesTable extends FavoriteEntries
    with TableInfo<$FavoriteEntriesTable, FavoriteEntry> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $FavoriteEntriesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _posterPathMeta =
      const VerificationMeta('posterPath');
  @override
  late final GeneratedColumn<String> posterPath = GeneratedColumn<String>(
      'poster_path', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _backdropPathMeta =
      const VerificationMeta('backdropPath');
  @override
  late final GeneratedColumn<String> backdropPath = GeneratedColumn<String>(
      'backdrop_path', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _voteAverageMeta =
      const VerificationMeta('voteAverage');
  @override
  late final GeneratedColumn<double> voteAverage = GeneratedColumn<double>(
      'vote_average', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _releaseDateMeta =
      const VerificationMeta('releaseDate');
  @override
  late final GeneratedColumn<String> releaseDate = GeneratedColumn<String>(
      'release_date', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _mediaTypeMeta =
      const VerificationMeta('mediaType');
  @override
  late final GeneratedColumn<String> mediaType = GeneratedColumn<String>(
      'media_type', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant('movie'));
  static const VerificationMeta _addedAtMeta =
      const VerificationMeta('addedAt');
  @override
  late final GeneratedColumn<DateTime> addedAt = GeneratedColumn<DateTime>(
      'added_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        title,
        posterPath,
        backdropPath,
        voteAverage,
        releaseDate,
        mediaType,
        addedAt
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'favorite_entries';
  @override
  VerificationContext validateIntegrity(Insertable<FavoriteEntry> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('poster_path')) {
      context.handle(
          _posterPathMeta,
          posterPath.isAcceptableOrUnknown(
              data['poster_path']!, _posterPathMeta));
    }
    if (data.containsKey('backdrop_path')) {
      context.handle(
          _backdropPathMeta,
          backdropPath.isAcceptableOrUnknown(
              data['backdrop_path']!, _backdropPathMeta));
    }
    if (data.containsKey('vote_average')) {
      context.handle(
          _voteAverageMeta,
          voteAverage.isAcceptableOrUnknown(
              data['vote_average']!, _voteAverageMeta));
    } else if (isInserting) {
      context.missing(_voteAverageMeta);
    }
    if (data.containsKey('release_date')) {
      context.handle(
          _releaseDateMeta,
          releaseDate.isAcceptableOrUnknown(
              data['release_date']!, _releaseDateMeta));
    } else if (isInserting) {
      context.missing(_releaseDateMeta);
    }
    if (data.containsKey('media_type')) {
      context.handle(_mediaTypeMeta,
          mediaType.isAcceptableOrUnknown(data['media_type']!, _mediaTypeMeta));
    }
    if (data.containsKey('added_at')) {
      context.handle(_addedAtMeta,
          addedAt.isAcceptableOrUnknown(data['added_at']!, _addedAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id, mediaType};
  @override
  FavoriteEntry map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return FavoriteEntry(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      title: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}title'])!,
      posterPath: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}poster_path']),
      backdropPath: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}backdrop_path']),
      voteAverage: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}vote_average'])!,
      releaseDate: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}release_date'])!,
      mediaType: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}media_type'])!,
      addedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}added_at'])!,
    );
  }

  @override
  $FavoriteEntriesTable createAlias(String alias) {
    return $FavoriteEntriesTable(attachedDatabase, alias);
  }
}

class FavoriteEntry extends DataClass implements Insertable<FavoriteEntry> {
  final int id;
  final String title;
  final String? posterPath;
  final String? backdropPath;
  final double voteAverage;
  final String releaseDate;
  final String mediaType;
  final DateTime addedAt;
  const FavoriteEntry(
      {required this.id,
      required this.title,
      this.posterPath,
      this.backdropPath,
      required this.voteAverage,
      required this.releaseDate,
      required this.mediaType,
      required this.addedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['title'] = Variable<String>(title);
    if (!nullToAbsent || posterPath != null) {
      map['poster_path'] = Variable<String>(posterPath);
    }
    if (!nullToAbsent || backdropPath != null) {
      map['backdrop_path'] = Variable<String>(backdropPath);
    }
    map['vote_average'] = Variable<double>(voteAverage);
    map['release_date'] = Variable<String>(releaseDate);
    map['media_type'] = Variable<String>(mediaType);
    map['added_at'] = Variable<DateTime>(addedAt);
    return map;
  }

  FavoriteEntriesCompanion toCompanion(bool nullToAbsent) {
    return FavoriteEntriesCompanion(
      id: Value(id),
      title: Value(title),
      posterPath: posterPath == null && nullToAbsent
          ? const Value.absent()
          : Value(posterPath),
      backdropPath: backdropPath == null && nullToAbsent
          ? const Value.absent()
          : Value(backdropPath),
      voteAverage: Value(voteAverage),
      releaseDate: Value(releaseDate),
      mediaType: Value(mediaType),
      addedAt: Value(addedAt),
    );
  }

  factory FavoriteEntry.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return FavoriteEntry(
      id: serializer.fromJson<int>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      posterPath: serializer.fromJson<String?>(json['posterPath']),
      backdropPath: serializer.fromJson<String?>(json['backdropPath']),
      voteAverage: serializer.fromJson<double>(json['voteAverage']),
      releaseDate: serializer.fromJson<String>(json['releaseDate']),
      mediaType: serializer.fromJson<String>(json['mediaType']),
      addedAt: serializer.fromJson<DateTime>(json['addedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'title': serializer.toJson<String>(title),
      'posterPath': serializer.toJson<String?>(posterPath),
      'backdropPath': serializer.toJson<String?>(backdropPath),
      'voteAverage': serializer.toJson<double>(voteAverage),
      'releaseDate': serializer.toJson<String>(releaseDate),
      'mediaType': serializer.toJson<String>(mediaType),
      'addedAt': serializer.toJson<DateTime>(addedAt),
    };
  }

  FavoriteEntry copyWith(
          {int? id,
          String? title,
          Value<String?> posterPath = const Value.absent(),
          Value<String?> backdropPath = const Value.absent(),
          double? voteAverage,
          String? releaseDate,
          String? mediaType,
          DateTime? addedAt}) =>
      FavoriteEntry(
        id: id ?? this.id,
        title: title ?? this.title,
        posterPath: posterPath.present ? posterPath.value : this.posterPath,
        backdropPath:
            backdropPath.present ? backdropPath.value : this.backdropPath,
        voteAverage: voteAverage ?? this.voteAverage,
        releaseDate: releaseDate ?? this.releaseDate,
        mediaType: mediaType ?? this.mediaType,
        addedAt: addedAt ?? this.addedAt,
      );
  FavoriteEntry copyWithCompanion(FavoriteEntriesCompanion data) {
    return FavoriteEntry(
      id: data.id.present ? data.id.value : this.id,
      title: data.title.present ? data.title.value : this.title,
      posterPath:
          data.posterPath.present ? data.posterPath.value : this.posterPath,
      backdropPath: data.backdropPath.present
          ? data.backdropPath.value
          : this.backdropPath,
      voteAverage:
          data.voteAverage.present ? data.voteAverage.value : this.voteAverage,
      releaseDate:
          data.releaseDate.present ? data.releaseDate.value : this.releaseDate,
      mediaType: data.mediaType.present ? data.mediaType.value : this.mediaType,
      addedAt: data.addedAt.present ? data.addedAt.value : this.addedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('FavoriteEntry(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('posterPath: $posterPath, ')
          ..write('backdropPath: $backdropPath, ')
          ..write('voteAverage: $voteAverage, ')
          ..write('releaseDate: $releaseDate, ')
          ..write('mediaType: $mediaType, ')
          ..write('addedAt: $addedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, title, posterPath, backdropPath,
      voteAverage, releaseDate, mediaType, addedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is FavoriteEntry &&
          other.id == this.id &&
          other.title == this.title &&
          other.posterPath == this.posterPath &&
          other.backdropPath == this.backdropPath &&
          other.voteAverage == this.voteAverage &&
          other.releaseDate == this.releaseDate &&
          other.mediaType == this.mediaType &&
          other.addedAt == this.addedAt);
}

class FavoriteEntriesCompanion extends UpdateCompanion<FavoriteEntry> {
  final Value<int> id;
  final Value<String> title;
  final Value<String?> posterPath;
  final Value<String?> backdropPath;
  final Value<double> voteAverage;
  final Value<String> releaseDate;
  final Value<String> mediaType;
  final Value<DateTime> addedAt;
  final Value<int> rowid;
  const FavoriteEntriesCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.posterPath = const Value.absent(),
    this.backdropPath = const Value.absent(),
    this.voteAverage = const Value.absent(),
    this.releaseDate = const Value.absent(),
    this.mediaType = const Value.absent(),
    this.addedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  FavoriteEntriesCompanion.insert({
    required int id,
    required String title,
    this.posterPath = const Value.absent(),
    this.backdropPath = const Value.absent(),
    required double voteAverage,
    required String releaseDate,
    this.mediaType = const Value.absent(),
    this.addedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        title = Value(title),
        voteAverage = Value(voteAverage),
        releaseDate = Value(releaseDate);
  static Insertable<FavoriteEntry> custom({
    Expression<int>? id,
    Expression<String>? title,
    Expression<String>? posterPath,
    Expression<String>? backdropPath,
    Expression<double>? voteAverage,
    Expression<String>? releaseDate,
    Expression<String>? mediaType,
    Expression<DateTime>? addedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (posterPath != null) 'poster_path': posterPath,
      if (backdropPath != null) 'backdrop_path': backdropPath,
      if (voteAverage != null) 'vote_average': voteAverage,
      if (releaseDate != null) 'release_date': releaseDate,
      if (mediaType != null) 'media_type': mediaType,
      if (addedAt != null) 'added_at': addedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  FavoriteEntriesCompanion copyWith(
      {Value<int>? id,
      Value<String>? title,
      Value<String?>? posterPath,
      Value<String?>? backdropPath,
      Value<double>? voteAverage,
      Value<String>? releaseDate,
      Value<String>? mediaType,
      Value<DateTime>? addedAt,
      Value<int>? rowid}) {
    return FavoriteEntriesCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      posterPath: posterPath ?? this.posterPath,
      backdropPath: backdropPath ?? this.backdropPath,
      voteAverage: voteAverage ?? this.voteAverage,
      releaseDate: releaseDate ?? this.releaseDate,
      mediaType: mediaType ?? this.mediaType,
      addedAt: addedAt ?? this.addedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (posterPath.present) {
      map['poster_path'] = Variable<String>(posterPath.value);
    }
    if (backdropPath.present) {
      map['backdrop_path'] = Variable<String>(backdropPath.value);
    }
    if (voteAverage.present) {
      map['vote_average'] = Variable<double>(voteAverage.value);
    }
    if (releaseDate.present) {
      map['release_date'] = Variable<String>(releaseDate.value);
    }
    if (mediaType.present) {
      map['media_type'] = Variable<String>(mediaType.value);
    }
    if (addedAt.present) {
      map['added_at'] = Variable<DateTime>(addedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('FavoriteEntriesCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('posterPath: $posterPath, ')
          ..write('backdropPath: $backdropPath, ')
          ..write('voteAverage: $voteAverage, ')
          ..write('releaseDate: $releaseDate, ')
          ..write('mediaType: $mediaType, ')
          ..write('addedAt: $addedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $WatchHistoryEntriesTable extends WatchHistoryEntries
    with TableInfo<$WatchHistoryEntriesTable, WatchHistoryEntry> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $WatchHistoryEntriesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _posterPathMeta =
      const VerificationMeta('posterPath');
  @override
  late final GeneratedColumn<String> posterPath = GeneratedColumn<String>(
      'poster_path', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _mediaTypeMeta =
      const VerificationMeta('mediaType');
  @override
  late final GeneratedColumn<String> mediaType = GeneratedColumn<String>(
      'media_type', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant('movie'));
  static const VerificationMeta _watchedAtMeta =
      const VerificationMeta('watchedAt');
  @override
  late final GeneratedColumn<DateTime> watchedAt = GeneratedColumn<DateTime>(
      'watched_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  @override
  List<GeneratedColumn> get $columns =>
      [id, title, posterPath, mediaType, watchedAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'watch_history_entries';
  @override
  VerificationContext validateIntegrity(Insertable<WatchHistoryEntry> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('poster_path')) {
      context.handle(
          _posterPathMeta,
          posterPath.isAcceptableOrUnknown(
              data['poster_path']!, _posterPathMeta));
    }
    if (data.containsKey('media_type')) {
      context.handle(_mediaTypeMeta,
          mediaType.isAcceptableOrUnknown(data['media_type']!, _mediaTypeMeta));
    }
    if (data.containsKey('watched_at')) {
      context.handle(_watchedAtMeta,
          watchedAt.isAcceptableOrUnknown(data['watched_at']!, _watchedAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id, mediaType};
  @override
  WatchHistoryEntry map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return WatchHistoryEntry(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      title: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}title'])!,
      posterPath: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}poster_path']),
      mediaType: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}media_type'])!,
      watchedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}watched_at'])!,
    );
  }

  @override
  $WatchHistoryEntriesTable createAlias(String alias) {
    return $WatchHistoryEntriesTable(attachedDatabase, alias);
  }
}

class WatchHistoryEntry extends DataClass
    implements Insertable<WatchHistoryEntry> {
  final int id;
  final String title;
  final String? posterPath;
  final String mediaType;
  final DateTime watchedAt;
  const WatchHistoryEntry(
      {required this.id,
      required this.title,
      this.posterPath,
      required this.mediaType,
      required this.watchedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['title'] = Variable<String>(title);
    if (!nullToAbsent || posterPath != null) {
      map['poster_path'] = Variable<String>(posterPath);
    }
    map['media_type'] = Variable<String>(mediaType);
    map['watched_at'] = Variable<DateTime>(watchedAt);
    return map;
  }

  WatchHistoryEntriesCompanion toCompanion(bool nullToAbsent) {
    return WatchHistoryEntriesCompanion(
      id: Value(id),
      title: Value(title),
      posterPath: posterPath == null && nullToAbsent
          ? const Value.absent()
          : Value(posterPath),
      mediaType: Value(mediaType),
      watchedAt: Value(watchedAt),
    );
  }

  factory WatchHistoryEntry.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return WatchHistoryEntry(
      id: serializer.fromJson<int>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      posterPath: serializer.fromJson<String?>(json['posterPath']),
      mediaType: serializer.fromJson<String>(json['mediaType']),
      watchedAt: serializer.fromJson<DateTime>(json['watchedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'title': serializer.toJson<String>(title),
      'posterPath': serializer.toJson<String?>(posterPath),
      'mediaType': serializer.toJson<String>(mediaType),
      'watchedAt': serializer.toJson<DateTime>(watchedAt),
    };
  }

  WatchHistoryEntry copyWith(
          {int? id,
          String? title,
          Value<String?> posterPath = const Value.absent(),
          String? mediaType,
          DateTime? watchedAt}) =>
      WatchHistoryEntry(
        id: id ?? this.id,
        title: title ?? this.title,
        posterPath: posterPath.present ? posterPath.value : this.posterPath,
        mediaType: mediaType ?? this.mediaType,
        watchedAt: watchedAt ?? this.watchedAt,
      );
  WatchHistoryEntry copyWithCompanion(WatchHistoryEntriesCompanion data) {
    return WatchHistoryEntry(
      id: data.id.present ? data.id.value : this.id,
      title: data.title.present ? data.title.value : this.title,
      posterPath:
          data.posterPath.present ? data.posterPath.value : this.posterPath,
      mediaType: data.mediaType.present ? data.mediaType.value : this.mediaType,
      watchedAt: data.watchedAt.present ? data.watchedAt.value : this.watchedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('WatchHistoryEntry(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('posterPath: $posterPath, ')
          ..write('mediaType: $mediaType, ')
          ..write('watchedAt: $watchedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, title, posterPath, mediaType, watchedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is WatchHistoryEntry &&
          other.id == this.id &&
          other.title == this.title &&
          other.posterPath == this.posterPath &&
          other.mediaType == this.mediaType &&
          other.watchedAt == this.watchedAt);
}

class WatchHistoryEntriesCompanion extends UpdateCompanion<WatchHistoryEntry> {
  final Value<int> id;
  final Value<String> title;
  final Value<String?> posterPath;
  final Value<String> mediaType;
  final Value<DateTime> watchedAt;
  final Value<int> rowid;
  const WatchHistoryEntriesCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.posterPath = const Value.absent(),
    this.mediaType = const Value.absent(),
    this.watchedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  WatchHistoryEntriesCompanion.insert({
    required int id,
    required String title,
    this.posterPath = const Value.absent(),
    this.mediaType = const Value.absent(),
    this.watchedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        title = Value(title);
  static Insertable<WatchHistoryEntry> custom({
    Expression<int>? id,
    Expression<String>? title,
    Expression<String>? posterPath,
    Expression<String>? mediaType,
    Expression<DateTime>? watchedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (posterPath != null) 'poster_path': posterPath,
      if (mediaType != null) 'media_type': mediaType,
      if (watchedAt != null) 'watched_at': watchedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  WatchHistoryEntriesCompanion copyWith(
      {Value<int>? id,
      Value<String>? title,
      Value<String?>? posterPath,
      Value<String>? mediaType,
      Value<DateTime>? watchedAt,
      Value<int>? rowid}) {
    return WatchHistoryEntriesCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      posterPath: posterPath ?? this.posterPath,
      mediaType: mediaType ?? this.mediaType,
      watchedAt: watchedAt ?? this.watchedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (posterPath.present) {
      map['poster_path'] = Variable<String>(posterPath.value);
    }
    if (mediaType.present) {
      map['media_type'] = Variable<String>(mediaType.value);
    }
    if (watchedAt.present) {
      map['watched_at'] = Variable<DateTime>(watchedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('WatchHistoryEntriesCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('posterPath: $posterPath, ')
          ..write('mediaType: $mediaType, ')
          ..write('watchedAt: $watchedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $CachedMediaEntriesTable extends CachedMediaEntries
    with TableInfo<$CachedMediaEntriesTable, CachedMediaEntry> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CachedMediaEntriesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _overviewMeta =
      const VerificationMeta('overview');
  @override
  late final GeneratedColumn<String> overview = GeneratedColumn<String>(
      'overview', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _posterPathMeta =
      const VerificationMeta('posterPath');
  @override
  late final GeneratedColumn<String> posterPath = GeneratedColumn<String>(
      'poster_path', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _backdropPathMeta =
      const VerificationMeta('backdropPath');
  @override
  late final GeneratedColumn<String> backdropPath = GeneratedColumn<String>(
      'backdrop_path', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _voteAverageMeta =
      const VerificationMeta('voteAverage');
  @override
  late final GeneratedColumn<double> voteAverage = GeneratedColumn<double>(
      'vote_average', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _releaseDateMeta =
      const VerificationMeta('releaseDate');
  @override
  late final GeneratedColumn<String> releaseDate = GeneratedColumn<String>(
      'release_date', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _categoryMeta =
      const VerificationMeta('category');
  @override
  late final GeneratedColumn<String> category = GeneratedColumn<String>(
      'category', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _mediaTypeMeta =
      const VerificationMeta('mediaType');
  @override
  late final GeneratedColumn<String> mediaType = GeneratedColumn<String>(
      'media_type', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant('movie'));
  static const VerificationMeta _cachedAtMeta =
      const VerificationMeta('cachedAt');
  @override
  late final GeneratedColumn<DateTime> cachedAt = GeneratedColumn<DateTime>(
      'cached_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        title,
        overview,
        posterPath,
        backdropPath,
        voteAverage,
        releaseDate,
        category,
        mediaType,
        cachedAt
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'cached_media_entries';
  @override
  VerificationContext validateIntegrity(Insertable<CachedMediaEntry> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('overview')) {
      context.handle(_overviewMeta,
          overview.isAcceptableOrUnknown(data['overview']!, _overviewMeta));
    } else if (isInserting) {
      context.missing(_overviewMeta);
    }
    if (data.containsKey('poster_path')) {
      context.handle(
          _posterPathMeta,
          posterPath.isAcceptableOrUnknown(
              data['poster_path']!, _posterPathMeta));
    }
    if (data.containsKey('backdrop_path')) {
      context.handle(
          _backdropPathMeta,
          backdropPath.isAcceptableOrUnknown(
              data['backdrop_path']!, _backdropPathMeta));
    }
    if (data.containsKey('vote_average')) {
      context.handle(
          _voteAverageMeta,
          voteAverage.isAcceptableOrUnknown(
              data['vote_average']!, _voteAverageMeta));
    } else if (isInserting) {
      context.missing(_voteAverageMeta);
    }
    if (data.containsKey('release_date')) {
      context.handle(
          _releaseDateMeta,
          releaseDate.isAcceptableOrUnknown(
              data['release_date']!, _releaseDateMeta));
    } else if (isInserting) {
      context.missing(_releaseDateMeta);
    }
    if (data.containsKey('category')) {
      context.handle(_categoryMeta,
          category.isAcceptableOrUnknown(data['category']!, _categoryMeta));
    } else if (isInserting) {
      context.missing(_categoryMeta);
    }
    if (data.containsKey('media_type')) {
      context.handle(_mediaTypeMeta,
          mediaType.isAcceptableOrUnknown(data['media_type']!, _mediaTypeMeta));
    }
    if (data.containsKey('cached_at')) {
      context.handle(_cachedAtMeta,
          cachedAt.isAcceptableOrUnknown(data['cached_at']!, _cachedAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id, category, mediaType};
  @override
  CachedMediaEntry map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CachedMediaEntry(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      title: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}title'])!,
      overview: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}overview'])!,
      posterPath: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}poster_path']),
      backdropPath: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}backdrop_path']),
      voteAverage: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}vote_average'])!,
      releaseDate: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}release_date'])!,
      category: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}category'])!,
      mediaType: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}media_type'])!,
      cachedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}cached_at'])!,
    );
  }

  @override
  $CachedMediaEntriesTable createAlias(String alias) {
    return $CachedMediaEntriesTable(attachedDatabase, alias);
  }
}

class CachedMediaEntry extends DataClass
    implements Insertable<CachedMediaEntry> {
  final int id;
  final String title;
  final String overview;
  final String? posterPath;
  final String? backdropPath;
  final double voteAverage;
  final String releaseDate;
  final String category;
  final String mediaType;
  final DateTime cachedAt;
  const CachedMediaEntry(
      {required this.id,
      required this.title,
      required this.overview,
      this.posterPath,
      this.backdropPath,
      required this.voteAverage,
      required this.releaseDate,
      required this.category,
      required this.mediaType,
      required this.cachedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['title'] = Variable<String>(title);
    map['overview'] = Variable<String>(overview);
    if (!nullToAbsent || posterPath != null) {
      map['poster_path'] = Variable<String>(posterPath);
    }
    if (!nullToAbsent || backdropPath != null) {
      map['backdrop_path'] = Variable<String>(backdropPath);
    }
    map['vote_average'] = Variable<double>(voteAverage);
    map['release_date'] = Variable<String>(releaseDate);
    map['category'] = Variable<String>(category);
    map['media_type'] = Variable<String>(mediaType);
    map['cached_at'] = Variable<DateTime>(cachedAt);
    return map;
  }

  CachedMediaEntriesCompanion toCompanion(bool nullToAbsent) {
    return CachedMediaEntriesCompanion(
      id: Value(id),
      title: Value(title),
      overview: Value(overview),
      posterPath: posterPath == null && nullToAbsent
          ? const Value.absent()
          : Value(posterPath),
      backdropPath: backdropPath == null && nullToAbsent
          ? const Value.absent()
          : Value(backdropPath),
      voteAverage: Value(voteAverage),
      releaseDate: Value(releaseDate),
      category: Value(category),
      mediaType: Value(mediaType),
      cachedAt: Value(cachedAt),
    );
  }

  factory CachedMediaEntry.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CachedMediaEntry(
      id: serializer.fromJson<int>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      overview: serializer.fromJson<String>(json['overview']),
      posterPath: serializer.fromJson<String?>(json['posterPath']),
      backdropPath: serializer.fromJson<String?>(json['backdropPath']),
      voteAverage: serializer.fromJson<double>(json['voteAverage']),
      releaseDate: serializer.fromJson<String>(json['releaseDate']),
      category: serializer.fromJson<String>(json['category']),
      mediaType: serializer.fromJson<String>(json['mediaType']),
      cachedAt: serializer.fromJson<DateTime>(json['cachedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'title': serializer.toJson<String>(title),
      'overview': serializer.toJson<String>(overview),
      'posterPath': serializer.toJson<String?>(posterPath),
      'backdropPath': serializer.toJson<String?>(backdropPath),
      'voteAverage': serializer.toJson<double>(voteAverage),
      'releaseDate': serializer.toJson<String>(releaseDate),
      'category': serializer.toJson<String>(category),
      'mediaType': serializer.toJson<String>(mediaType),
      'cachedAt': serializer.toJson<DateTime>(cachedAt),
    };
  }

  CachedMediaEntry copyWith(
          {int? id,
          String? title,
          String? overview,
          Value<String?> posterPath = const Value.absent(),
          Value<String?> backdropPath = const Value.absent(),
          double? voteAverage,
          String? releaseDate,
          String? category,
          String? mediaType,
          DateTime? cachedAt}) =>
      CachedMediaEntry(
        id: id ?? this.id,
        title: title ?? this.title,
        overview: overview ?? this.overview,
        posterPath: posterPath.present ? posterPath.value : this.posterPath,
        backdropPath:
            backdropPath.present ? backdropPath.value : this.backdropPath,
        voteAverage: voteAverage ?? this.voteAverage,
        releaseDate: releaseDate ?? this.releaseDate,
        category: category ?? this.category,
        mediaType: mediaType ?? this.mediaType,
        cachedAt: cachedAt ?? this.cachedAt,
      );
  CachedMediaEntry copyWithCompanion(CachedMediaEntriesCompanion data) {
    return CachedMediaEntry(
      id: data.id.present ? data.id.value : this.id,
      title: data.title.present ? data.title.value : this.title,
      overview: data.overview.present ? data.overview.value : this.overview,
      posterPath:
          data.posterPath.present ? data.posterPath.value : this.posterPath,
      backdropPath: data.backdropPath.present
          ? data.backdropPath.value
          : this.backdropPath,
      voteAverage:
          data.voteAverage.present ? data.voteAverage.value : this.voteAverage,
      releaseDate:
          data.releaseDate.present ? data.releaseDate.value : this.releaseDate,
      category: data.category.present ? data.category.value : this.category,
      mediaType: data.mediaType.present ? data.mediaType.value : this.mediaType,
      cachedAt: data.cachedAt.present ? data.cachedAt.value : this.cachedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CachedMediaEntry(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('overview: $overview, ')
          ..write('posterPath: $posterPath, ')
          ..write('backdropPath: $backdropPath, ')
          ..write('voteAverage: $voteAverage, ')
          ..write('releaseDate: $releaseDate, ')
          ..write('category: $category, ')
          ..write('mediaType: $mediaType, ')
          ..write('cachedAt: $cachedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, title, overview, posterPath, backdropPath,
      voteAverage, releaseDate, category, mediaType, cachedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CachedMediaEntry &&
          other.id == this.id &&
          other.title == this.title &&
          other.overview == this.overview &&
          other.posterPath == this.posterPath &&
          other.backdropPath == this.backdropPath &&
          other.voteAverage == this.voteAverage &&
          other.releaseDate == this.releaseDate &&
          other.category == this.category &&
          other.mediaType == this.mediaType &&
          other.cachedAt == this.cachedAt);
}

class CachedMediaEntriesCompanion extends UpdateCompanion<CachedMediaEntry> {
  final Value<int> id;
  final Value<String> title;
  final Value<String> overview;
  final Value<String?> posterPath;
  final Value<String?> backdropPath;
  final Value<double> voteAverage;
  final Value<String> releaseDate;
  final Value<String> category;
  final Value<String> mediaType;
  final Value<DateTime> cachedAt;
  final Value<int> rowid;
  const CachedMediaEntriesCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.overview = const Value.absent(),
    this.posterPath = const Value.absent(),
    this.backdropPath = const Value.absent(),
    this.voteAverage = const Value.absent(),
    this.releaseDate = const Value.absent(),
    this.category = const Value.absent(),
    this.mediaType = const Value.absent(),
    this.cachedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  CachedMediaEntriesCompanion.insert({
    required int id,
    required String title,
    required String overview,
    this.posterPath = const Value.absent(),
    this.backdropPath = const Value.absent(),
    required double voteAverage,
    required String releaseDate,
    required String category,
    this.mediaType = const Value.absent(),
    this.cachedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        title = Value(title),
        overview = Value(overview),
        voteAverage = Value(voteAverage),
        releaseDate = Value(releaseDate),
        category = Value(category);
  static Insertable<CachedMediaEntry> custom({
    Expression<int>? id,
    Expression<String>? title,
    Expression<String>? overview,
    Expression<String>? posterPath,
    Expression<String>? backdropPath,
    Expression<double>? voteAverage,
    Expression<String>? releaseDate,
    Expression<String>? category,
    Expression<String>? mediaType,
    Expression<DateTime>? cachedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (overview != null) 'overview': overview,
      if (posterPath != null) 'poster_path': posterPath,
      if (backdropPath != null) 'backdrop_path': backdropPath,
      if (voteAverage != null) 'vote_average': voteAverage,
      if (releaseDate != null) 'release_date': releaseDate,
      if (category != null) 'category': category,
      if (mediaType != null) 'media_type': mediaType,
      if (cachedAt != null) 'cached_at': cachedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  CachedMediaEntriesCompanion copyWith(
      {Value<int>? id,
      Value<String>? title,
      Value<String>? overview,
      Value<String?>? posterPath,
      Value<String?>? backdropPath,
      Value<double>? voteAverage,
      Value<String>? releaseDate,
      Value<String>? category,
      Value<String>? mediaType,
      Value<DateTime>? cachedAt,
      Value<int>? rowid}) {
    return CachedMediaEntriesCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      overview: overview ?? this.overview,
      posterPath: posterPath ?? this.posterPath,
      backdropPath: backdropPath ?? this.backdropPath,
      voteAverage: voteAverage ?? this.voteAverage,
      releaseDate: releaseDate ?? this.releaseDate,
      category: category ?? this.category,
      mediaType: mediaType ?? this.mediaType,
      cachedAt: cachedAt ?? this.cachedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (overview.present) {
      map['overview'] = Variable<String>(overview.value);
    }
    if (posterPath.present) {
      map['poster_path'] = Variable<String>(posterPath.value);
    }
    if (backdropPath.present) {
      map['backdrop_path'] = Variable<String>(backdropPath.value);
    }
    if (voteAverage.present) {
      map['vote_average'] = Variable<double>(voteAverage.value);
    }
    if (releaseDate.present) {
      map['release_date'] = Variable<String>(releaseDate.value);
    }
    if (category.present) {
      map['category'] = Variable<String>(category.value);
    }
    if (mediaType.present) {
      map['media_type'] = Variable<String>(mediaType.value);
    }
    if (cachedAt.present) {
      map['cached_at'] = Variable<DateTime>(cachedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CachedMediaEntriesCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('overview: $overview, ')
          ..write('posterPath: $posterPath, ')
          ..write('backdropPath: $backdropPath, ')
          ..write('voteAverage: $voteAverage, ')
          ..write('releaseDate: $releaseDate, ')
          ..write('category: $category, ')
          ..write('mediaType: $mediaType, ')
          ..write('cachedAt: $cachedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $SearchHistoryEntriesTable extends SearchHistoryEntries
    with TableInfo<$SearchHistoryEntriesTable, SearchHistoryEntry> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SearchHistoryEntriesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _queryMeta = const VerificationMeta('query');
  @override
  late final GeneratedColumn<String> query = GeneratedColumn<String>(
      'query', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _searchedAtMeta =
      const VerificationMeta('searchedAt');
  @override
  late final GeneratedColumn<DateTime> searchedAt = GeneratedColumn<DateTime>(
      'searched_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  @override
  List<GeneratedColumn> get $columns => [query, searchedAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'search_history_entries';
  @override
  VerificationContext validateIntegrity(Insertable<SearchHistoryEntry> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('query')) {
      context.handle(
          _queryMeta, query.isAcceptableOrUnknown(data['query']!, _queryMeta));
    } else if (isInserting) {
      context.missing(_queryMeta);
    }
    if (data.containsKey('searched_at')) {
      context.handle(
          _searchedAtMeta,
          searchedAt.isAcceptableOrUnknown(
              data['searched_at']!, _searchedAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {query};
  @override
  SearchHistoryEntry map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SearchHistoryEntry(
      query: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}query'])!,
      searchedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}searched_at'])!,
    );
  }

  @override
  $SearchHistoryEntriesTable createAlias(String alias) {
    return $SearchHistoryEntriesTable(attachedDatabase, alias);
  }
}

class SearchHistoryEntry extends DataClass
    implements Insertable<SearchHistoryEntry> {
  final String query;
  final DateTime searchedAt;
  const SearchHistoryEntry({required this.query, required this.searchedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['query'] = Variable<String>(query);
    map['searched_at'] = Variable<DateTime>(searchedAt);
    return map;
  }

  SearchHistoryEntriesCompanion toCompanion(bool nullToAbsent) {
    return SearchHistoryEntriesCompanion(
      query: Value(query),
      searchedAt: Value(searchedAt),
    );
  }

  factory SearchHistoryEntry.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SearchHistoryEntry(
      query: serializer.fromJson<String>(json['query']),
      searchedAt: serializer.fromJson<DateTime>(json['searchedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'query': serializer.toJson<String>(query),
      'searchedAt': serializer.toJson<DateTime>(searchedAt),
    };
  }

  SearchHistoryEntry copyWith({String? query, DateTime? searchedAt}) =>
      SearchHistoryEntry(
        query: query ?? this.query,
        searchedAt: searchedAt ?? this.searchedAt,
      );
  SearchHistoryEntry copyWithCompanion(SearchHistoryEntriesCompanion data) {
    return SearchHistoryEntry(
      query: data.query.present ? data.query.value : this.query,
      searchedAt:
          data.searchedAt.present ? data.searchedAt.value : this.searchedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('SearchHistoryEntry(')
          ..write('query: $query, ')
          ..write('searchedAt: $searchedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(query, searchedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SearchHistoryEntry &&
          other.query == this.query &&
          other.searchedAt == this.searchedAt);
}

class SearchHistoryEntriesCompanion
    extends UpdateCompanion<SearchHistoryEntry> {
  final Value<String> query;
  final Value<DateTime> searchedAt;
  final Value<int> rowid;
  const SearchHistoryEntriesCompanion({
    this.query = const Value.absent(),
    this.searchedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  SearchHistoryEntriesCompanion.insert({
    required String query,
    this.searchedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : query = Value(query);
  static Insertable<SearchHistoryEntry> custom({
    Expression<String>? query,
    Expression<DateTime>? searchedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (query != null) 'query': query,
      if (searchedAt != null) 'searched_at': searchedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  SearchHistoryEntriesCompanion copyWith(
      {Value<String>? query, Value<DateTime>? searchedAt, Value<int>? rowid}) {
    return SearchHistoryEntriesCompanion(
      query: query ?? this.query,
      searchedAt: searchedAt ?? this.searchedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (query.present) {
      map['query'] = Variable<String>(query.value);
    }
    if (searchedAt.present) {
      map['searched_at'] = Variable<DateTime>(searchedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SearchHistoryEntriesCompanion(')
          ..write('query: $query, ')
          ..write('searchedAt: $searchedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $WatchlistEntriesTable watchlistEntries =
      $WatchlistEntriesTable(this);
  late final $FavoriteEntriesTable favoriteEntries =
      $FavoriteEntriesTable(this);
  late final $WatchHistoryEntriesTable watchHistoryEntries =
      $WatchHistoryEntriesTable(this);
  late final $CachedMediaEntriesTable cachedMediaEntries =
      $CachedMediaEntriesTable(this);
  late final $SearchHistoryEntriesTable searchHistoryEntries =
      $SearchHistoryEntriesTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
        watchlistEntries,
        favoriteEntries,
        watchHistoryEntries,
        cachedMediaEntries,
        searchHistoryEntries
      ];
}

typedef $$WatchlistEntriesTableCreateCompanionBuilder
    = WatchlistEntriesCompanion Function({
  required int id,
  required String title,
  Value<String?> posterPath,
  Value<String?> backdropPath,
  required double voteAverage,
  required String releaseDate,
  Value<String> mediaType,
  Value<DateTime> addedAt,
  Value<int> rowid,
});
typedef $$WatchlistEntriesTableUpdateCompanionBuilder
    = WatchlistEntriesCompanion Function({
  Value<int> id,
  Value<String> title,
  Value<String?> posterPath,
  Value<String?> backdropPath,
  Value<double> voteAverage,
  Value<String> releaseDate,
  Value<String> mediaType,
  Value<DateTime> addedAt,
  Value<int> rowid,
});

class $$WatchlistEntriesTableFilterComposer
    extends Composer<_$AppDatabase, $WatchlistEntriesTable> {
  $$WatchlistEntriesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get posterPath => $composableBuilder(
      column: $table.posterPath, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get backdropPath => $composableBuilder(
      column: $table.backdropPath, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get voteAverage => $composableBuilder(
      column: $table.voteAverage, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get releaseDate => $composableBuilder(
      column: $table.releaseDate, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get mediaType => $composableBuilder(
      column: $table.mediaType, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get addedAt => $composableBuilder(
      column: $table.addedAt, builder: (column) => ColumnFilters(column));
}

class $$WatchlistEntriesTableOrderingComposer
    extends Composer<_$AppDatabase, $WatchlistEntriesTable> {
  $$WatchlistEntriesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get posterPath => $composableBuilder(
      column: $table.posterPath, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get backdropPath => $composableBuilder(
      column: $table.backdropPath,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get voteAverage => $composableBuilder(
      column: $table.voteAverage, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get releaseDate => $composableBuilder(
      column: $table.releaseDate, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get mediaType => $composableBuilder(
      column: $table.mediaType, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get addedAt => $composableBuilder(
      column: $table.addedAt, builder: (column) => ColumnOrderings(column));
}

class $$WatchlistEntriesTableAnnotationComposer
    extends Composer<_$AppDatabase, $WatchlistEntriesTable> {
  $$WatchlistEntriesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get posterPath => $composableBuilder(
      column: $table.posterPath, builder: (column) => column);

  GeneratedColumn<String> get backdropPath => $composableBuilder(
      column: $table.backdropPath, builder: (column) => column);

  GeneratedColumn<double> get voteAverage => $composableBuilder(
      column: $table.voteAverage, builder: (column) => column);

  GeneratedColumn<String> get releaseDate => $composableBuilder(
      column: $table.releaseDate, builder: (column) => column);

  GeneratedColumn<String> get mediaType =>
      $composableBuilder(column: $table.mediaType, builder: (column) => column);

  GeneratedColumn<DateTime> get addedAt =>
      $composableBuilder(column: $table.addedAt, builder: (column) => column);
}

class $$WatchlistEntriesTableTableManager extends RootTableManager<
    _$AppDatabase,
    $WatchlistEntriesTable,
    WatchlistEntry,
    $$WatchlistEntriesTableFilterComposer,
    $$WatchlistEntriesTableOrderingComposer,
    $$WatchlistEntriesTableAnnotationComposer,
    $$WatchlistEntriesTableCreateCompanionBuilder,
    $$WatchlistEntriesTableUpdateCompanionBuilder,
    (
      WatchlistEntry,
      BaseReferences<_$AppDatabase, $WatchlistEntriesTable, WatchlistEntry>
    ),
    WatchlistEntry,
    PrefetchHooks Function()> {
  $$WatchlistEntriesTableTableManager(
      _$AppDatabase db, $WatchlistEntriesTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$WatchlistEntriesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$WatchlistEntriesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$WatchlistEntriesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> title = const Value.absent(),
            Value<String?> posterPath = const Value.absent(),
            Value<String?> backdropPath = const Value.absent(),
            Value<double> voteAverage = const Value.absent(),
            Value<String> releaseDate = const Value.absent(),
            Value<String> mediaType = const Value.absent(),
            Value<DateTime> addedAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              WatchlistEntriesCompanion(
            id: id,
            title: title,
            posterPath: posterPath,
            backdropPath: backdropPath,
            voteAverage: voteAverage,
            releaseDate: releaseDate,
            mediaType: mediaType,
            addedAt: addedAt,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required int id,
            required String title,
            Value<String?> posterPath = const Value.absent(),
            Value<String?> backdropPath = const Value.absent(),
            required double voteAverage,
            required String releaseDate,
            Value<String> mediaType = const Value.absent(),
            Value<DateTime> addedAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              WatchlistEntriesCompanion.insert(
            id: id,
            title: title,
            posterPath: posterPath,
            backdropPath: backdropPath,
            voteAverage: voteAverage,
            releaseDate: releaseDate,
            mediaType: mediaType,
            addedAt: addedAt,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$WatchlistEntriesTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $WatchlistEntriesTable,
    WatchlistEntry,
    $$WatchlistEntriesTableFilterComposer,
    $$WatchlistEntriesTableOrderingComposer,
    $$WatchlistEntriesTableAnnotationComposer,
    $$WatchlistEntriesTableCreateCompanionBuilder,
    $$WatchlistEntriesTableUpdateCompanionBuilder,
    (
      WatchlistEntry,
      BaseReferences<_$AppDatabase, $WatchlistEntriesTable, WatchlistEntry>
    ),
    WatchlistEntry,
    PrefetchHooks Function()>;
typedef $$FavoriteEntriesTableCreateCompanionBuilder = FavoriteEntriesCompanion
    Function({
  required int id,
  required String title,
  Value<String?> posterPath,
  Value<String?> backdropPath,
  required double voteAverage,
  required String releaseDate,
  Value<String> mediaType,
  Value<DateTime> addedAt,
  Value<int> rowid,
});
typedef $$FavoriteEntriesTableUpdateCompanionBuilder = FavoriteEntriesCompanion
    Function({
  Value<int> id,
  Value<String> title,
  Value<String?> posterPath,
  Value<String?> backdropPath,
  Value<double> voteAverage,
  Value<String> releaseDate,
  Value<String> mediaType,
  Value<DateTime> addedAt,
  Value<int> rowid,
});

class $$FavoriteEntriesTableFilterComposer
    extends Composer<_$AppDatabase, $FavoriteEntriesTable> {
  $$FavoriteEntriesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get posterPath => $composableBuilder(
      column: $table.posterPath, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get backdropPath => $composableBuilder(
      column: $table.backdropPath, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get voteAverage => $composableBuilder(
      column: $table.voteAverage, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get releaseDate => $composableBuilder(
      column: $table.releaseDate, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get mediaType => $composableBuilder(
      column: $table.mediaType, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get addedAt => $composableBuilder(
      column: $table.addedAt, builder: (column) => ColumnFilters(column));
}

class $$FavoriteEntriesTableOrderingComposer
    extends Composer<_$AppDatabase, $FavoriteEntriesTable> {
  $$FavoriteEntriesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get posterPath => $composableBuilder(
      column: $table.posterPath, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get backdropPath => $composableBuilder(
      column: $table.backdropPath,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get voteAverage => $composableBuilder(
      column: $table.voteAverage, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get releaseDate => $composableBuilder(
      column: $table.releaseDate, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get mediaType => $composableBuilder(
      column: $table.mediaType, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get addedAt => $composableBuilder(
      column: $table.addedAt, builder: (column) => ColumnOrderings(column));
}

class $$FavoriteEntriesTableAnnotationComposer
    extends Composer<_$AppDatabase, $FavoriteEntriesTable> {
  $$FavoriteEntriesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get posterPath => $composableBuilder(
      column: $table.posterPath, builder: (column) => column);

  GeneratedColumn<String> get backdropPath => $composableBuilder(
      column: $table.backdropPath, builder: (column) => column);

  GeneratedColumn<double> get voteAverage => $composableBuilder(
      column: $table.voteAverage, builder: (column) => column);

  GeneratedColumn<String> get releaseDate => $composableBuilder(
      column: $table.releaseDate, builder: (column) => column);

  GeneratedColumn<String> get mediaType =>
      $composableBuilder(column: $table.mediaType, builder: (column) => column);

  GeneratedColumn<DateTime> get addedAt =>
      $composableBuilder(column: $table.addedAt, builder: (column) => column);
}

class $$FavoriteEntriesTableTableManager extends RootTableManager<
    _$AppDatabase,
    $FavoriteEntriesTable,
    FavoriteEntry,
    $$FavoriteEntriesTableFilterComposer,
    $$FavoriteEntriesTableOrderingComposer,
    $$FavoriteEntriesTableAnnotationComposer,
    $$FavoriteEntriesTableCreateCompanionBuilder,
    $$FavoriteEntriesTableUpdateCompanionBuilder,
    (
      FavoriteEntry,
      BaseReferences<_$AppDatabase, $FavoriteEntriesTable, FavoriteEntry>
    ),
    FavoriteEntry,
    PrefetchHooks Function()> {
  $$FavoriteEntriesTableTableManager(
      _$AppDatabase db, $FavoriteEntriesTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$FavoriteEntriesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$FavoriteEntriesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$FavoriteEntriesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> title = const Value.absent(),
            Value<String?> posterPath = const Value.absent(),
            Value<String?> backdropPath = const Value.absent(),
            Value<double> voteAverage = const Value.absent(),
            Value<String> releaseDate = const Value.absent(),
            Value<String> mediaType = const Value.absent(),
            Value<DateTime> addedAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              FavoriteEntriesCompanion(
            id: id,
            title: title,
            posterPath: posterPath,
            backdropPath: backdropPath,
            voteAverage: voteAverage,
            releaseDate: releaseDate,
            mediaType: mediaType,
            addedAt: addedAt,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required int id,
            required String title,
            Value<String?> posterPath = const Value.absent(),
            Value<String?> backdropPath = const Value.absent(),
            required double voteAverage,
            required String releaseDate,
            Value<String> mediaType = const Value.absent(),
            Value<DateTime> addedAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              FavoriteEntriesCompanion.insert(
            id: id,
            title: title,
            posterPath: posterPath,
            backdropPath: backdropPath,
            voteAverage: voteAverage,
            releaseDate: releaseDate,
            mediaType: mediaType,
            addedAt: addedAt,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$FavoriteEntriesTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $FavoriteEntriesTable,
    FavoriteEntry,
    $$FavoriteEntriesTableFilterComposer,
    $$FavoriteEntriesTableOrderingComposer,
    $$FavoriteEntriesTableAnnotationComposer,
    $$FavoriteEntriesTableCreateCompanionBuilder,
    $$FavoriteEntriesTableUpdateCompanionBuilder,
    (
      FavoriteEntry,
      BaseReferences<_$AppDatabase, $FavoriteEntriesTable, FavoriteEntry>
    ),
    FavoriteEntry,
    PrefetchHooks Function()>;
typedef $$WatchHistoryEntriesTableCreateCompanionBuilder
    = WatchHistoryEntriesCompanion Function({
  required int id,
  required String title,
  Value<String?> posterPath,
  Value<String> mediaType,
  Value<DateTime> watchedAt,
  Value<int> rowid,
});
typedef $$WatchHistoryEntriesTableUpdateCompanionBuilder
    = WatchHistoryEntriesCompanion Function({
  Value<int> id,
  Value<String> title,
  Value<String?> posterPath,
  Value<String> mediaType,
  Value<DateTime> watchedAt,
  Value<int> rowid,
});

class $$WatchHistoryEntriesTableFilterComposer
    extends Composer<_$AppDatabase, $WatchHistoryEntriesTable> {
  $$WatchHistoryEntriesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get posterPath => $composableBuilder(
      column: $table.posterPath, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get mediaType => $composableBuilder(
      column: $table.mediaType, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get watchedAt => $composableBuilder(
      column: $table.watchedAt, builder: (column) => ColumnFilters(column));
}

class $$WatchHistoryEntriesTableOrderingComposer
    extends Composer<_$AppDatabase, $WatchHistoryEntriesTable> {
  $$WatchHistoryEntriesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get posterPath => $composableBuilder(
      column: $table.posterPath, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get mediaType => $composableBuilder(
      column: $table.mediaType, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get watchedAt => $composableBuilder(
      column: $table.watchedAt, builder: (column) => ColumnOrderings(column));
}

class $$WatchHistoryEntriesTableAnnotationComposer
    extends Composer<_$AppDatabase, $WatchHistoryEntriesTable> {
  $$WatchHistoryEntriesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get posterPath => $composableBuilder(
      column: $table.posterPath, builder: (column) => column);

  GeneratedColumn<String> get mediaType =>
      $composableBuilder(column: $table.mediaType, builder: (column) => column);

  GeneratedColumn<DateTime> get watchedAt =>
      $composableBuilder(column: $table.watchedAt, builder: (column) => column);
}

class $$WatchHistoryEntriesTableTableManager extends RootTableManager<
    _$AppDatabase,
    $WatchHistoryEntriesTable,
    WatchHistoryEntry,
    $$WatchHistoryEntriesTableFilterComposer,
    $$WatchHistoryEntriesTableOrderingComposer,
    $$WatchHistoryEntriesTableAnnotationComposer,
    $$WatchHistoryEntriesTableCreateCompanionBuilder,
    $$WatchHistoryEntriesTableUpdateCompanionBuilder,
    (
      WatchHistoryEntry,
      BaseReferences<_$AppDatabase, $WatchHistoryEntriesTable,
          WatchHistoryEntry>
    ),
    WatchHistoryEntry,
    PrefetchHooks Function()> {
  $$WatchHistoryEntriesTableTableManager(
      _$AppDatabase db, $WatchHistoryEntriesTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$WatchHistoryEntriesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$WatchHistoryEntriesTableOrderingComposer(
                  $db: db, $table: table),
          createComputedFieldComposer: () =>
              $$WatchHistoryEntriesTableAnnotationComposer(
                  $db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> title = const Value.absent(),
            Value<String?> posterPath = const Value.absent(),
            Value<String> mediaType = const Value.absent(),
            Value<DateTime> watchedAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              WatchHistoryEntriesCompanion(
            id: id,
            title: title,
            posterPath: posterPath,
            mediaType: mediaType,
            watchedAt: watchedAt,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required int id,
            required String title,
            Value<String?> posterPath = const Value.absent(),
            Value<String> mediaType = const Value.absent(),
            Value<DateTime> watchedAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              WatchHistoryEntriesCompanion.insert(
            id: id,
            title: title,
            posterPath: posterPath,
            mediaType: mediaType,
            watchedAt: watchedAt,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$WatchHistoryEntriesTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $WatchHistoryEntriesTable,
    WatchHistoryEntry,
    $$WatchHistoryEntriesTableFilterComposer,
    $$WatchHistoryEntriesTableOrderingComposer,
    $$WatchHistoryEntriesTableAnnotationComposer,
    $$WatchHistoryEntriesTableCreateCompanionBuilder,
    $$WatchHistoryEntriesTableUpdateCompanionBuilder,
    (
      WatchHistoryEntry,
      BaseReferences<_$AppDatabase, $WatchHistoryEntriesTable,
          WatchHistoryEntry>
    ),
    WatchHistoryEntry,
    PrefetchHooks Function()>;
typedef $$CachedMediaEntriesTableCreateCompanionBuilder
    = CachedMediaEntriesCompanion Function({
  required int id,
  required String title,
  required String overview,
  Value<String?> posterPath,
  Value<String?> backdropPath,
  required double voteAverage,
  required String releaseDate,
  required String category,
  Value<String> mediaType,
  Value<DateTime> cachedAt,
  Value<int> rowid,
});
typedef $$CachedMediaEntriesTableUpdateCompanionBuilder
    = CachedMediaEntriesCompanion Function({
  Value<int> id,
  Value<String> title,
  Value<String> overview,
  Value<String?> posterPath,
  Value<String?> backdropPath,
  Value<double> voteAverage,
  Value<String> releaseDate,
  Value<String> category,
  Value<String> mediaType,
  Value<DateTime> cachedAt,
  Value<int> rowid,
});

class $$CachedMediaEntriesTableFilterComposer
    extends Composer<_$AppDatabase, $CachedMediaEntriesTable> {
  $$CachedMediaEntriesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get overview => $composableBuilder(
      column: $table.overview, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get posterPath => $composableBuilder(
      column: $table.posterPath, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get backdropPath => $composableBuilder(
      column: $table.backdropPath, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get voteAverage => $composableBuilder(
      column: $table.voteAverage, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get releaseDate => $composableBuilder(
      column: $table.releaseDate, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get category => $composableBuilder(
      column: $table.category, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get mediaType => $composableBuilder(
      column: $table.mediaType, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get cachedAt => $composableBuilder(
      column: $table.cachedAt, builder: (column) => ColumnFilters(column));
}

class $$CachedMediaEntriesTableOrderingComposer
    extends Composer<_$AppDatabase, $CachedMediaEntriesTable> {
  $$CachedMediaEntriesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get overview => $composableBuilder(
      column: $table.overview, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get posterPath => $composableBuilder(
      column: $table.posterPath, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get backdropPath => $composableBuilder(
      column: $table.backdropPath,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get voteAverage => $composableBuilder(
      column: $table.voteAverage, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get releaseDate => $composableBuilder(
      column: $table.releaseDate, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get category => $composableBuilder(
      column: $table.category, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get mediaType => $composableBuilder(
      column: $table.mediaType, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get cachedAt => $composableBuilder(
      column: $table.cachedAt, builder: (column) => ColumnOrderings(column));
}

class $$CachedMediaEntriesTableAnnotationComposer
    extends Composer<_$AppDatabase, $CachedMediaEntriesTable> {
  $$CachedMediaEntriesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get overview =>
      $composableBuilder(column: $table.overview, builder: (column) => column);

  GeneratedColumn<String> get posterPath => $composableBuilder(
      column: $table.posterPath, builder: (column) => column);

  GeneratedColumn<String> get backdropPath => $composableBuilder(
      column: $table.backdropPath, builder: (column) => column);

  GeneratedColumn<double> get voteAverage => $composableBuilder(
      column: $table.voteAverage, builder: (column) => column);

  GeneratedColumn<String> get releaseDate => $composableBuilder(
      column: $table.releaseDate, builder: (column) => column);

  GeneratedColumn<String> get category =>
      $composableBuilder(column: $table.category, builder: (column) => column);

  GeneratedColumn<String> get mediaType =>
      $composableBuilder(column: $table.mediaType, builder: (column) => column);

  GeneratedColumn<DateTime> get cachedAt =>
      $composableBuilder(column: $table.cachedAt, builder: (column) => column);
}

class $$CachedMediaEntriesTableTableManager extends RootTableManager<
    _$AppDatabase,
    $CachedMediaEntriesTable,
    CachedMediaEntry,
    $$CachedMediaEntriesTableFilterComposer,
    $$CachedMediaEntriesTableOrderingComposer,
    $$CachedMediaEntriesTableAnnotationComposer,
    $$CachedMediaEntriesTableCreateCompanionBuilder,
    $$CachedMediaEntriesTableUpdateCompanionBuilder,
    (
      CachedMediaEntry,
      BaseReferences<_$AppDatabase, $CachedMediaEntriesTable, CachedMediaEntry>
    ),
    CachedMediaEntry,
    PrefetchHooks Function()> {
  $$CachedMediaEntriesTableTableManager(
      _$AppDatabase db, $CachedMediaEntriesTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CachedMediaEntriesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CachedMediaEntriesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CachedMediaEntriesTableAnnotationComposer(
                  $db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> title = const Value.absent(),
            Value<String> overview = const Value.absent(),
            Value<String?> posterPath = const Value.absent(),
            Value<String?> backdropPath = const Value.absent(),
            Value<double> voteAverage = const Value.absent(),
            Value<String> releaseDate = const Value.absent(),
            Value<String> category = const Value.absent(),
            Value<String> mediaType = const Value.absent(),
            Value<DateTime> cachedAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              CachedMediaEntriesCompanion(
            id: id,
            title: title,
            overview: overview,
            posterPath: posterPath,
            backdropPath: backdropPath,
            voteAverage: voteAverage,
            releaseDate: releaseDate,
            category: category,
            mediaType: mediaType,
            cachedAt: cachedAt,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required int id,
            required String title,
            required String overview,
            Value<String?> posterPath = const Value.absent(),
            Value<String?> backdropPath = const Value.absent(),
            required double voteAverage,
            required String releaseDate,
            required String category,
            Value<String> mediaType = const Value.absent(),
            Value<DateTime> cachedAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              CachedMediaEntriesCompanion.insert(
            id: id,
            title: title,
            overview: overview,
            posterPath: posterPath,
            backdropPath: backdropPath,
            voteAverage: voteAverage,
            releaseDate: releaseDate,
            category: category,
            mediaType: mediaType,
            cachedAt: cachedAt,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$CachedMediaEntriesTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $CachedMediaEntriesTable,
    CachedMediaEntry,
    $$CachedMediaEntriesTableFilterComposer,
    $$CachedMediaEntriesTableOrderingComposer,
    $$CachedMediaEntriesTableAnnotationComposer,
    $$CachedMediaEntriesTableCreateCompanionBuilder,
    $$CachedMediaEntriesTableUpdateCompanionBuilder,
    (
      CachedMediaEntry,
      BaseReferences<_$AppDatabase, $CachedMediaEntriesTable, CachedMediaEntry>
    ),
    CachedMediaEntry,
    PrefetchHooks Function()>;
typedef $$SearchHistoryEntriesTableCreateCompanionBuilder
    = SearchHistoryEntriesCompanion Function({
  required String query,
  Value<DateTime> searchedAt,
  Value<int> rowid,
});
typedef $$SearchHistoryEntriesTableUpdateCompanionBuilder
    = SearchHistoryEntriesCompanion Function({
  Value<String> query,
  Value<DateTime> searchedAt,
  Value<int> rowid,
});

class $$SearchHistoryEntriesTableFilterComposer
    extends Composer<_$AppDatabase, $SearchHistoryEntriesTable> {
  $$SearchHistoryEntriesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get query => $composableBuilder(
      column: $table.query, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get searchedAt => $composableBuilder(
      column: $table.searchedAt, builder: (column) => ColumnFilters(column));
}

class $$SearchHistoryEntriesTableOrderingComposer
    extends Composer<_$AppDatabase, $SearchHistoryEntriesTable> {
  $$SearchHistoryEntriesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get query => $composableBuilder(
      column: $table.query, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get searchedAt => $composableBuilder(
      column: $table.searchedAt, builder: (column) => ColumnOrderings(column));
}

class $$SearchHistoryEntriesTableAnnotationComposer
    extends Composer<_$AppDatabase, $SearchHistoryEntriesTable> {
  $$SearchHistoryEntriesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get query =>
      $composableBuilder(column: $table.query, builder: (column) => column);

  GeneratedColumn<DateTime> get searchedAt => $composableBuilder(
      column: $table.searchedAt, builder: (column) => column);
}

class $$SearchHistoryEntriesTableTableManager extends RootTableManager<
    _$AppDatabase,
    $SearchHistoryEntriesTable,
    SearchHistoryEntry,
    $$SearchHistoryEntriesTableFilterComposer,
    $$SearchHistoryEntriesTableOrderingComposer,
    $$SearchHistoryEntriesTableAnnotationComposer,
    $$SearchHistoryEntriesTableCreateCompanionBuilder,
    $$SearchHistoryEntriesTableUpdateCompanionBuilder,
    (
      SearchHistoryEntry,
      BaseReferences<_$AppDatabase, $SearchHistoryEntriesTable,
          SearchHistoryEntry>
    ),
    SearchHistoryEntry,
    PrefetchHooks Function()> {
  $$SearchHistoryEntriesTableTableManager(
      _$AppDatabase db, $SearchHistoryEntriesTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SearchHistoryEntriesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SearchHistoryEntriesTableOrderingComposer(
                  $db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SearchHistoryEntriesTableAnnotationComposer(
                  $db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> query = const Value.absent(),
            Value<DateTime> searchedAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              SearchHistoryEntriesCompanion(
            query: query,
            searchedAt: searchedAt,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String query,
            Value<DateTime> searchedAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              SearchHistoryEntriesCompanion.insert(
            query: query,
            searchedAt: searchedAt,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$SearchHistoryEntriesTableProcessedTableManager
    = ProcessedTableManager<
        _$AppDatabase,
        $SearchHistoryEntriesTable,
        SearchHistoryEntry,
        $$SearchHistoryEntriesTableFilterComposer,
        $$SearchHistoryEntriesTableOrderingComposer,
        $$SearchHistoryEntriesTableAnnotationComposer,
        $$SearchHistoryEntriesTableCreateCompanionBuilder,
        $$SearchHistoryEntriesTableUpdateCompanionBuilder,
        (
          SearchHistoryEntry,
          BaseReferences<_$AppDatabase, $SearchHistoryEntriesTable,
              SearchHistoryEntry>
        ),
        SearchHistoryEntry,
        PrefetchHooks Function()>;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$WatchlistEntriesTableTableManager get watchlistEntries =>
      $$WatchlistEntriesTableTableManager(_db, _db.watchlistEntries);
  $$FavoriteEntriesTableTableManager get favoriteEntries =>
      $$FavoriteEntriesTableTableManager(_db, _db.favoriteEntries);
  $$WatchHistoryEntriesTableTableManager get watchHistoryEntries =>
      $$WatchHistoryEntriesTableTableManager(_db, _db.watchHistoryEntries);
  $$CachedMediaEntriesTableTableManager get cachedMediaEntries =>
      $$CachedMediaEntriesTableTableManager(_db, _db.cachedMediaEntries);
  $$SearchHistoryEntriesTableTableManager get searchHistoryEntries =>
      $$SearchHistoryEntriesTableTableManager(_db, _db.searchHistoryEntries);
}
