import 'package:deriv_passkeys/presentation/states/bloc/deriv_passkeys_bloc.dart';
import 'package:deriv_passkeys/presentation/widgets/continue_with_passkey_button.dart';
import 'package:deriv_theme/deriv_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DerivPasskeysBloc(),
      child: MaterialApp(
        theme: ThemeData(
          primaryColor: context.theme.colors.secondary,
          fontFamily: context.theme.fontFamily,
          brightness: Brightness.dark,
          bottomSheetTheme: BottomSheetThemeData(
            backgroundColor: Colors.black.withOpacity(0),
            modalBarrierColor: Colors.black.withOpacity(0.72),
          ),
          unselectedWidgetColor: context.theme.colors.lessProminent,
          toggleButtonsTheme: ToggleButtonsThemeData(
            textStyle: context.theme.textStyle(
              textStyle: TextStyles.body2,
            ),
          ),
          colorScheme: const ColorScheme.dark().copyWith(
            primary: context.theme.colors.prominent,
            secondary: context.theme.colors.coral,
          ),
          textSelectionTheme: TextSelectionThemeData(
            cursorColor: context.theme.colors.lessProminent,
            selectionHandleColor: context.theme.colors.lessProminent,
            selectionColor: context.theme.colors.lessProminent,
          ),
          appBarTheme: AppBarTheme.of(context).copyWith(
            backgroundColor: context.theme.colors.secondary,
            centerTitle: false,
          ),
        ),
        home: Scaffold(
          backgroundColor: context.theme.colors.primary,
          appBar: AppBar(
            title: const Text('Deriv Passkeys example app'),
          ),
          body: const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ContinueWithPasskeyButton(),
            ],
          ),
        ),
      ),
    );
  }
}

// large blue InkWell Button stateless
class LargeBlueInkWellButton extends StatelessWidget {
  final String text;
  final Function() onTap;

  const LargeBlueInkWellButton({
    super.key,
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: Container(
        height: 48,
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: Text(
            text,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
