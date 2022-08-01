// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'pic_dm.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$PicDM {
  String get id => throw _privateConstructorUsedError;
  String get author => throw _privateConstructorUsedError;
  String get url => throw _privateConstructorUsedError;
  int get width => throw _privateConstructorUsedError;
  int get height => throw _privateConstructorUsedError;
  String get imageUrl => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PicDMCopyWith<PicDM> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PicDMCopyWith<$Res> {
  factory $PicDMCopyWith(PicDM value, $Res Function(PicDM) then) =
      _$PicDMCopyWithImpl<$Res>;
  $Res call(
      {String id,
      String author,
      String url,
      int width,
      int height,
      String imageUrl});
}

/// @nodoc
class _$PicDMCopyWithImpl<$Res> implements $PicDMCopyWith<$Res> {
  _$PicDMCopyWithImpl(this._value, this._then);

  final PicDM _value;
  // ignore: unused_field
  final $Res Function(PicDM) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? author = freezed,
    Object? url = freezed,
    Object? width = freezed,
    Object? height = freezed,
    Object? imageUrl = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      author: author == freezed
          ? _value.author
          : author // ignore: cast_nullable_to_non_nullable
              as String,
      url: url == freezed
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      width: width == freezed
          ? _value.width
          : width // ignore: cast_nullable_to_non_nullable
              as int,
      height: height == freezed
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
              as int,
      imageUrl: imageUrl == freezed
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_PicDMCopyWith<$Res> implements $PicDMCopyWith<$Res> {
  factory _$$_PicDMCopyWith(_$_PicDM value, $Res Function(_$_PicDM) then) =
      __$$_PicDMCopyWithImpl<$Res>;
  @override
  $Res call(
      {String id,
      String author,
      String url,
      int width,
      int height,
      String imageUrl});
}

/// @nodoc
class __$$_PicDMCopyWithImpl<$Res> extends _$PicDMCopyWithImpl<$Res>
    implements _$$_PicDMCopyWith<$Res> {
  __$$_PicDMCopyWithImpl(_$_PicDM _value, $Res Function(_$_PicDM) _then)
      : super(_value, (v) => _then(v as _$_PicDM));

  @override
  _$_PicDM get _value => super._value as _$_PicDM;

  @override
  $Res call({
    Object? id = freezed,
    Object? author = freezed,
    Object? url = freezed,
    Object? width = freezed,
    Object? height = freezed,
    Object? imageUrl = freezed,
  }) {
    return _then(_$_PicDM(
      id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      author == freezed
          ? _value.author
          : author // ignore: cast_nullable_to_non_nullable
              as String,
      url == freezed
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      width == freezed
          ? _value.width
          : width // ignore: cast_nullable_to_non_nullable
              as int,
      height == freezed
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
              as int,
      imageUrl == freezed
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_PicDM implements _PicDM {
  _$_PicDM(
      this.id, this.author, this.url, this.width, this.height, this.imageUrl);

  @override
  final String id;
  @override
  final String author;
  @override
  final String url;
  @override
  final int width;
  @override
  final int height;
  @override
  final String imageUrl;

  @override
  String toString() {
    return 'PicDM(id: $id, author: $author, url: $url, width: $width, height: $height, imageUrl: $imageUrl)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PicDM &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.author, author) &&
            const DeepCollectionEquality().equals(other.url, url) &&
            const DeepCollectionEquality().equals(other.width, width) &&
            const DeepCollectionEquality().equals(other.height, height) &&
            const DeepCollectionEquality().equals(other.imageUrl, imageUrl));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(author),
      const DeepCollectionEquality().hash(url),
      const DeepCollectionEquality().hash(width),
      const DeepCollectionEquality().hash(height),
      const DeepCollectionEquality().hash(imageUrl));

  @JsonKey(ignore: true)
  @override
  _$$_PicDMCopyWith<_$_PicDM> get copyWith =>
      __$$_PicDMCopyWithImpl<_$_PicDM>(this, _$identity);
}

abstract class _PicDM implements PicDM {
  factory _PicDM(final String id, final String author, final String url,
      final int width, final int height, final String imageUrl) = _$_PicDM;

  @override
  String get id;
  @override
  String get author;
  @override
  String get url;
  @override
  int get width;
  @override
  int get height;
  @override
  String get imageUrl;
  @override
  @JsonKey(ignore: true)
  _$$_PicDMCopyWith<_$_PicDM> get copyWith =>
      throw _privateConstructorUsedError;
}
