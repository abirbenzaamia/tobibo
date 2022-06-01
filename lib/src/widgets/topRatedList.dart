import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tobibo/src/models/MedecinModel.dart';
import 'package:tobibo/src/services/medecin.dart';
import 'package:typicons_flutter/typicons_flutter.dart';

class TopRatedList extends StatefulWidget {
  @override
  _TopRatedListState createState() => _TopRatedListState();
}

class _TopRatedListState extends State<TopRatedList> {
  Future<List<MedecinModel>>? futureData;
  @override
  void initState() {
    futureData = fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: FutureBuilder<List<MedecinModel>>(
        future: futureData,
        builder: (context, snapshot) {
          if (!snapshot.hasData)
            return Center(
              child: CircularProgressIndicator(),
            );

          List<MedecinModel>? data = snapshot.data;

          return ListView.builder(
            scrollDirection: Axis.vertical,
            physics: ClampingScrollPhysics(),
            shrinkWrap: true,
            itemCount: 5,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.only(top: 3.0),
                child: Card(
                  color: Colors.blue[50],
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Container(
                    padding: EdgeInsets.only(left: 10, right: 10, top: 0),
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height / 9,
                    child: TextButton(
                      onPressed: () {
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (context) => DoctorProfile(
                        //       doctor: doctor['name'],
                        //     ),
                        //   ),
                        // );
                      },
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        //mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          CircleAvatar(
                            //backgroundImage: NetworkImage(data['image']),
                            //backgroundColor: Colors.blue,
                            radius: 25,
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                data![index].nom,
                                style: GoogleFonts.lato(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17,
                                  color: Colors.black87,
                                ),
                              ),
                              Text(
                                data![index].email,
                                style: GoogleFonts.lato(
                                    fontSize: 16, color: Colors.black54),
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: Container(
                              alignment: Alignment.centerRight,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Icon(
                                    Typicons.star_full_outline,
                                    size: 20,
                                    color: Colors.indigo[400],
                                  ),
                                  SizedBox(
                                    width: 3,
                                  ),
                                  Text(
                                    data![index].num_tel.toString(),
                                    style: GoogleFonts.lato(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                      color: Colors.indigo,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
