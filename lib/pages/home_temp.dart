import 'package:flutter/material.dart';
import 'package:widgets/providers/menu_provider.dart';
import 'package:widgets/utils/icono_string_util.dart';

class HomePageTemp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Componentes widgets Yareli'),
          backgroundColor: Colors.yellowAccent,
        ),
        body: _lista(context));
  }
}

Widget _lista(BuildContext context) {
  final futureBuilder = FutureBuilder(
      future: menuprovider.cargarDatos(),
      initialData: [],
      builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
        if (snapshot.hasError) {
          return Center(child: Text('ERROR ${snapshot.error.toString()}'));
        }
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }

        return ListView(
          children: _listaItems(snapshot.data, context),
        );
      });
  return futureBuilder;
}

List<Widget> _listaItems(List<dynamic> data, BuildContext context) {
  final List<Widget> opcioness = [];
  data.forEach((opt) {
    final widgetTemp = ListTile(
      title: Text(opt['texto']),
      leading: getIcon(opt['icon']),
      trailing: Icon(
        Icons.keyboard_arrow_right_sharp,
        color: Colors.orange,
      ),
      onTap: () {
        showDialog(
            context: context,
            builder: (BuildContext context) =>
                _buildPopUpDialog(context, opt['texto']));
      },
    );
    opcioness..add(widgetTemp)..add(Divider());
  });
  return opcioness;
}

Widget _buildPopUpDialog(BuildContext context, String opt) {
  return new AlertDialog(
    title: Text('Seleccionado $opt'),
    content: new Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        new FlatButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          textColor: Theme.of(context).primaryColorDark,
          child: Text('cerrar'),
        )
      ],
    ),
  );
}
