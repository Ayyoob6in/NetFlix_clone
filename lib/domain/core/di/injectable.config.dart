// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../../application/bloc/downloads_bloc.dart' as _i10;
import '../../../application/fast_laugh/bloc/fast_laugh_bloc.dart' as _i11;
import '../../../application/hot_and_new/bloc/hotand_new_bloc_bloc.dart' as _i5;
import '../../../application/search/searchbloc/search_bloc.dart' as _i12;
import '../../../infrastructure/downloads/downloads_repository.dart' as _i7;
import '../../../infrastructure/downloads/search/search_impli.dart' as _i9;
import '../../../infrastructure/hot_and_new/hot_and_new_implimentation.dart'
    as _i4;
import '../../downloads/i_downloads_repo.dart' as _i6;
import '../../hot_and_new/model/hot_and_new_service.dart' as _i3;
import '../../search/model/search_response/search_service.dart'
    as _i8; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(
  _i1.GetIt get, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    get,
    environment,
    environmentFilter,
  );
  gh.lazySingleton<_i3.HotNewService>(() => _i4.HotAndNewImplimentation());
  gh.factory<_i5.HotandNewBlocBloc>(
      () => _i5.HotandNewBlocBloc(get<_i3.HotNewService>()));
  gh.lazySingleton<_i6.IDownloads>(() => _i7.DownloadsRepository());
  gh.lazySingleton<_i8.SearchService>(() => _i9.SearchImpli());
  gh.factory<_i10.DownloadsBloc>(
      () => _i10.DownloadsBloc(get<_i6.IDownloads>()));
  gh.factory<_i11.FastLaughBloc>(
      () => _i11.FastLaughBloc(get<_i6.IDownloads>()));
  gh.factory<_i12.SearchBloc>(() => _i12.SearchBloc(
        get<_i6.IDownloads>(),
        get<_i8.SearchService>(),
      ));
  return get;
}
