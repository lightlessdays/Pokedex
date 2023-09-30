import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'theme_state.dart';

// Values are stored and updated here
class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(ThemeLight(message: 'Dark Theme'));

  bool get isDark => false;

}
