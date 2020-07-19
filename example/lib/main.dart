import 'package:lit_firebase_auth/lit_firebase_auth.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LitAuthInit(
      authProviders: AuthProviders(
        emailAndPassword: true,
        google: true,
        anonymous: true,
      ),
      child: MaterialApp(
        title: 'Material App',
        theme: ThemeData(
          primaryColor: Colors.blueGrey,
          accentColor: Colors.pink[400],
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: SplashScreen(),
      ),
    );
  }
}

class SplashScreen extends StatelessWidget {
  const SplashScreen({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: LitAuthState(
            authenticated: RaisedButton(
              onPressed: () {
                context.signOut();
              },
              child: Text('Sign out'),
            ),
            unauthenticated: LitAuth(
              config: AuthConfig.standard(
                title: Text(
                  '🔥Welcome to Lit Firebase!🔥',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headline4,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class CustomSignInWidget extends StatelessWidget {
  const CustomSignInWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Welcome', style: Theme.of(context).textTheme.headline4),
        RaisedButton(
          onPressed: () {
            context.signInAnonymously();
          },
          child: Text('Anony Sign In'),
        ),
        SignInForm(
          formChild: Column(
            children: [
              Text(
                'This is my custom form',
                style: Theme.of(context).textTheme.headline5,
              ),
              EmailTextFormField(
                decoration: InputDecoration(labelText: 'My Email Label'),
              ),
              PasswordTextFormField(
                decoration: InputDecoration(labelText: 'My Password Label'),
              ),
              RaisedButton(
                onPressed: () {
                  context.signInWithEmailAndPassword();
                },
                child: Text('Sign In'),
              )
            ],
          ),
        ),
      ],
    );
  }
}

class Home extends StatelessWidget {
  const Home({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Signed In'),
        actions: [
          FlatButton(
            onPressed: () {
              context.signOut();
            },
            child: Text('Sign out'),
          ),
        ],
      ),
      body: Center(
        child: Text('You can do what you want here'),
      ),
    );
  }
}
