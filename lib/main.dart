import 'package:flutter/material.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({
    Key key,
  }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  bool like_isPressed = false;
  bool dislike_isPressed = false;
  int counter = 0;
  var _scaffoldKey = GlobalKey<ScaffoldState>();
  DateTime current = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text('Material App Bar'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset("assets/iteso.jpg"),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 8, 
                vertical: 10
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("ITESO, Universidad Jesuita de Guadalajara", 
                        style: TextStyle(fontWeight: FontWeight.bold)
                        ),
                        Text("San Pedro Tlaquepaque"),
                      ],
                    ),
                  ),
                  //IconButton(icon: icon, onPressed: onPressed)
                  IconButton(
                    icon: Icon(
                      Icons.thumb_up, 
                      color: like_isPressed ? Colors.blue : Colors.grey,
                    ), 
                    onPressed: (){
                      like_isPressed = !like_isPressed;
                      dislike_isPressed = false;
                      counter++;
                      setState(() {});
                    },
                  ),
                  Text("$counter"),
                  IconButton(
                    icon: Icon(
                      Icons.thumb_down, 
                      color: dislike_isPressed ? Colors.red : Colors.grey,
                    ), 
                    onPressed: (){
                      dislike_isPressed = !dislike_isPressed;
                      like_isPressed = false;
                      counter--;
                      setState(() {});
                    },
                  ),
                  SizedBox(width: 8)
                ]
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      IconButton(
                        icon: Icon(Icons.mail),
                        iconSize: 64,
                        onPressed: () {
                          _scaffoldKey.currentState
                          ..hideCurrentSnackBar()
                          ..showSnackBar(
                            SnackBar(
                              content: Text("Enviar correo")
                            ),
                          );
                        },
                      ),
                      Text("Correo")
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      IconButton(
                        icon: Icon(Icons.call),
                        iconSize: 64,
                        onPressed: () {
                          _scaffoldKey.currentState
                          ..hideCurrentSnackBar()
                          ..showSnackBar(
                            SnackBar(
                              content: Text("Hacer llamada")
                            ),
                          );
                        },
                      ),
                      Text("Llamar")
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      IconButton(
                        icon: Icon(Icons.directions),
                        iconSize: 64,
                        onPressed: () {
                          _scaffoldKey.currentState
                          ..hideCurrentSnackBar()
                          ..showSnackBar(
                            SnackBar(
                              content: Text("Ir al ITESO")
                            ),
                          );
                        },
                      ),
                      Text("Ruta")
                    ],
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Text("El ITESO, Universidad Jesuita de Guadalajara, es una universidad privada ubicada en la Zona Metropolitana de Guadalajara, Jalisco, México, fundada en el año 1957. La institución forma parte del Sistema Universitario Jesuita que integra a ocho universidades en México. Fundada en el año de 1957 por el ingeniero José Fernández del Valle y Ancira, entre otros, la universidad ha tenido una larga trayectoria. A continuación se presenta la historia de la institución en periodos de décadas."),
            ),
            Row(
              children: <Widget>[
                    IconButton(
                      icon: Icon(Icons.help),
                      iconSize: 32,
                      onPressed: () {
                        if (counter % 2 == 0) {
                          showDialog(
                            context: context,
                            builder: (_) => new AlertDialog(
                              title: new Text("Likes pares"),
                              content: new Text("El contador de likes es par"),
                              actions: <Widget>[
                                FlatButton(
                                  child: Text('Cerrar'),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                )
                              ],
                            )
                          );
                        } else {
                          showDialog(
                            context: context,
                            builder: (_) => new AlertDialog(
                              title: new Text("Like impares"),
                              content: new Text("$current"),
                              actions: <Widget>[
                                FlatButton(
                                  child: Text('Cerrar'),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                )
                              ],
                            )
                          );
                        }
                      },
                    ),
                    Text("Likes par/impar")
                  ],
            ),
          ],
        ),
      ),
    );
  }
}