// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'pic_rm.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PicRM _$PicRMFromJson(Map<String, dynamic> json) {
  return _PicRM.fromJson(json);
}

/// @nodoc
mixin _$PicRM {
  String get id => throw _privateConstructorUsedError;
  String? get author => throw _privateConstructorUsedError;
  String? get url => throw _privateConstructorUsedError;
  int get width => throw _privateConstructorUsedError;
  int get height => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PicRMCopyWith<PicRM> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PicRMCopyWith<$Res> {
  factory $PicRMCopyWith(PicRM value, $Res Function(PicRM) then) =
      _$PicRMCopyWithImpl<$Res>;
  $Res call({String id, String? author, String? url, int width, int height});
}

/// @nodoc
class _$PicRMCopyWithImpl<$Res> implements $PicRMCopyWith<$Res> {
  _$PicRMCopyWithImpl(this._value, this._then);

  final PicRM _value;
  // ignore: unused_field
  final $Res Function(PicRM) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? author = freezed,
    Object? url = freezed,
    Object? width = freezed,
    Object? height = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      author: author == freezed
          ? _value.author
          : author // ignore: cast_nullable_to_non_nullable
              as String?,
      url: url == freezed
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
      width: width == freezed
          ? _value.width
          : width // ignore: cast_nullable_to_non_nullable
              as int,
      height: height == freezed
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$$_PicRMCopyWith<$Res> implements $PicRMCopyWith<$Res> {
  factory _$$_PicRMCopyWith(_$_PicRM value, $Res Function(_$_PicRM) then) =
      __$$_PicRMCopyWithImpl<$Res>;
  @override
  $Res call({String id, String? author, String? url, int width, int height});
}

/// @nodoc
class __$$_PicRMCopyWithImpl<$Res> extends _$PicRMCopyWithImpl<$Res>
    implements _$$_PicRMCopyWith<$Res> {
  __$$_PicRMCopyWithImpl(_$_PicRM _value, $Res Function(_$_PicRM) _then)
      : super(_value, (v) => _then(v as _$_PicRM));

  @override
  _$_PicRM get _value => super._value as _$_PicRM;

  @override
  $Res call({
    Object? id = freezed,
    Object? author = freezed,
    Object? url = freezed,
    Object? width = freezed,
    Object? height = freezed,
  }) {
    return _then(_$_PicRM(
      id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      author == freezed
          ? _value.author
          : author // ignore: cast_nullable_to_non_nullable
              as String?,
      url == freezed
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
      width == freezed
          ? _value.width
          : width // ignore: cast_nullable_to_non_nullable
              as int,
      height == freezed
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable(createToJson: false)
class _$_PicRM implements _PicRM {
  _$_PicRM(this.id, this.author, this.url, this.width, this.height);

  factory _$_PicRM.fromJson(Map<String, dynamic> json) =>
      _$$_PicRMFromJson(json);

  @override
  final String id;
  @override
  final String? author;
  @override
  final String? url;
  @override
  final int width;
  @override
  final int height;

  @override
  String toString() {
    return 'PicRM(id: $id, author: $author, url: $url, width: $width, height: $height)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PicRM &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.author, author) &&
            const DeepCollectionEquality().equals(other.url, url) &&
            const DeepCollectionEquality().equals(other.width, width) &&
            const DeepCollectionEquality().equals(other.height, height));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(author),
      const DeepCollectionEquality().hash(url),
      const DeepCollectionEquality().hash(width),
      const DeepCollectionEquality().hash(height));

  @JsonKey(ignore: true)
  @override
  _$$_PicRMCopyWith<_$_PicRM> get copyWith =>
      __$$_PicRMCopyWithImpl<_$_PicRM>(this, _$identity);
}

abstract class _PicRM implements PicRM {
  factory _PicRM(final String id, final String? author, final String? url,
      final int width, final int height) = _$_PicRM;

  factory _PicRM.fromJson(Map<String, dynamic> json) = _$_PicRM.fromJson;

  @override
  String get id;
  @override
  String? get author;
  @override
  String? get url;
  @override
  int get width;
  @override
  int get height;
  @override
  @JsonKey(ignore: true)
  _$$_PicRMCopyWith<_$_PicRM> get copyWith =>
      throw _privateConstructorUsedError;
}
