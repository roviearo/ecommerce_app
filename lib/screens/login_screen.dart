import 'package:ecommerce_app/blocs/authentication/authentication_bloc.dart';
import 'package:ecommerce_app/utils/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isHidden = true;

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthenticationBloc, AuthenticationState>(
      listener: (context, state) {
        if (state is Authenticated) {
          router.pushNamed('main');
        }
      },
      child: KeyboardDismisser(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: SafeArea(
            bottom: false,
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 30),
                  Center(
                    child: Image.asset(
                      'images/logo.png',
                      width: MediaQuery.sizeOf(context).width * .3,
                    ),
                  ),
                  Expanded(child: SizedBox.shrink()),
                  Text(
                    'Login',
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Enter your username and password to login and start shopping.',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.outline,
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Username',
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    controller: usernameController,
                    decoration: InputDecoration(
                      hint: Text(
                        'example',
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.outline,
                        ),
                      ),
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Password',
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    controller: passwordController,
                    obscureText: isHidden,
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            isHidden = !isHidden;
                          });
                        },
                        icon: SvgPicture.asset(
                          'icons/${isHidden ? 'visible_off' : 'visible'}.svg',
                          colorFilter: ColorFilter.mode(
                            Theme.of(context).colorScheme.outline,
                            BlendMode.srcIn,
                          ),
                        ),
                      ),
                      hint: Text(
                        '********',
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.outline,
                        ),
                      ),
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "Forgot password?",
                        style: Theme.of(context).textTheme.labelLarge?.copyWith(
                          color: Theme.of(context).colorScheme.secondary,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  FilledButton(
                    onPressed: () {
                      context.read<AuthenticationBloc>().add(
                        SignInEvent(
                          usernameController.text,
                          passwordController.text,
                        ),
                      );
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [Text('Login')],
                    ),
                  ),
                  SizedBox(height: 30),
                  Stack(
                    alignment: AlignmentGeometry.center,
                    children: [
                      Divider(height: 0),
                      Container(
                        color: Theme.of(context).colorScheme.surface,
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        child: Text(
                          'Or login with',
                          style: TextStyle(
                            color: Theme.of(context).disabledColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 30),
                  OutlinedButton(
                    onPressed: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset('icons/google.svg'),
                        SizedBox(width: 8),
                        Text(
                          'Google',
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.onSurface,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  OutlinedButton(
                    onPressed: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset('icons/facebook.svg'),
                        SizedBox(width: 8),
                        Text(
                          'Facebook',
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.onSurface,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Don`t hava an account? '),
                      Text(
                        'Register',
                        style: Theme.of(context).textTheme.labelLarge?.copyWith(
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
