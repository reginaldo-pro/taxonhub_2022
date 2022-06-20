// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'searchs_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SearchsEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(SearchType searchType) init,
    required TResult Function() import,
    required TResult Function(PlatformFile file) search,
    required TResult Function(List<Taxonomic>? taxonomicsList,
            List<Occurrence>? occurrenciesList, String fileName)
        export,
    required TResult Function() alert,
    required TResult Function() reset,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(SearchType searchType)? init,
    TResult Function()? import,
    TResult Function(PlatformFile file)? search,
    TResult Function(List<Taxonomic>? taxonomicsList,
            List<Occurrence>? occurrenciesList, String fileName)?
        export,
    TResult Function()? alert,
    TResult Function()? reset,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(SearchType searchType)? init,
    TResult Function()? import,
    TResult Function(PlatformFile file)? search,
    TResult Function(List<Taxonomic>? taxonomicsList,
            List<Occurrence>? occurrenciesList, String fileName)?
        export,
    TResult Function()? alert,
    TResult Function()? reset,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Init value) init,
    required TResult Function(_Import value) import,
    required TResult Function(_Search value) search,
    required TResult Function(_Export value) export,
    required TResult Function(_Alert value) alert,
    required TResult Function(_Reset value) reset,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_Import value)? import,
    TResult Function(_Search value)? search,
    TResult Function(_Export value)? export,
    TResult Function(_Alert value)? alert,
    TResult Function(_Reset value)? reset,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_Import value)? import,
    TResult Function(_Search value)? search,
    TResult Function(_Export value)? export,
    TResult Function(_Alert value)? alert,
    TResult Function(_Reset value)? reset,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchsEventCopyWith<$Res> {
  factory $SearchsEventCopyWith(
          SearchsEvent value, $Res Function(SearchsEvent) then) =
      _$SearchsEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$SearchsEventCopyWithImpl<$Res> implements $SearchsEventCopyWith<$Res> {
  _$SearchsEventCopyWithImpl(this._value, this._then);

  final SearchsEvent _value;
  // ignore: unused_field
  final $Res Function(SearchsEvent) _then;
}

/// @nodoc
abstract class _$$_InitCopyWith<$Res> {
  factory _$$_InitCopyWith(_$_Init value, $Res Function(_$_Init) then) =
      __$$_InitCopyWithImpl<$Res>;
  $Res call({SearchType searchType});
}

/// @nodoc
class __$$_InitCopyWithImpl<$Res> extends _$SearchsEventCopyWithImpl<$Res>
    implements _$$_InitCopyWith<$Res> {
  __$$_InitCopyWithImpl(_$_Init _value, $Res Function(_$_Init) _then)
      : super(_value, (v) => _then(v as _$_Init));

  @override
  _$_Init get _value => super._value as _$_Init;

  @override
  $Res call({
    Object? searchType = freezed,
  }) {
    return _then(_$_Init(
      searchType == freezed
          ? _value.searchType
          : searchType // ignore: cast_nullable_to_non_nullable
              as SearchType,
    ));
  }
}

/// @nodoc

class _$_Init implements _Init {
  const _$_Init(this.searchType);

  @override
  final SearchType searchType;

  @override
  String toString() {
    return 'SearchsEvent.init(searchType: $searchType)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Init &&
            const DeepCollectionEquality()
                .equals(other.searchType, searchType));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(searchType));

  @JsonKey(ignore: true)
  @override
  _$$_InitCopyWith<_$_Init> get copyWith =>
      __$$_InitCopyWithImpl<_$_Init>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(SearchType searchType) init,
    required TResult Function() import,
    required TResult Function(PlatformFile file) search,
    required TResult Function(List<Taxonomic>? taxonomicsList,
            List<Occurrence>? occurrenciesList, String fileName)
        export,
    required TResult Function() alert,
    required TResult Function() reset,
  }) {
    return init(searchType);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(SearchType searchType)? init,
    TResult Function()? import,
    TResult Function(PlatformFile file)? search,
    TResult Function(List<Taxonomic>? taxonomicsList,
            List<Occurrence>? occurrenciesList, String fileName)?
        export,
    TResult Function()? alert,
    TResult Function()? reset,
  }) {
    return init?.call(searchType);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(SearchType searchType)? init,
    TResult Function()? import,
    TResult Function(PlatformFile file)? search,
    TResult Function(List<Taxonomic>? taxonomicsList,
            List<Occurrence>? occurrenciesList, String fileName)?
        export,
    TResult Function()? alert,
    TResult Function()? reset,
    required TResult orElse(),
  }) {
    if (init != null) {
      return init(searchType);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Init value) init,
    required TResult Function(_Import value) import,
    required TResult Function(_Search value) search,
    required TResult Function(_Export value) export,
    required TResult Function(_Alert value) alert,
    required TResult Function(_Reset value) reset,
  }) {
    return init(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_Import value)? import,
    TResult Function(_Search value)? search,
    TResult Function(_Export value)? export,
    TResult Function(_Alert value)? alert,
    TResult Function(_Reset value)? reset,
  }) {
    return init?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_Import value)? import,
    TResult Function(_Search value)? search,
    TResult Function(_Export value)? export,
    TResult Function(_Alert value)? alert,
    TResult Function(_Reset value)? reset,
    required TResult orElse(),
  }) {
    if (init != null) {
      return init(this);
    }
    return orElse();
  }
}

abstract class _Init implements SearchsEvent {
  const factory _Init(final SearchType searchType) = _$_Init;

  SearchType get searchType => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$$_InitCopyWith<_$_Init> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_ImportCopyWith<$Res> {
  factory _$$_ImportCopyWith(_$_Import value, $Res Function(_$_Import) then) =
      __$$_ImportCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_ImportCopyWithImpl<$Res> extends _$SearchsEventCopyWithImpl<$Res>
    implements _$$_ImportCopyWith<$Res> {
  __$$_ImportCopyWithImpl(_$_Import _value, $Res Function(_$_Import) _then)
      : super(_value, (v) => _then(v as _$_Import));

  @override
  _$_Import get _value => super._value as _$_Import;
}

/// @nodoc

class _$_Import implements _Import {
  const _$_Import();

  @override
  String toString() {
    return 'SearchsEvent.import()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_Import);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(SearchType searchType) init,
    required TResult Function() import,
    required TResult Function(PlatformFile file) search,
    required TResult Function(List<Taxonomic>? taxonomicsList,
            List<Occurrence>? occurrenciesList, String fileName)
        export,
    required TResult Function() alert,
    required TResult Function() reset,
  }) {
    return import();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(SearchType searchType)? init,
    TResult Function()? import,
    TResult Function(PlatformFile file)? search,
    TResult Function(List<Taxonomic>? taxonomicsList,
            List<Occurrence>? occurrenciesList, String fileName)?
        export,
    TResult Function()? alert,
    TResult Function()? reset,
  }) {
    return import?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(SearchType searchType)? init,
    TResult Function()? import,
    TResult Function(PlatformFile file)? search,
    TResult Function(List<Taxonomic>? taxonomicsList,
            List<Occurrence>? occurrenciesList, String fileName)?
        export,
    TResult Function()? alert,
    TResult Function()? reset,
    required TResult orElse(),
  }) {
    if (import != null) {
      return import();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Init value) init,
    required TResult Function(_Import value) import,
    required TResult Function(_Search value) search,
    required TResult Function(_Export value) export,
    required TResult Function(_Alert value) alert,
    required TResult Function(_Reset value) reset,
  }) {
    return import(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_Import value)? import,
    TResult Function(_Search value)? search,
    TResult Function(_Export value)? export,
    TResult Function(_Alert value)? alert,
    TResult Function(_Reset value)? reset,
  }) {
    return import?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_Import value)? import,
    TResult Function(_Search value)? search,
    TResult Function(_Export value)? export,
    TResult Function(_Alert value)? alert,
    TResult Function(_Reset value)? reset,
    required TResult orElse(),
  }) {
    if (import != null) {
      return import(this);
    }
    return orElse();
  }
}

abstract class _Import implements SearchsEvent {
  const factory _Import() = _$_Import;
}

/// @nodoc
abstract class _$$_SearchCopyWith<$Res> {
  factory _$$_SearchCopyWith(_$_Search value, $Res Function(_$_Search) then) =
      __$$_SearchCopyWithImpl<$Res>;
  $Res call({PlatformFile file});
}

/// @nodoc
class __$$_SearchCopyWithImpl<$Res> extends _$SearchsEventCopyWithImpl<$Res>
    implements _$$_SearchCopyWith<$Res> {
  __$$_SearchCopyWithImpl(_$_Search _value, $Res Function(_$_Search) _then)
      : super(_value, (v) => _then(v as _$_Search));

  @override
  _$_Search get _value => super._value as _$_Search;

  @override
  $Res call({
    Object? file = freezed,
  }) {
    return _then(_$_Search(
      file == freezed
          ? _value.file
          : file // ignore: cast_nullable_to_non_nullable
              as PlatformFile,
    ));
  }
}

/// @nodoc

class _$_Search implements _Search {
  const _$_Search(this.file);

  @override
  final PlatformFile file;

  @override
  String toString() {
    return 'SearchsEvent.search(file: $file)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Search &&
            const DeepCollectionEquality().equals(other.file, file));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(file));

  @JsonKey(ignore: true)
  @override
  _$$_SearchCopyWith<_$_Search> get copyWith =>
      __$$_SearchCopyWithImpl<_$_Search>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(SearchType searchType) init,
    required TResult Function() import,
    required TResult Function(PlatformFile file) search,
    required TResult Function(List<Taxonomic>? taxonomicsList,
            List<Occurrence>? occurrenciesList, String fileName)
        export,
    required TResult Function() alert,
    required TResult Function() reset,
  }) {
    return search(file);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(SearchType searchType)? init,
    TResult Function()? import,
    TResult Function(PlatformFile file)? search,
    TResult Function(List<Taxonomic>? taxonomicsList,
            List<Occurrence>? occurrenciesList, String fileName)?
        export,
    TResult Function()? alert,
    TResult Function()? reset,
  }) {
    return search?.call(file);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(SearchType searchType)? init,
    TResult Function()? import,
    TResult Function(PlatformFile file)? search,
    TResult Function(List<Taxonomic>? taxonomicsList,
            List<Occurrence>? occurrenciesList, String fileName)?
        export,
    TResult Function()? alert,
    TResult Function()? reset,
    required TResult orElse(),
  }) {
    if (search != null) {
      return search(file);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Init value) init,
    required TResult Function(_Import value) import,
    required TResult Function(_Search value) search,
    required TResult Function(_Export value) export,
    required TResult Function(_Alert value) alert,
    required TResult Function(_Reset value) reset,
  }) {
    return search(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_Import value)? import,
    TResult Function(_Search value)? search,
    TResult Function(_Export value)? export,
    TResult Function(_Alert value)? alert,
    TResult Function(_Reset value)? reset,
  }) {
    return search?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_Import value)? import,
    TResult Function(_Search value)? search,
    TResult Function(_Export value)? export,
    TResult Function(_Alert value)? alert,
    TResult Function(_Reset value)? reset,
    required TResult orElse(),
  }) {
    if (search != null) {
      return search(this);
    }
    return orElse();
  }
}

abstract class _Search implements SearchsEvent {
  const factory _Search(final PlatformFile file) = _$_Search;

  PlatformFile get file => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$$_SearchCopyWith<_$_Search> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_ExportCopyWith<$Res> {
  factory _$$_ExportCopyWith(_$_Export value, $Res Function(_$_Export) then) =
      __$$_ExportCopyWithImpl<$Res>;
  $Res call(
      {List<Taxonomic>? taxonomicsList,
      List<Occurrence>? occurrenciesList,
      String fileName});
}

/// @nodoc
class __$$_ExportCopyWithImpl<$Res> extends _$SearchsEventCopyWithImpl<$Res>
    implements _$$_ExportCopyWith<$Res> {
  __$$_ExportCopyWithImpl(_$_Export _value, $Res Function(_$_Export) _then)
      : super(_value, (v) => _then(v as _$_Export));

  @override
  _$_Export get _value => super._value as _$_Export;

  @override
  $Res call({
    Object? taxonomicsList = freezed,
    Object? occurrenciesList = freezed,
    Object? fileName = freezed,
  }) {
    return _then(_$_Export(
      taxonomicsList: taxonomicsList == freezed
          ? _value._taxonomicsList
          : taxonomicsList // ignore: cast_nullable_to_non_nullable
              as List<Taxonomic>?,
      occurrenciesList: occurrenciesList == freezed
          ? _value._occurrenciesList
          : occurrenciesList // ignore: cast_nullable_to_non_nullable
              as List<Occurrence>?,
      fileName: fileName == freezed
          ? _value.fileName
          : fileName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_Export implements _Export {
  const _$_Export(
      {required final List<Taxonomic>? taxonomicsList,
      required final List<Occurrence>? occurrenciesList,
      required this.fileName})
      : _taxonomicsList = taxonomicsList,
        _occurrenciesList = occurrenciesList;

  final List<Taxonomic>? _taxonomicsList;
  @override
  List<Taxonomic>? get taxonomicsList {
    final value = _taxonomicsList;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<Occurrence>? _occurrenciesList;
  @override
  List<Occurrence>? get occurrenciesList {
    final value = _occurrenciesList;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String fileName;

  @override
  String toString() {
    return 'SearchsEvent.export(taxonomicsList: $taxonomicsList, occurrenciesList: $occurrenciesList, fileName: $fileName)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Export &&
            const DeepCollectionEquality()
                .equals(other._taxonomicsList, _taxonomicsList) &&
            const DeepCollectionEquality()
                .equals(other._occurrenciesList, _occurrenciesList) &&
            const DeepCollectionEquality().equals(other.fileName, fileName));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_taxonomicsList),
      const DeepCollectionEquality().hash(_occurrenciesList),
      const DeepCollectionEquality().hash(fileName));

  @JsonKey(ignore: true)
  @override
  _$$_ExportCopyWith<_$_Export> get copyWith =>
      __$$_ExportCopyWithImpl<_$_Export>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(SearchType searchType) init,
    required TResult Function() import,
    required TResult Function(PlatformFile file) search,
    required TResult Function(List<Taxonomic>? taxonomicsList,
            List<Occurrence>? occurrenciesList, String fileName)
        export,
    required TResult Function() alert,
    required TResult Function() reset,
  }) {
    return export(taxonomicsList, occurrenciesList, fileName);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(SearchType searchType)? init,
    TResult Function()? import,
    TResult Function(PlatformFile file)? search,
    TResult Function(List<Taxonomic>? taxonomicsList,
            List<Occurrence>? occurrenciesList, String fileName)?
        export,
    TResult Function()? alert,
    TResult Function()? reset,
  }) {
    return export?.call(taxonomicsList, occurrenciesList, fileName);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(SearchType searchType)? init,
    TResult Function()? import,
    TResult Function(PlatformFile file)? search,
    TResult Function(List<Taxonomic>? taxonomicsList,
            List<Occurrence>? occurrenciesList, String fileName)?
        export,
    TResult Function()? alert,
    TResult Function()? reset,
    required TResult orElse(),
  }) {
    if (export != null) {
      return export(taxonomicsList, occurrenciesList, fileName);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Init value) init,
    required TResult Function(_Import value) import,
    required TResult Function(_Search value) search,
    required TResult Function(_Export value) export,
    required TResult Function(_Alert value) alert,
    required TResult Function(_Reset value) reset,
  }) {
    return export(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_Import value)? import,
    TResult Function(_Search value)? search,
    TResult Function(_Export value)? export,
    TResult Function(_Alert value)? alert,
    TResult Function(_Reset value)? reset,
  }) {
    return export?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_Import value)? import,
    TResult Function(_Search value)? search,
    TResult Function(_Export value)? export,
    TResult Function(_Alert value)? alert,
    TResult Function(_Reset value)? reset,
    required TResult orElse(),
  }) {
    if (export != null) {
      return export(this);
    }
    return orElse();
  }
}

abstract class _Export implements SearchsEvent {
  const factory _Export(
      {required final List<Taxonomic>? taxonomicsList,
      required final List<Occurrence>? occurrenciesList,
      required final String fileName}) = _$_Export;

  List<Taxonomic>? get taxonomicsList => throw _privateConstructorUsedError;
  List<Occurrence>? get occurrenciesList => throw _privateConstructorUsedError;
  String get fileName => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$$_ExportCopyWith<_$_Export> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_AlertCopyWith<$Res> {
  factory _$$_AlertCopyWith(_$_Alert value, $Res Function(_$_Alert) then) =
      __$$_AlertCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_AlertCopyWithImpl<$Res> extends _$SearchsEventCopyWithImpl<$Res>
    implements _$$_AlertCopyWith<$Res> {
  __$$_AlertCopyWithImpl(_$_Alert _value, $Res Function(_$_Alert) _then)
      : super(_value, (v) => _then(v as _$_Alert));

  @override
  _$_Alert get _value => super._value as _$_Alert;
}

/// @nodoc

class _$_Alert implements _Alert {
  const _$_Alert();

  @override
  String toString() {
    return 'SearchsEvent.alert()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_Alert);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(SearchType searchType) init,
    required TResult Function() import,
    required TResult Function(PlatformFile file) search,
    required TResult Function(List<Taxonomic>? taxonomicsList,
            List<Occurrence>? occurrenciesList, String fileName)
        export,
    required TResult Function() alert,
    required TResult Function() reset,
  }) {
    return alert();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(SearchType searchType)? init,
    TResult Function()? import,
    TResult Function(PlatformFile file)? search,
    TResult Function(List<Taxonomic>? taxonomicsList,
            List<Occurrence>? occurrenciesList, String fileName)?
        export,
    TResult Function()? alert,
    TResult Function()? reset,
  }) {
    return alert?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(SearchType searchType)? init,
    TResult Function()? import,
    TResult Function(PlatformFile file)? search,
    TResult Function(List<Taxonomic>? taxonomicsList,
            List<Occurrence>? occurrenciesList, String fileName)?
        export,
    TResult Function()? alert,
    TResult Function()? reset,
    required TResult orElse(),
  }) {
    if (alert != null) {
      return alert();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Init value) init,
    required TResult Function(_Import value) import,
    required TResult Function(_Search value) search,
    required TResult Function(_Export value) export,
    required TResult Function(_Alert value) alert,
    required TResult Function(_Reset value) reset,
  }) {
    return alert(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_Import value)? import,
    TResult Function(_Search value)? search,
    TResult Function(_Export value)? export,
    TResult Function(_Alert value)? alert,
    TResult Function(_Reset value)? reset,
  }) {
    return alert?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_Import value)? import,
    TResult Function(_Search value)? search,
    TResult Function(_Export value)? export,
    TResult Function(_Alert value)? alert,
    TResult Function(_Reset value)? reset,
    required TResult orElse(),
  }) {
    if (alert != null) {
      return alert(this);
    }
    return orElse();
  }
}

abstract class _Alert implements SearchsEvent {
  const factory _Alert() = _$_Alert;
}

/// @nodoc
abstract class _$$_ResetCopyWith<$Res> {
  factory _$$_ResetCopyWith(_$_Reset value, $Res Function(_$_Reset) then) =
      __$$_ResetCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_ResetCopyWithImpl<$Res> extends _$SearchsEventCopyWithImpl<$Res>
    implements _$$_ResetCopyWith<$Res> {
  __$$_ResetCopyWithImpl(_$_Reset _value, $Res Function(_$_Reset) _then)
      : super(_value, (v) => _then(v as _$_Reset));

  @override
  _$_Reset get _value => super._value as _$_Reset;
}

/// @nodoc

class _$_Reset implements _Reset {
  const _$_Reset();

  @override
  String toString() {
    return 'SearchsEvent.reset()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_Reset);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(SearchType searchType) init,
    required TResult Function() import,
    required TResult Function(PlatformFile file) search,
    required TResult Function(List<Taxonomic>? taxonomicsList,
            List<Occurrence>? occurrenciesList, String fileName)
        export,
    required TResult Function() alert,
    required TResult Function() reset,
  }) {
    return reset();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(SearchType searchType)? init,
    TResult Function()? import,
    TResult Function(PlatformFile file)? search,
    TResult Function(List<Taxonomic>? taxonomicsList,
            List<Occurrence>? occurrenciesList, String fileName)?
        export,
    TResult Function()? alert,
    TResult Function()? reset,
  }) {
    return reset?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(SearchType searchType)? init,
    TResult Function()? import,
    TResult Function(PlatformFile file)? search,
    TResult Function(List<Taxonomic>? taxonomicsList,
            List<Occurrence>? occurrenciesList, String fileName)?
        export,
    TResult Function()? alert,
    TResult Function()? reset,
    required TResult orElse(),
  }) {
    if (reset != null) {
      return reset();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Init value) init,
    required TResult Function(_Import value) import,
    required TResult Function(_Search value) search,
    required TResult Function(_Export value) export,
    required TResult Function(_Alert value) alert,
    required TResult Function(_Reset value) reset,
  }) {
    return reset(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_Import value)? import,
    TResult Function(_Search value)? search,
    TResult Function(_Export value)? export,
    TResult Function(_Alert value)? alert,
    TResult Function(_Reset value)? reset,
  }) {
    return reset?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_Import value)? import,
    TResult Function(_Search value)? search,
    TResult Function(_Export value)? export,
    TResult Function(_Alert value)? alert,
    TResult Function(_Reset value)? reset,
    required TResult orElse(),
  }) {
    if (reset != null) {
      return reset(this);
    }
    return orElse();
  }
}

abstract class _Reset implements SearchsEvent {
  const factory _Reset() = _$_Reset;
}

/// @nodoc
mixin _$SearchsState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() empty,
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(PlatformFile file) imported,
    required TResult Function() warning,
    required TResult Function(
            List<Occurrence>? occurrenciesList,
            List<Taxonomic>? taxonomicsList,
            SearchType searchType,
            String fileName)
        success,
    required TResult Function(DefaultErrors error) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? empty,
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(PlatformFile file)? imported,
    TResult Function()? warning,
    TResult Function(
            List<Occurrence>? occurrenciesList,
            List<Taxonomic>? taxonomicsList,
            SearchType searchType,
            String fileName)?
        success,
    TResult Function(DefaultErrors error)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? empty,
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(PlatformFile file)? imported,
    TResult Function()? warning,
    TResult Function(
            List<Occurrence>? occurrenciesList,
            List<Taxonomic>? taxonomicsList,
            SearchType searchType,
            String fileName)?
        success,
    TResult Function(DefaultErrors error)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Empty value) empty,
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Imported value) imported,
    required TResult Function(_Warning value) warning,
    required TResult Function(_Success value) success,
    required TResult Function(_Error value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Empty value)? empty,
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Imported value)? imported,
    TResult Function(_Warning value)? warning,
    TResult Function(_Success value)? success,
    TResult Function(_Error value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Empty value)? empty,
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Imported value)? imported,
    TResult Function(_Warning value)? warning,
    TResult Function(_Success value)? success,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchsStateCopyWith<$Res> {
  factory $SearchsStateCopyWith(
          SearchsState value, $Res Function(SearchsState) then) =
      _$SearchsStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$SearchsStateCopyWithImpl<$Res> implements $SearchsStateCopyWith<$Res> {
  _$SearchsStateCopyWithImpl(this._value, this._then);

  final SearchsState _value;
  // ignore: unused_field
  final $Res Function(SearchsState) _then;
}

/// @nodoc
abstract class _$$_EmptyCopyWith<$Res> {
  factory _$$_EmptyCopyWith(_$_Empty value, $Res Function(_$_Empty) then) =
      __$$_EmptyCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_EmptyCopyWithImpl<$Res> extends _$SearchsStateCopyWithImpl<$Res>
    implements _$$_EmptyCopyWith<$Res> {
  __$$_EmptyCopyWithImpl(_$_Empty _value, $Res Function(_$_Empty) _then)
      : super(_value, (v) => _then(v as _$_Empty));

  @override
  _$_Empty get _value => super._value as _$_Empty;
}

/// @nodoc

class _$_Empty implements _Empty {
  const _$_Empty();

  @override
  String toString() {
    return 'SearchsState.empty()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_Empty);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() empty,
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(PlatformFile file) imported,
    required TResult Function() warning,
    required TResult Function(
            List<Occurrence>? occurrenciesList,
            List<Taxonomic>? taxonomicsList,
            SearchType searchType,
            String fileName)
        success,
    required TResult Function(DefaultErrors error) error,
  }) {
    return empty();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? empty,
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(PlatformFile file)? imported,
    TResult Function()? warning,
    TResult Function(
            List<Occurrence>? occurrenciesList,
            List<Taxonomic>? taxonomicsList,
            SearchType searchType,
            String fileName)?
        success,
    TResult Function(DefaultErrors error)? error,
  }) {
    return empty?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? empty,
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(PlatformFile file)? imported,
    TResult Function()? warning,
    TResult Function(
            List<Occurrence>? occurrenciesList,
            List<Taxonomic>? taxonomicsList,
            SearchType searchType,
            String fileName)?
        success,
    TResult Function(DefaultErrors error)? error,
    required TResult orElse(),
  }) {
    if (empty != null) {
      return empty();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Empty value) empty,
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Imported value) imported,
    required TResult Function(_Warning value) warning,
    required TResult Function(_Success value) success,
    required TResult Function(_Error value) error,
  }) {
    return empty(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Empty value)? empty,
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Imported value)? imported,
    TResult Function(_Warning value)? warning,
    TResult Function(_Success value)? success,
    TResult Function(_Error value)? error,
  }) {
    return empty?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Empty value)? empty,
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Imported value)? imported,
    TResult Function(_Warning value)? warning,
    TResult Function(_Success value)? success,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (empty != null) {
      return empty(this);
    }
    return orElse();
  }
}

abstract class _Empty implements SearchsState {
  const factory _Empty() = _$_Empty;
}

/// @nodoc
abstract class _$$_InitialCopyWith<$Res> {
  factory _$$_InitialCopyWith(
          _$_Initial value, $Res Function(_$_Initial) then) =
      __$$_InitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_InitialCopyWithImpl<$Res> extends _$SearchsStateCopyWithImpl<$Res>
    implements _$$_InitialCopyWith<$Res> {
  __$$_InitialCopyWithImpl(_$_Initial _value, $Res Function(_$_Initial) _then)
      : super(_value, (v) => _then(v as _$_Initial));

  @override
  _$_Initial get _value => super._value as _$_Initial;
}

/// @nodoc

class _$_Initial implements _Initial {
  const _$_Initial();

  @override
  String toString() {
    return 'SearchsState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_Initial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() empty,
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(PlatformFile file) imported,
    required TResult Function() warning,
    required TResult Function(
            List<Occurrence>? occurrenciesList,
            List<Taxonomic>? taxonomicsList,
            SearchType searchType,
            String fileName)
        success,
    required TResult Function(DefaultErrors error) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? empty,
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(PlatformFile file)? imported,
    TResult Function()? warning,
    TResult Function(
            List<Occurrence>? occurrenciesList,
            List<Taxonomic>? taxonomicsList,
            SearchType searchType,
            String fileName)?
        success,
    TResult Function(DefaultErrors error)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? empty,
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(PlatformFile file)? imported,
    TResult Function()? warning,
    TResult Function(
            List<Occurrence>? occurrenciesList,
            List<Taxonomic>? taxonomicsList,
            SearchType searchType,
            String fileName)?
        success,
    TResult Function(DefaultErrors error)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Empty value) empty,
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Imported value) imported,
    required TResult Function(_Warning value) warning,
    required TResult Function(_Success value) success,
    required TResult Function(_Error value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Empty value)? empty,
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Imported value)? imported,
    TResult Function(_Warning value)? warning,
    TResult Function(_Success value)? success,
    TResult Function(_Error value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Empty value)? empty,
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Imported value)? imported,
    TResult Function(_Warning value)? warning,
    TResult Function(_Success value)? success,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements SearchsState {
  const factory _Initial() = _$_Initial;
}

/// @nodoc
abstract class _$$_LoadingCopyWith<$Res> {
  factory _$$_LoadingCopyWith(
          _$_Loading value, $Res Function(_$_Loading) then) =
      __$$_LoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_LoadingCopyWithImpl<$Res> extends _$SearchsStateCopyWithImpl<$Res>
    implements _$$_LoadingCopyWith<$Res> {
  __$$_LoadingCopyWithImpl(_$_Loading _value, $Res Function(_$_Loading) _then)
      : super(_value, (v) => _then(v as _$_Loading));

  @override
  _$_Loading get _value => super._value as _$_Loading;
}

/// @nodoc

class _$_Loading implements _Loading {
  const _$_Loading();

  @override
  String toString() {
    return 'SearchsState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_Loading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() empty,
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(PlatformFile file) imported,
    required TResult Function() warning,
    required TResult Function(
            List<Occurrence>? occurrenciesList,
            List<Taxonomic>? taxonomicsList,
            SearchType searchType,
            String fileName)
        success,
    required TResult Function(DefaultErrors error) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? empty,
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(PlatformFile file)? imported,
    TResult Function()? warning,
    TResult Function(
            List<Occurrence>? occurrenciesList,
            List<Taxonomic>? taxonomicsList,
            SearchType searchType,
            String fileName)?
        success,
    TResult Function(DefaultErrors error)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? empty,
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(PlatformFile file)? imported,
    TResult Function()? warning,
    TResult Function(
            List<Occurrence>? occurrenciesList,
            List<Taxonomic>? taxonomicsList,
            SearchType searchType,
            String fileName)?
        success,
    TResult Function(DefaultErrors error)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Empty value) empty,
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Imported value) imported,
    required TResult Function(_Warning value) warning,
    required TResult Function(_Success value) success,
    required TResult Function(_Error value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Empty value)? empty,
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Imported value)? imported,
    TResult Function(_Warning value)? warning,
    TResult Function(_Success value)? success,
    TResult Function(_Error value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Empty value)? empty,
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Imported value)? imported,
    TResult Function(_Warning value)? warning,
    TResult Function(_Success value)? success,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements SearchsState {
  const factory _Loading() = _$_Loading;
}

/// @nodoc
abstract class _$$_ImportedCopyWith<$Res> {
  factory _$$_ImportedCopyWith(
          _$_Imported value, $Res Function(_$_Imported) then) =
      __$$_ImportedCopyWithImpl<$Res>;
  $Res call({PlatformFile file});
}

/// @nodoc
class __$$_ImportedCopyWithImpl<$Res> extends _$SearchsStateCopyWithImpl<$Res>
    implements _$$_ImportedCopyWith<$Res> {
  __$$_ImportedCopyWithImpl(
      _$_Imported _value, $Res Function(_$_Imported) _then)
      : super(_value, (v) => _then(v as _$_Imported));

  @override
  _$_Imported get _value => super._value as _$_Imported;

  @override
  $Res call({
    Object? file = freezed,
  }) {
    return _then(_$_Imported(
      file == freezed
          ? _value.file
          : file // ignore: cast_nullable_to_non_nullable
              as PlatformFile,
    ));
  }
}

/// @nodoc

class _$_Imported implements _Imported {
  const _$_Imported(this.file);

  @override
  final PlatformFile file;

  @override
  String toString() {
    return 'SearchsState.imported(file: $file)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Imported &&
            const DeepCollectionEquality().equals(other.file, file));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(file));

  @JsonKey(ignore: true)
  @override
  _$$_ImportedCopyWith<_$_Imported> get copyWith =>
      __$$_ImportedCopyWithImpl<_$_Imported>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() empty,
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(PlatformFile file) imported,
    required TResult Function() warning,
    required TResult Function(
            List<Occurrence>? occurrenciesList,
            List<Taxonomic>? taxonomicsList,
            SearchType searchType,
            String fileName)
        success,
    required TResult Function(DefaultErrors error) error,
  }) {
    return imported(file);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? empty,
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(PlatformFile file)? imported,
    TResult Function()? warning,
    TResult Function(
            List<Occurrence>? occurrenciesList,
            List<Taxonomic>? taxonomicsList,
            SearchType searchType,
            String fileName)?
        success,
    TResult Function(DefaultErrors error)? error,
  }) {
    return imported?.call(file);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? empty,
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(PlatformFile file)? imported,
    TResult Function()? warning,
    TResult Function(
            List<Occurrence>? occurrenciesList,
            List<Taxonomic>? taxonomicsList,
            SearchType searchType,
            String fileName)?
        success,
    TResult Function(DefaultErrors error)? error,
    required TResult orElse(),
  }) {
    if (imported != null) {
      return imported(file);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Empty value) empty,
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Imported value) imported,
    required TResult Function(_Warning value) warning,
    required TResult Function(_Success value) success,
    required TResult Function(_Error value) error,
  }) {
    return imported(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Empty value)? empty,
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Imported value)? imported,
    TResult Function(_Warning value)? warning,
    TResult Function(_Success value)? success,
    TResult Function(_Error value)? error,
  }) {
    return imported?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Empty value)? empty,
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Imported value)? imported,
    TResult Function(_Warning value)? warning,
    TResult Function(_Success value)? success,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (imported != null) {
      return imported(this);
    }
    return orElse();
  }
}

abstract class _Imported implements SearchsState {
  const factory _Imported(final PlatformFile file) = _$_Imported;

  PlatformFile get file => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$$_ImportedCopyWith<_$_Imported> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_WarningCopyWith<$Res> {
  factory _$$_WarningCopyWith(
          _$_Warning value, $Res Function(_$_Warning) then) =
      __$$_WarningCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_WarningCopyWithImpl<$Res> extends _$SearchsStateCopyWithImpl<$Res>
    implements _$$_WarningCopyWith<$Res> {
  __$$_WarningCopyWithImpl(_$_Warning _value, $Res Function(_$_Warning) _then)
      : super(_value, (v) => _then(v as _$_Warning));

  @override
  _$_Warning get _value => super._value as _$_Warning;
}

/// @nodoc

class _$_Warning implements _Warning {
  const _$_Warning();

  @override
  String toString() {
    return 'SearchsState.warning()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_Warning);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() empty,
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(PlatformFile file) imported,
    required TResult Function() warning,
    required TResult Function(
            List<Occurrence>? occurrenciesList,
            List<Taxonomic>? taxonomicsList,
            SearchType searchType,
            String fileName)
        success,
    required TResult Function(DefaultErrors error) error,
  }) {
    return warning();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? empty,
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(PlatformFile file)? imported,
    TResult Function()? warning,
    TResult Function(
            List<Occurrence>? occurrenciesList,
            List<Taxonomic>? taxonomicsList,
            SearchType searchType,
            String fileName)?
        success,
    TResult Function(DefaultErrors error)? error,
  }) {
    return warning?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? empty,
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(PlatformFile file)? imported,
    TResult Function()? warning,
    TResult Function(
            List<Occurrence>? occurrenciesList,
            List<Taxonomic>? taxonomicsList,
            SearchType searchType,
            String fileName)?
        success,
    TResult Function(DefaultErrors error)? error,
    required TResult orElse(),
  }) {
    if (warning != null) {
      return warning();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Empty value) empty,
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Imported value) imported,
    required TResult Function(_Warning value) warning,
    required TResult Function(_Success value) success,
    required TResult Function(_Error value) error,
  }) {
    return warning(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Empty value)? empty,
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Imported value)? imported,
    TResult Function(_Warning value)? warning,
    TResult Function(_Success value)? success,
    TResult Function(_Error value)? error,
  }) {
    return warning?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Empty value)? empty,
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Imported value)? imported,
    TResult Function(_Warning value)? warning,
    TResult Function(_Success value)? success,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (warning != null) {
      return warning(this);
    }
    return orElse();
  }
}

abstract class _Warning implements SearchsState {
  const factory _Warning() = _$_Warning;
}

/// @nodoc
abstract class _$$_SuccessCopyWith<$Res> {
  factory _$$_SuccessCopyWith(
          _$_Success value, $Res Function(_$_Success) then) =
      __$$_SuccessCopyWithImpl<$Res>;
  $Res call(
      {List<Occurrence>? occurrenciesList,
      List<Taxonomic>? taxonomicsList,
      SearchType searchType,
      String fileName});
}

/// @nodoc
class __$$_SuccessCopyWithImpl<$Res> extends _$SearchsStateCopyWithImpl<$Res>
    implements _$$_SuccessCopyWith<$Res> {
  __$$_SuccessCopyWithImpl(_$_Success _value, $Res Function(_$_Success) _then)
      : super(_value, (v) => _then(v as _$_Success));

  @override
  _$_Success get _value => super._value as _$_Success;

  @override
  $Res call({
    Object? occurrenciesList = freezed,
    Object? taxonomicsList = freezed,
    Object? searchType = freezed,
    Object? fileName = freezed,
  }) {
    return _then(_$_Success(
      occurrenciesList: occurrenciesList == freezed
          ? _value._occurrenciesList
          : occurrenciesList // ignore: cast_nullable_to_non_nullable
              as List<Occurrence>?,
      taxonomicsList: taxonomicsList == freezed
          ? _value._taxonomicsList
          : taxonomicsList // ignore: cast_nullable_to_non_nullable
              as List<Taxonomic>?,
      searchType: searchType == freezed
          ? _value.searchType
          : searchType // ignore: cast_nullable_to_non_nullable
              as SearchType,
      fileName: fileName == freezed
          ? _value.fileName
          : fileName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_Success implements _Success {
  const _$_Success(
      {required final List<Occurrence>? occurrenciesList,
      required final List<Taxonomic>? taxonomicsList,
      required this.searchType,
      required this.fileName})
      : _occurrenciesList = occurrenciesList,
        _taxonomicsList = taxonomicsList;

  final List<Occurrence>? _occurrenciesList;
  @override
  List<Occurrence>? get occurrenciesList {
    final value = _occurrenciesList;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<Taxonomic>? _taxonomicsList;
  @override
  List<Taxonomic>? get taxonomicsList {
    final value = _taxonomicsList;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final SearchType searchType;
  @override
  final String fileName;

  @override
  String toString() {
    return 'SearchsState.success(occurrenciesList: $occurrenciesList, taxonomicsList: $taxonomicsList, searchType: $searchType, fileName: $fileName)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Success &&
            const DeepCollectionEquality()
                .equals(other._occurrenciesList, _occurrenciesList) &&
            const DeepCollectionEquality()
                .equals(other._taxonomicsList, _taxonomicsList) &&
            const DeepCollectionEquality()
                .equals(other.searchType, searchType) &&
            const DeepCollectionEquality().equals(other.fileName, fileName));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_occurrenciesList),
      const DeepCollectionEquality().hash(_taxonomicsList),
      const DeepCollectionEquality().hash(searchType),
      const DeepCollectionEquality().hash(fileName));

  @JsonKey(ignore: true)
  @override
  _$$_SuccessCopyWith<_$_Success> get copyWith =>
      __$$_SuccessCopyWithImpl<_$_Success>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() empty,
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(PlatformFile file) imported,
    required TResult Function() warning,
    required TResult Function(
            List<Occurrence>? occurrenciesList,
            List<Taxonomic>? taxonomicsList,
            SearchType searchType,
            String fileName)
        success,
    required TResult Function(DefaultErrors error) error,
  }) {
    return success(occurrenciesList, taxonomicsList, searchType, fileName);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? empty,
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(PlatformFile file)? imported,
    TResult Function()? warning,
    TResult Function(
            List<Occurrence>? occurrenciesList,
            List<Taxonomic>? taxonomicsList,
            SearchType searchType,
            String fileName)?
        success,
    TResult Function(DefaultErrors error)? error,
  }) {
    return success?.call(
        occurrenciesList, taxonomicsList, searchType, fileName);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? empty,
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(PlatformFile file)? imported,
    TResult Function()? warning,
    TResult Function(
            List<Occurrence>? occurrenciesList,
            List<Taxonomic>? taxonomicsList,
            SearchType searchType,
            String fileName)?
        success,
    TResult Function(DefaultErrors error)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(occurrenciesList, taxonomicsList, searchType, fileName);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Empty value) empty,
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Imported value) imported,
    required TResult Function(_Warning value) warning,
    required TResult Function(_Success value) success,
    required TResult Function(_Error value) error,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Empty value)? empty,
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Imported value)? imported,
    TResult Function(_Warning value)? warning,
    TResult Function(_Success value)? success,
    TResult Function(_Error value)? error,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Empty value)? empty,
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Imported value)? imported,
    TResult Function(_Warning value)? warning,
    TResult Function(_Success value)? success,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class _Success implements SearchsState {
  const factory _Success(
      {required final List<Occurrence>? occurrenciesList,
      required final List<Taxonomic>? taxonomicsList,
      required final SearchType searchType,
      required final String fileName}) = _$_Success;

  List<Occurrence>? get occurrenciesList => throw _privateConstructorUsedError;
  List<Taxonomic>? get taxonomicsList => throw _privateConstructorUsedError;
  SearchType get searchType => throw _privateConstructorUsedError;
  String get fileName => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$$_SuccessCopyWith<_$_Success> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_ErrorCopyWith<$Res> {
  factory _$$_ErrorCopyWith(_$_Error value, $Res Function(_$_Error) then) =
      __$$_ErrorCopyWithImpl<$Res>;
  $Res call({DefaultErrors error});
}

/// @nodoc
class __$$_ErrorCopyWithImpl<$Res> extends _$SearchsStateCopyWithImpl<$Res>
    implements _$$_ErrorCopyWith<$Res> {
  __$$_ErrorCopyWithImpl(_$_Error _value, $Res Function(_$_Error) _then)
      : super(_value, (v) => _then(v as _$_Error));

  @override
  _$_Error get _value => super._value as _$_Error;

  @override
  $Res call({
    Object? error = freezed,
  }) {
    return _then(_$_Error(
      error == freezed
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as DefaultErrors,
    ));
  }
}

/// @nodoc

class _$_Error implements _Error {
  const _$_Error(this.error);

  @override
  final DefaultErrors error;

  @override
  String toString() {
    return 'SearchsState.error(error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Error &&
            const DeepCollectionEquality().equals(other.error, error));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(error));

  @JsonKey(ignore: true)
  @override
  _$$_ErrorCopyWith<_$_Error> get copyWith =>
      __$$_ErrorCopyWithImpl<_$_Error>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() empty,
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(PlatformFile file) imported,
    required TResult Function() warning,
    required TResult Function(
            List<Occurrence>? occurrenciesList,
            List<Taxonomic>? taxonomicsList,
            SearchType searchType,
            String fileName)
        success,
    required TResult Function(DefaultErrors error) error,
  }) {
    return error(this.error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? empty,
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(PlatformFile file)? imported,
    TResult Function()? warning,
    TResult Function(
            List<Occurrence>? occurrenciesList,
            List<Taxonomic>? taxonomicsList,
            SearchType searchType,
            String fileName)?
        success,
    TResult Function(DefaultErrors error)? error,
  }) {
    return error?.call(this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? empty,
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(PlatformFile file)? imported,
    TResult Function()? warning,
    TResult Function(
            List<Occurrence>? occurrenciesList,
            List<Taxonomic>? taxonomicsList,
            SearchType searchType,
            String fileName)?
        success,
    TResult Function(DefaultErrors error)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this.error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Empty value) empty,
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Imported value) imported,
    required TResult Function(_Warning value) warning,
    required TResult Function(_Success value) success,
    required TResult Function(_Error value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Empty value)? empty,
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Imported value)? imported,
    TResult Function(_Warning value)? warning,
    TResult Function(_Success value)? success,
    TResult Function(_Error value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Empty value)? empty,
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Imported value)? imported,
    TResult Function(_Warning value)? warning,
    TResult Function(_Success value)? success,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _Error implements SearchsState {
  const factory _Error(final DefaultErrors error) = _$_Error;

  DefaultErrors get error => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$$_ErrorCopyWith<_$_Error> get copyWith =>
      throw _privateConstructorUsedError;
}
