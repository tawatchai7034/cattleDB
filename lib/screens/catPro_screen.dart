import 'package:cattle_db/db/dbHelper.dart';
import 'package:cattle_db/models/catPro.dart';
import 'package:cattle_db/screens/catTime_screen.dart';
import 'package:cattle_db/widget/catPro_dialog.dart';
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
        appBar: AppBar(
            title: Text("Cattle DB"),
            actions: [IconButton(onPressed: () {}, icon: Icon(Icons.search))]),
        body: Center(
          child: isLoading
              ? CircularProgressIndicator()
              : catPros.isEmpty
                  ? Text(
                      'No Cattle Profile!!!!!\nPlease add cattle data.',
                      style: TextStyle(color: Colors.white, fontSize: 24),
                    )
                  : ListView.builder(
                      itemCount: catPros.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: InkWell(
                            onTap: () {
                              // Navigator.of(context).pushAndRemoveUntil(
                              //     MaterialPageRoute(
                              //         builder: (context) => CatTimeScreen(
                              //               catProID: catPros[index].id!,
                              //             )),
                              //     (Route<dynamic> route) => false);

                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => CatTimeScreen(
                                            catProID: catPros[index].id!,
                                          )));
                            },
                            child: Card(
                              child: Padding(
                                padding: const EdgeInsets.all(2.0),
                                child: ListTile(
                                    title: Text(catPros[index].name),
                                    subtitle: catPros[index].gender
                                        ? Text(
                                            "Gender: female\nSpecies: ${catPros[index].species}")
                                        : Text(
                                            "Gender: male\nSpecies: ${catPros[index].species}"),
                                    trailing: IconButton(
                                      icon: Icon(Icons.edit),
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    CatProForm(
                                                      catPro: catPros[index],
                                                    )));
                                      },
                                    )),
                              ),
                            ),
                          ),
                        );
                      }),
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
