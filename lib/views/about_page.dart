import 'package:flutter/material.dart';
import 'package:lost_and_found/widgets/custom_drawer.dart';
import 'package:lost_and_found/widgets/topic.dart';

class AboutPage extends StatefulWidget {
  static const String routeName = '/about';
  @override
  _AboutPageState createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      drawer: CustomDrawer(),
      body: _buildBody(),
    );
  }

  Widget _buildAppBar() {
    return AppBar(
      title: Text('Sobre o projeto'),
    );
  }

  Widget _buildBody() {
    return Container(
        padding: EdgeInsets.all(16.0),
        height: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Topic(icon: Icons.description, title: 'Descrição',
                  text: 'Aplicativo online de achados e perdidos utilizando Flutter e Firebase.'),
              Topic(icon: Icons.lightbulb_outline, title: 'Objetivo',
                  text: 'Possui como principal objetivo ajudar as pessoas a encontrar seus pertences perdidos.'),
              Topic(icon: Icons.person, title: 'Autor',
                  text: 'Marcelo da Silva Benedito, estudante de Engenharia da Computação, Unisal.'),
            ],
          ),
        ));
  }
}
