import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_app/core/constants/constants_url.dart';
import 'package:test_app/core/models/url_model.dart';
import 'package:test_app/repository/remote_firebase_config_service.dart';

part 'main_page_state.dart';

class MainPageCubit extends Cubit<MainPageState> {
  MainPageCubit() : super(MainPageInitialState());

  Future<void> fetchUrl() async {
    try {
      emit(MainPageLoadingState());
      final SharedPreferences prefs = (await SharedPreferences.getInstance());
      if (await InternetConnectionChecker().hasConnection) {
        if (prefs.getString('url_key') == null) {
          final UrlModel data = await RemoteFirebaseConfigService().init();
          await prefs.setString('url_key', data.url);
          emit(MainPageLoadedState(url: data.url));
        } else {
          final String? url = prefs.getString('url_key');
          emit(MainPageLoadedState(url: url!));
        }
      } else {
        emit(MainPageErrorState());
      }
    } catch (e) {
      emit(MainPageLoadedState(url: ConstantUrl().baseUrl));
    }
  }
}
