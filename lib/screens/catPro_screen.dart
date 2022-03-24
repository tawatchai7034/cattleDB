import 'package:cattle_db/db/dbHelper.dart';
import 'package:cattle_db/models/catPro.dart';
import 'package:flutter/material.dart';

class CatProScreen extends StatefulWidget {
  const CatProScreen({Key? key}) : super(key: key);

  @override
  State<CatProScreen> createState() => _CatProScreenState();
}

class _CatProScreenState extends State<CatProScreen> {
  late List<CatPro> catPros;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();

    refreshCatPro();
  }

  @override
  void dispose() {
    CattleDB.instance.close();

    super.dispose();
  }

  Future refreshCatPro() async {
    setState(() => isLoading = true);

    this.catPros = await CattleDB.instance.readAllCatPro();

    setState(() => isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Cattle DB")),
        body: Center(
          child: isLoading
              ? CircularProgressIndicator()
              : catPros.isEmpty
                  ? Text(
                      'No Notes',
                      style: TextStyle(color: Colors.white, fontSize: 24),
                    )
                  : Text("List data in catpro table: ${catPros.length}"),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            final cattlePro =
                CatPro(name: "catll01", gender: true, species: "Brahman");
            CattleDB.instance.createCatPro(cattlePro).then((value) {
              print("Add data completed.");
              refreshCatPro();
            });
          },
          child: Icon(Icons.add),
        ));
  }


}
