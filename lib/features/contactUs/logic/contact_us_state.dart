import 'package:freezed_annotation/freezed_annotation.dart';
part  'contact_us_state.freezed.dart';

@Freezed()
class ContactUsState<T> with _$ContactUsState<T> {
  const factory ContactUsState.initial() = _Initial;
  const factory ContactUsState.loading() = Loading;
  const factory ContactUsState.loaded() = Loaded;
  const factory ContactUsState.success(T data)=Success<T>;
  const factory ContactUsState.error({required String message}) = Error;
}
