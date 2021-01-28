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

  bool isPressed = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                      color: isPressed ? Colors.blue : Colors.grey,
                    ), 
                    onPressed: (){
                      isPressed = !isPressed;
                      setState(() {});
                    },
                  ),
                  Text("999"),
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
                    children: [
                      Icon(Icons.mail, size: 64,),
                      Text("Correo"),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Icon(Icons.call, size: 64,),
                      Text("Llamar"),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Icon(Icons.directions, size: 64,),
                      Text("Ruta"),
                    ],
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Text("El ITESO, Universidad Jesuita de Guadalajara, es una universidad privada ubicada en la Zona Metropolitana de Guadalajara, Jalisco, México, fundada en el año 1957. La institución forma parte del Sistema Universitario Jesuita que integra a ocho universidades en México. Fundada en el año de 1957 por el ingeniero José Fernández del Valle y Ancira, entre otros, la universidad ha tenido una larga trayectoria. A continuación se presenta la historia de la institución en periodos de décadas."),
            ),
          ],
        ),
      ),
    );
  }
}