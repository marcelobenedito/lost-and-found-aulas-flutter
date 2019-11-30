import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:lost_and_found/models/user.dart';
import 'package:lost_and_found/services/auth.dart';
import 'package:lost_and_found/views/sign_in_page.dart';

class SignUpPage extends StatefulWidget {
  static const String routeName = '/signup';

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = new GlobalKey<FormState>();

  final _nameController = new TextEditingController();
  final _emailController = new TextEditingController();
  final _passwordController = new TextEditingController();
  final _confirmPasswordController = new TextEditingController();

  final _nameFocusNode = new FocusNode();
  final _emailFocusNode = new FocusNode();
  final _passwordFocusNode = new FocusNode();
  final _confirmPasswordFocusNode = new FocusNode();

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
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 50.0,
              ),
              _showTitle(),
              SizedBox(
                height: 20.0,
              ),
              _showNameTextField(),
              SizedBox(
                height: 20.0,
              ),
              _showEmailTextField(),
              SizedBox(
                height: 20.0,
              ),
              _showPasswordTextField(),
              SizedBox(
                height: 20.0,
              ),
              _showConfirmPasswordTextField(),
              SizedBox(
                height: 30.0,
              ),
              _showSignUpButton(),
              SizedBox(
                height: 20.0,
              ),
              _showSignInButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _showNameTextField() {
    return TextFormField(
      controller: _nameController,
      keyboardType: TextInputType.text,
      style: TextStyle(color: Colors.white,),
      decoration: InputDecoration(
        contentPadding: EdgeInsets.all(16.0),
        hintText: 'Informe seu nome',
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
            Icons.person,
            color: Colors.yellow[500],
          ),
        ),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.0),
            borderSide: BorderSide.none),
        filled: true,
        fillColor: Colors.white.withOpacity(0.1),
      ),
      textInputAction: TextInputAction.next,
      autofocus: true,
      focusNode: _nameFocusNode,
      onEditingComplete: () =>
          FocusScope.of(context).requestFocus(_emailFocusNode),
    );
  }

  Widget _showEmailTextField() {
    return TextFormField(
      controller: _emailController,
      keyboardType: TextInputType.emailAddress,
      style: TextStyle(color: Colors.white,),
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
      textInputAction: TextInputAction.next,
      focusNode: _emailFocusNode,
      onEditingComplete: () =>
          FocusScope.of(context).requestFocus(_passwordFocusNode),
    );
  }

  Widget _showPasswordTextField() {
    return TextFormField(
      controller: _passwordController,
      keyboardType: TextInputType.text,
      obscureText: true,
      style: TextStyle(color: Colors.white,),
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
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.0),
            borderSide: BorderSide.none),
        filled: true,
        fillColor: Colors.white.withOpacity(0.1),
      ),
      textInputAction: TextInputAction.next,
      focusNode: _passwordFocusNode,
      onEditingComplete: () =>
          FocusScope.of(context).requestFocus(_confirmPasswordFocusNode),
    );
  }

  Widget _showConfirmPasswordTextField() {
    return TextFormField(
      controller: _confirmPasswordController,
      keyboardType: TextInputType.text,
      obscureText: true,
      style: TextStyle(color: Colors.white,),
      decoration: InputDecoration(
        contentPadding: EdgeInsets.all(16.0),
        hintText: 'Informe sua senha novamente',
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
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.0),
            borderSide: BorderSide.none),
        filled: true,
        fillColor: Colors.white.withOpacity(0.1),
      ),
      textInputAction: TextInputAction.next,
      focusNode: _confirmPasswordFocusNode,
    );
  }

  Future _signUp() async {
    final email = _emailController.text;
    final password = _passwordController.text;
    await Auth.signUp(email, password)
        .then(_onResultSignUpSuccess)
        .catchError((error) {
      Flushbar(
        title: 'Erro',
        message: error.toString(),
        duration: Duration(seconds: 3),
      )..show(context);
    });
  }

  void _onResultSignUpSuccess(String userId) {
    final email = _emailController.text;
    final name = _nameController.text;
    final user = User(userId: userId, name: name, email: email);
    Auth.addUser(user).then(_onResultAddUser);
  }

  void _onResultAddUser(result) {
    Flushbar(
      title: 'Novo usuário',
      message: 'Usuário registrado com sucesso!',
      duration: Duration(seconds: 2),
    )..show(context);
  }

  Widget _showSignUpButton() {
    return SizedBox(
      width: double.infinity,
      child: RaisedButton(
          padding: EdgeInsets.all(20.0),
          color: Colors.white,
          textColor: Colors.amber[700],
          child: Text('REGISTRAR'),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
          onPressed: _signUp),
    );
  }

  void _signIn() {
    Navigator.pushReplacementNamed(context, SignInPage.routeName);
  }

  Widget _showSignInButton() {
    return SizedBox(
      width: double.infinity,
      child: RaisedButton(
          padding: EdgeInsets.all(20.0),
          color: Colors.white.withOpacity(0.3),
          elevation: 0,
          textColor: Colors.white,
          child: Text('Já tem conta? faça login'.toUpperCase()),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0), side: BorderSide.none),
          onPressed: _signIn),
    );
  }

  Widget _showTitle() {
    return Text(
      "Cadastrar".toUpperCase(),
      style: TextStyle(
        color: Colors.white70,
        fontSize: 24.0,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
