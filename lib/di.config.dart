// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import 'bloc/cubit.dart' as _i404;
import 'core/constants.dart' as _i788;
import 'Repostiry/Local/Home_Local_Impl.dart' as _i1067;
import 'Repostiry/Local/Home_Local_Repo.dart' as _i1057;
import 'Repostiry/Remot/Home_Remot_impl.dart' as _i975;
import 'Repostiry/Remot/Home_Remot_Repo.dart' as _i94;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.factory<_i1057.HomeLocalRepo>(() => _i1067.HomeLocalImpl());
    gh.factory<_i94.HomeRemoteRepo>(
      () => _i975.HomeRemotImpl(gh<_i788.AppConstants>()),
    );
    gh.factory<_i404.HomeCubit>(
      () => _i404.HomeCubit(
        gh<_i94.HomeRemoteRepo>(),
        gh<_i1057.HomeLocalRepo>(),
      ),
    );
    return this;
  }
}
