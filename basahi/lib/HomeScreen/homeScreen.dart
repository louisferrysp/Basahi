import 'package:basahi/timeStore.dart';
import 'package:bottom_picker/bottom_picker.dart';
import 'package:bottom_picker/resources/arrays.dart' show BottomPickerTheme;
import 'package:flutter/material.dart';
import 'package:liquid_progress_indicator_v2/liquid_progress_indicator.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<HomeScreen> {


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          circularProgress(context),
          pumpStatus(context),

          Text('${Timestore.jam}:${Timestore.menit}' ,style: TextStyle(color: Colors.white),)
        ],
      ),
      backgroundColor: Color.fromARGB(255, 29, 28, 28),
    );
  }
}

Widget pumpStatus (BuildContext context){
  return FloatingActionButton(
    onPressed: () {
      _openTimePicker(context);
    },
    backgroundColor: Colors.transparent,
    child: Icon(Icons.water_damage_outlined, color: Colors.white, size: 50,),
  );
}

Widget circularProgress (BuildContext context){
  return Padding(
    padding: EdgeInsetsGeometry.all(10),
    child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: 125 ,
                  height: 125,
                  child: LiquidCircularProgressIndicator(
                    backgroundColor: Colors.white54,
                    value: 0.5,
                    center: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Water Level'),
                        Text('1%')
                      ],
                    ),
                    valueColor: AlwaysStoppedAnimation(Colors.lightBlueAccent),
                    direction: Axis.vertical,
                  ),
                )
              ], 
            )
          ],
        ),
  );
}

void _openTimePicker(BuildContext context) {
    BottomPicker.time(
      headerBuilder: (context) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Set your next meeting time',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15,
                color: Colors.black,
              ),
            ),
            InkWell(
              onTap: () {
                print('Picker closed');
                Navigator.pop(context);
              },
              child: Text(
                'close',
                style: TextStyle(
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          ],
        );
      },
      use24hFormat: true,
      onSubmit: (index) {
        
      String value = index.toString();

      // ambil jam & menit dari string
      String waktu = value.split(' ')[1];     // 06:00:00.000
      String jamMenit = waktu.substring(0, 5); // 06:00

      Timestore.jam = int.parse(jamMenit.split(':')[0]);
      Timestore.menit = int.parse(jamMenit.split(':')[1]);

        print('Waktu terpilih ${Timestore.jam} : ${Timestore.menit}');
        print(index);
      },
      bottomPickerTheme: BottomPickerTheme.orange,
      initialTime: Time(
        minutes: 0,
      ),
    ).show(context);
  }