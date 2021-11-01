import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:movies_app/common/constants/languages.constants.dart';
import 'package:movies_app/common/screenutil/screenutil.dart';
import 'package:movies_app/di/get_it.dart';
import 'package:movies_app/presentation/blocs/language/bloc/language_bloc.dart';
import 'package:movies_app/presentation/journeys/home/home.screen.dart';
import 'package:movies_app/presentation/movie.app.localizations.dart';
import 'package:movies_app/presentation/themes/app_color.dart';
import 'package:movies_app/presentation/themes/theme_text.dart';

class MovieApp extends StatefulWidget {
  @override
  _MovieAppState createState() => _MovieAppState();
}

class _MovieAppState extends State<MovieApp> {

  late LanguageBloc _languageBloc;

  @override
  void initState() {
    super.initState();
    _languageBloc = getItInstance<LanguageBloc>();
  }

  @override
  void dispose() {
    //  Close the Bloc in the dispose method.
    _languageBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    ScreenUtil.init();
    // Use BlocProvider to provide the app with LanguageBloc.
    return BlocProvider<LanguageBloc>.value(
      value: _languageBloc,
      // Use BlocBuilder to read the LanguageBloc down the tree.
      child: BlocBuilder<LanguageBloc, LanguageState>(
        builder: (context, state) {
          // Instead of taking locale from one of the languages, take it from the state now. When the state changes,
          // the locale will also change and will update all the strings in the application.
          if (state is LanguageLoaded) {

            return MaterialApp(
              supportedLocales: Languages.languages.map((e) => Locale(e.code)).toList(),
              // When the state is not LanguageLoaded, you can return a SizedBox.
              locale: state.locale,
              localizationsDelegates: [
                AppLocalizations.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
              ],
              // Use MaterialApp widget with debugBanner as false.
              debugShowCheckedModeBanner: false,
              title: 'Movie App',
              // Define ThemeData of the app. Make vulcan as primary as well as scaffoldBackground color.
              // All our screens have vulcan as their background color. Also, give the text theme.
              theme: ThemeData(
                primaryColor: AppColor.vulcan,
                accentColor: AppColor.royalBlue,
                // We have to give a color to unselectedWidgetColor in ThemeData because ExpansionTile uses this color
                // when in a collapsed state. Without this, we are unable to see the collapsed arrow on the right
                // side of the Language tile.
                unselectedWidgetColor: AppColor.royalBlue,
                scaffoldBackgroundColor: AppColor.vulcan,
                visualDensity: VisualDensity.adaptivePlatformDensity,
                textTheme: ThemeText.getTextTheme(),
                appBarTheme: const AppBarTheme(elevation: 0),
              ),
              home: HomeScreen(),
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}