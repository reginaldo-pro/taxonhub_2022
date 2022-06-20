part of 'searchs_bloc.dart';

@freezed
class SearchsState with _$SearchsState {
  const factory SearchsState.empty() = _Empty;
  const factory SearchsState.initial() = _Initial;
  const factory SearchsState.loading() = _Loading;
  const factory SearchsState.imported(PlatformFile file) = _Imported;
  const factory SearchsState.warning() = _Warning;
  const factory SearchsState.success({
    required List<Taxonomic> taxonomicsList,
    required String fileName,
  }) = _Success;
  const factory SearchsState.error(DefaultErrors error) = _Error;
}
