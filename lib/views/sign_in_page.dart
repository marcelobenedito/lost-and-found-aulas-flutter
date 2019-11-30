import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:lost_and_found/models/user.dart';
import 'package:lost_and_found/services/auth.dart';
import 'package:lost_and_found/views/home_page.dart';
import 'package:lost_and_found/views/sign_up.page.dart';

class SignInPage extends StatefulWidget {
  static const String routeName = '/signin';

  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final _emailController = new TextEditingController();
  final _passwordController = new TextEditingController();

  bool _obscurePassword = true;

  GoogleSignInAccount googleAccount;
  GoogleSignIn _googleSignIn = new GoogleSignIn();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: double.infinity,
          decoration: BoxDecoration(
            gradient:
                LinearGradient(colors: [Colors.amber[700], Colors.yellow[500]]),
          ),
          child: _buildForm(),
        ),
      ),
    );
  }

  Widget _buildForm() {
    return Container(
      padding: EdgeInsets.all(16.0),
      height: double.infinity,
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            _showLogo(),
            _showTitle(),
            SizedBox(
              height: 20.0,
            ),
            _showEmailTextField(),
            SizedBox(
              height: 10.0,
            ),
            _showPasswordTextField(),
            SizedBox(
              height: 30.0,
            ),
            _showSignInButton(),
            SizedBox(
              height: 10.0,
            ),
            _showSignInWithGoogleButton(),
            SizedBox(
              height: 10.0,
            ),
            _showSignUpButton(),
          ],
        ),
      ),
    );
  }

  Widget _showEmailTextField() {
    return TextField(
      controller: _emailController,
      keyboardType: TextInputType.emailAddress,
      style: TextStyle(
        color: Colors.white,
      ),
      decoration: InputDecoration(
        contentPadding: EdgeInsets.all(16.0),
        hintText: 'Informe seu email',
        hintStyle: TextStyle(color: Colors.white54),
        prefixIcon: Container(
          padding: EdgeInsets.only(top: 16.0, bottom: 16.0),
          margin: EdgeInsets.only(right: 8.0),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30.0),
                  bottomLeft: Radius.circular(30.0),
                  topRight: Radius.circular(30.0),
                  bottomRight: Radius.circular(0.0))),
          child: Icon(
            Icons.email,
            color: Colors.yellow[500],
          ),
        ),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.0),
            borderSide: BorderSide.none),
        filled: true,
        fillColor: Colors.white.withOpacity(0.1),
      ),
    );
  }

  void _toggleObscurePassword() {
    setState(() {
      _obscurePassword = !_obscurePassword;
    });
  }

  Widget _showPasswordTextField() {
    return TextField(
      controller: _passwordController,
      keyboardType: TextInputType.text,
      obscureText: _obscurePassword,
      style: TextStyle(
        color: Colors.white,
      ),
      decoration: InputDecoration(
        contentPadding: EdgeInsets.all(16.0),
        hintText: 'Informe sua senha',
        hintStyle: TextStyle(color: Colors.white54),
        prefixIcon: Container(
          padding: EdgeInsets.only(top: 16.0, bottom: 16.0),
          margin: EdgeInsets.only(right: 8.0),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30.0),
                  bottomLeft: Radius.circular(30.0),
                  topRight: Radius.circular(30.0),
                  bottomRight: Radius.circular(0.0))),
          child: Icon(
            Icons.vpn_key,
            color: Colors.yellow[500],
          ),
        ),
        suffixIcon: IconButton(
          icon:
              Icon(_obscurePassword ? Icons.visibility_off : Icons.visibility),
          onPressed: _toggleObscurePassword,
        ),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.0),
            borderSide: BorderSide.none),
        filled: true,
        fillColor: Colors.white.withOpacity(0.1),
      ),
    );
  }

  Future<void> _signIn() async {
    final email = _emailController.text;
    final password = _passwordController.text;
    await Auth.signIn(email, password)
        .then(_onSignInSuccess)
        .catchError((error) {
      print('Caught error: $error');
      Flushbar(
        title: 'Erro',
        message: error.toString(),
        duration: Duration(seconds: 3),
      )..show(context);
    });
  }

  Future<Null> initUser() async {
    googleAccount = await getSignedInAccount(_googleSignIn);
    if (googleAccount != null) {
      await _signInWithGoogle();
    }
  }

  Future<GoogleSignInAccount> getSignedInAccount(
      GoogleSignIn googleSignIn) async {
    GoogleSignInAccount account = googleSignIn.currentUser;
    if (account != null) {
      account = await googleSignIn.signInSilently();
    }
    return account;
  }

  Future<void> _signInWithGoogle() async {
    if (googleAccount == null) {
      googleAccount = await _googleSignIn.signIn();
    }
    await Auth.signInWithGoogle(googleAccount).then((uid) {
      Auth.getCurrentFirebaseUser().then((firebaseUser) {
        User user = new User(
          name: firebaseUser.displayName,
          userId: firebaseUser.uid,
          email: firebaseUser.email ?? '',
          profilePictureUrl: firebaseUser.photoUrl ?? '',
        );
        Auth.addUser(user);
        Navigator.of(context).pop();
        _onSignInSuccess(user.userId);
      });
    }).catchError((error) {
      print('Caught error: $error');
      Flushbar(
        title: 'Erro',
        message: error.toString(),
        duration: Duration(seconds: 3),
      )..show(context);
    });
  }

  Future _onSignInSuccess(String userId) async {
    final user = await Auth.getUser(userId);
    print(user.name);
    await Auth.storeUserLocal(user);
    Navigator.pushReplacementNamed(context, HomePage.routeName);
  }

  Widget _showSignInButton() {
    return SizedBox(
      width: double.infinity,
      child: RaisedButton(
          padding: EdgeInsets.all(20.0),
          color: Colors.white,
          textColor: Colors.amber[700],
          child: Text('LOGIN'),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
          onPressed: _signIn),
    );
  }

  Widget _showSignInWithGoogleButton() {
    return SizedBox(
      width: double.infinity,
      height: 55.0,
      child: RaisedButton(
          padding: EdgeInsets.all(13.0),
          color: Colors.white.withOpacity(0.7),
          elevation: 0,
          textColor: Colors.amber[700],
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(right: 5.0),
                child: Image.asset(
                  'assets/images/google-account.png',
                ),
              ),
              Text('Entrar com o Google'),
            ],
          ),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
          onPressed: _signInWithGoogle),
    );
  }

  void _signUp() {
    Navigator.pushReplacementNamed(context, SignUpPage.routeName);
  }

  Widget _showSignUpButton() {
    return SizedBox(
      width: double.infinity,
      child: RaisedButton(
          padding: EdgeInsets.all(20.0),
          color: Colors.white.withOpacity(0.3),
          elevation: 0,
          textColor: Colors.white,
          child: Text('Registrar-se'.toUpperCase()),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0), side: BorderSide.none),
          onPressed: _signUp),
    );
  }

  Widget _showLogo() {
    return Container(
      margin: EdgeInsets.only(top: 20.0, bottom: 20.0),
      height: 150.0,
      child: Image.asset(
          'assets/images/res/mipmap-xxxhdpi/lost_and_found_logo.png'),
    );
  }

  Widget _showTitle() {
    return Text(
      "Lost and Found".toUpperCase(),
      style: TextStyle(
        color: Colors.white70,
        fontSize: 24.0,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
