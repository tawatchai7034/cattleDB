import 'package:cattle_db/db/dbHelper.dart';
import 'package:cattle_db/models/catPro.dart';
import 'package:cattle_db/screens/catPro_screen.dart';
import 'package:flutter/material.dart';

class CatTimeScreen extends StatefulWidget {
  final int catProID;
  const CatTimeScreen({
    Key? key,
    required this.catProID,
  }) : super(key: key);

  @override
  State<CatTimeScreen> createState() => _CatTimeScreenState();
}

class _CatTimeScreenState extends State<CatTimeScreen> {
  late CatPro catPro;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();

    refreshCatPro();
  }

  Future refreshCatPro() async {
    setState(() => isLoading = true);

    this.catPro = await CattleDB.instance.readCatPro(widget.catProID);

    setState(() => isLoading = false);

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("cattle"), actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.edit)),
          IconButton(onPressed: () {}, icon: Icon(Icons.delete)),
          // IconButton(
          //     onPressed: () {
          //       Navigator.of(context).pushAndRemoveUntil(
          //           MaterialPageRoute(builder: (context) => CatProScreen()),
          //           (Route<dynamic> route) => false);
          //     },
          //     icon: Icon(Icons.home)),
        ]),
        body: isLoading
            ? Center(child: CircularProgressIndicator())
            : Center(
                child: Text(
                    "Cattle profile ID: ${widget.catProID}\nCatPro: ${catPro.id}\nName: ${catPro.name}\nGender: ${catPro.gender}\nSpecies: ${catPro.species}")));
  }
}
