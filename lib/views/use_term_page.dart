import 'package:flutter/material.dart';
import 'package:lost_and_found/widgets/custom_drawer.dart';
import 'package:lost_and_found/widgets/topic.dart';

class UseTermPage extends StatefulWidget {
  static const String routeName = '/useterm';
  @override
  _UseTermPageState createState() => _UseTermPageState();
}

class _UseTermPageState extends State<UseTermPage> {
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
      title: Text('Termos de uso'),
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
              Topic(
                  icon: Icons.description,
                  title: 'Licença',
                  text: "Copyright 2019 Marcelo da Silva Benedito \n\n" +
                      "Permission is hereby granted, free of charge, to any person obtaining a copy" +
                      "of this software and associated documentation files (the \"Software\"), to deal" +
                      "in the Software without restriction, including without limitation the rights" +
                      "to use, copy, modify, merge, publish, distribute, sublicense, and/or sell" +
                      "copies of the Software, and to permit persons to whom the Software is" +
                      "furnished to do so, subject to the following conditions: \n\n" +
                      "The above copyright notice and this permission notice shall be included in all" +
                      "copies or substantial portions of the Software. \n\n" +
                      "THE SOFTWARE IS PROVIDED \"AS IS\", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR" +
                      "IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY," +
                      "FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE" +
                      "AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER" +
                      "LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM," +
                      "OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE" +
                      "SOFTWARE."),
            ],
          ),
        ));
  }
}
