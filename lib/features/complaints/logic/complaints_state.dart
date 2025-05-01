import 'package:freezed_annotation/freezed_annotation.dart';
part  'complaints_state.freezed.dart';

@Freezed()
class ComplaintsState<T> with _$ComplaintsState<T> {
  const factory ComplaintsState.initial() = _Initial;
  const factory ComplaintsState.loadingTypes() = LoadingTypes;
  const factory ComplaintsState.loading() = Loading;
  const factory ComplaintsState.loaded() = Loaded;
  const factory ComplaintsState.success(T data)=Success<T>;
  const factory ComplaintsState.error({required String message}) = Error;
}
