// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'example_ui_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ExampleUiModel {
  String get displayName => throw _privateConstructorUsedError;
  int get age => throw _privateConstructorUsedError;

  /// Create a copy of ExampleUiModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ExampleUiModelCopyWith<ExampleUiModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ExampleUiModelCopyWith<$Res> {
  factory $ExampleUiModelCopyWith(
          ExampleUiModel value, $Res Function(ExampleUiModel) then) =
      _$ExampleUiModelCopyWithImpl<$Res, ExampleUiModel>;
  @useResult
  $Res call({String displayName, int age});
}

/// @nodoc
class _$ExampleUiModelCopyWithImpl<$Res, $Val extends ExampleUiModel>
    implements $ExampleUiModelCopyWith<$Res> {
  _$ExampleUiModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ExampleUiModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? displayName = null,
    Object? age = null,
  }) {
    return _then(_value.copyWith(
      displayName: null == displayName
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String,
      age: null == age
          ? _value.age
          : age // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ExampleUiModelImplCopyWith<$Res>
    implements $ExampleUiModelCopyWith<$Res> {
  factory _$$ExampleUiModelImplCopyWith(_$ExampleUiModelImpl value,
          $Res Function(_$ExampleUiModelImpl) then) =
      __$$ExampleUiModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String displayName, int age});
}

/// @nodoc
class __$$ExampleUiModelImplCopyWithImpl<$Res>
    extends _$ExampleUiModelCopyWithImpl<$Res, _$ExampleUiModelImpl>
    implements _$$ExampleUiModelImplCopyWith<$Res> {
  __$$ExampleUiModelImplCopyWithImpl(
      _$ExampleUiModelImpl _value, $Res Function(_$ExampleUiModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of ExampleUiModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? displayName = null,
    Object? age = null,
  }) {
    return _then(_$ExampleUiModelImpl(
      displayName: null == displayName
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String,
      age: null == age
          ? _value.age
          : age // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$ExampleUiModelImpl implements _ExampleUiModel {
  const _$ExampleUiModelImpl({required this.displayName, required this.age});

  @override
  final String displayName;
  @override
  final int age;

  @override
  String toString() {
    return 'ExampleUiModel(displayName: $displayName, age: $age)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ExampleUiModelImpl &&
            (identical(other.displayName, displayName) ||
                other.displayName == displayName) &&
            (identical(other.age, age) || other.age == age));
  }

  @override
  int get hashCode => Object.hash(runtimeType, displayName, age);

  /// Create a copy of ExampleUiModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ExampleUiModelImplCopyWith<_$ExampleUiModelImpl> get copyWith =>
      __$$ExampleUiModelImplCopyWithImpl<_$ExampleUiModelImpl>(
          this, _$identity);
}

abstract class _ExampleUiModel implements ExampleUiModel {
  const factory _ExampleUiModel(
      {required final String displayName,
      required final int age}) = _$ExampleUiModelImpl;

  @override
  String get displayName;
  @override
  int get age;

  /// Create a copy of ExampleUiModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ExampleUiModelImplCopyWith<_$ExampleUiModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
