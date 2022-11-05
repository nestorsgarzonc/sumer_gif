import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sumer_gif/core/di/di.dart';
import 'package:sumer_gif/core/theme/theme.dart';
import 'package:sumer_gif/gifs/bloc/gifs_bloc.dart';
import 'package:sumer_gif/gifs/ui/gifs_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<GifsBloc>(create: (context) => DI.di()),
      ],
      child: MaterialApp(
        title: 'GifsApp',
        debugShowCheckedModeBanner: false,
        theme: CustomTheme.myTheme(),
        home: GifsScreen(),
      ),
    );
  }
}
