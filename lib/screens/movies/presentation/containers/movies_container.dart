import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/movies_cubit.dart';
import '../bloc/movies_cubit_state.dart';
import '../screens/movies_error_screen.dart';
import '../screens/movies_loading_screen.dart';
import '../screens/movies_screen.dart';

class MoviesContainer extends BlocBuilder<MoviesCubit, MoviesCubitState> {
  static String routeName = '/movies';

  MoviesContainer({super.key})
      : super(
          builder: (context, state) {
            onBackPressed() => Navigator.of(context).pop();
            switch (state.status) {
              case MoviesCubitStateStatus.loading:
                return MoviesLoadingScreen(
                  onBackPressed: onBackPressed,
                );
              case MoviesCubitStateStatus.loaded:
                return MoviesScreen(
                  onBackPressed: onBackPressed,
                  moviesList: state.moviesList,
                );
              case MoviesCubitStateStatus.error:
                return MoviesErrorScreen(
                  onBackPressed: onBackPressed,
                  errorMessage: state.error ?? '',
                );
            }
          },
        );
}

// Future<void> _showSnackBar() async {
//   ScaffoldMessenger.of(context).showSnackBar(
//     SnackBar(
//       backgroundColor: Colors.red,
//       content: Text(
//         error.toString(),
//       ),
//     ),
//   );
// }
