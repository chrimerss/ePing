import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();


}

class _MyHomePageState extends State<MyHomePage> {
  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);

  String _surfaceLevel, _riverLevel, _groundWaterLevel, _soilmoisture, _rainLevel;
  var surfWaterController = TextEditingController();
  var riverStageController = TextEditingController();
  var groundLevelController = TextEditingController();
  var soilMoistureController = TextEditingController();
  var rainController = TextEditingController();
  var recorderController = TextEditingController();

  var _formKey = GlobalKey<FormState>();

//  void _upload(){
//    if (_formKey.currentState.validate()) {
//      _formKey.currentState.save();
//      this.widget.upload(_surfaceLevel, _riverLevel, _groundWaterLevel, _soilmoisture, _rainLevel)
//    }
//  }

  @override
  void updateSurfWater({String surfWater}){
    setState(() {
      surfWaterController.text = surfWater != null?surfWater:'';
    });
  }

  @override
  void updateRiverStage({String riverStage}){
    setState(() {
      riverStageController.text = riverStage != null?riverStage:'';
    });
  }

  @override
  void updateGroundWater({String groundWater}){
    setState(() {
      groundLevelController.text = groundWater != null?groundWater:'';
    });
  }

  @override
  void updateSoilMoisture({String soilMoisture}){
    setState(() {
      soilMoistureController.text = soilMoisture != null?soilMoisture:'';
    });
  }

  @override
  void updateRain({String rainfall}){
    setState(() {
      rainController.text = rainfall != null?rainfall:'';
    });
  }

  @override
  void updateRecorder({String recorder}){
    setState(() {
      recorderController.text = recorder != null?recorder:'';
    });
  }

  void _uploadedDialog() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('uploaded'),
            content: Text('Successfully uploaded!'),
            actions: <Widget>[
              FlatButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('Close')),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.

    final surfWaterField = TextFormField(
      style: style,
//      key: _formKey,
      controller: surfWaterController,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Surface water (m)",
          border:
          OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
      validator: (String value) {
        if (value.length == 0) {
          return ('Should not be blank!');
        };
        if  (isNumeric(value)!=true){
          return ('expected float!');
        };
        },
      onSaved: (value) {
        _surfaceLevel= value;
      },
    );

    final riverStageField = TextFormField(
      obscureText: false,
//      key: _formKey,
      controller: riverStageController,
      style: style,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "River stages (m)",
          border:
          OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
      validator: (value) {
        if (value.length == 0) {
          return ('Should not be blank!');
        };
        if  (isNumeric(value)!=true){
          return ('expected float!');
        };
      },
      onSaved: (value) {
        _riverLevel= value;
      },
    );


    final goundWaterField = TextFormField(
      obscureText: false,
//      key: _formKey,
      controller: groundLevelController,
      style: style,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Ground water level (m)",
          border:
          OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
      validator: (value) {
        if (value.length == 0) {
          return ('Should not be blank!');
        };
        if  (isNumeric(value)!=true){
          return ('expected float!');
        };
      },
      onSaved: (value) {
        _riverLevel= value;
      },
    );
    final soilMoistureField = TextFormField(
      obscureText: false,
//      key: _formKey,
      controller: soilMoistureController,
      style: style,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Soil moisture (bar)",
          border:
          OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
      validator: (value) {
        if (value.length == 0) {
          return ('Should not be blank!');
        };
        if  (isNumeric(value)!=true){
          return ('expected float!');
        };
      },
      onSaved: (value) {
        _riverLevel= value;
      },
    );

    final rainField = TextFormField(
      obscureText: false,
//      key: _formKey,
      controller: rainController,
      style: style,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Precipitation (mm)",
          border:
          OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
      validator: (value) {
        if (value.length == 0) {
          return ('Should not be blank!');
        };
        if  (isNumeric(value)!=true){
          return ('expected float!');
        };
      },
      onSaved: (value) {
        _riverLevel= value;
      },
    );

    final recorderField = TextFormField(
      controller: recorderController,
      obscureText: false,
//      key: _formKey,
      style: style,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Recorder",
          border:
          OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
      validator: (value) {
        if (value.length == 0) {
          return ('Should not be blank!');
        };
        if  (isNumeric(value)!=false){
          return ('expected string!');
        };
      },
      onSaved: (value) {
        _riverLevel= value;
      },
    );

    final uploadButon = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      color: Color(0xff01A0C7),
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: () {
          if (_formKey.currentState.validate()) {
            _formKey.currentState.save();
            _uploadedDialog();
          }

        },
        child: Text("Upload",
            textAlign: TextAlign.center,
            style: style.copyWith(
                color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    );

    return Scaffold(
        body: SingleChildScrollView(
          child: Center(
            child: Container(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(36.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(
                        height: 155.0,
                        child: Image.asset(
                          "assets/images/logo.png",
                          fit: BoxFit.contain,
                        ),
                      ),
                      SizedBox(height: 15.0),
                      surfWaterField,
                      SizedBox(height: 25.0),
                      riverStageField,
                      SizedBox(height: 25.0),
                      goundWaterField,
                      SizedBox(height: 25.0),
                      soilMoistureField,
                      SizedBox(height: 25.0),
                      rainField,
                      SizedBox(height: 25.0),
                      recorderField,
                      SizedBox(
                        height: 35.0,
                      ),
                      uploadButon,
                      SizedBox(
                        height: 15.0,
                      ),
                    ],
                  ),
                ),
            ),
          ),
        ),
    )
    );
  }
}

//// Define a custom Form widget.
//class MyCustomForm extends StatefulWidget {
//  @override
//  _MyCustomFormState createState() => _MyCustomFormState();
//}
//
//// Define a corresponding State class.
//// This class holds the data related to the Form.
//class _MyCustomFormState extends State<MyCustomForm> {
//  // Create a text controller and use it to retrieve the current value
//  // of the TextField.
//  final myController = TextEditingController();
//
//  @override
//  void dispose() {
//    // Clean up the controller when the widget is disposed.
//    myController.dispose();
//    super.dispose();
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    // Fill this out in the next step.
//  }
//}

bool isNumeric(String s) {
  if(s == null) {
    return false;
  }
  return double.parse(s, (e) => null) != null;
}