import 'package:absen_app/src/models/mata_kuliah.dart';
import 'package:absen_app/src/view/detail_pertemuan_view.dart';
import 'package:flutter/material.dart';

class ItemDetailsView extends StatelessWidget {
  final MataKuliah item;

  const ItemDetailsView({
    super.key,
    required this.item,
  });

  static const routeName = '/class_details';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
            appBar: AppBar(
              backgroundColor: const Color(0xFF0D47A1),
              titleSpacing: 5,
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${item.name}",
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    "${item.id}",
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ],
              ),
              bottom: const TabBar(tabs: [
                Tab(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.book),
                      SizedBox(width: 6),
                      Text('Content'),
                    ],
                  ),
                ),
                Tab(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.people),
                      SizedBox(width: 6),
                      Text('Colleges',
                          style: TextStyle(fontWeight: FontWeight.w600)),
                    ],
                  ),
                ),
              ]),
            ),
            body: TabBarView(
              children: [
                ListView.builder(
                  itemCount: item.konten.length,
                  itemBuilder: (BuildContext context, int index) {
                    final content = item.konten[index];

                    return ExpansionTile(
                      title: Text(
                        "Pertemuan ${index + 1}",
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      children: <Widget>[
                        // ListTile(
                        //   title: Text(content.judul),
                        //   subtitle: Text(content.deskripsi),
                        // ),

                        Container(
                          margin: EdgeInsets.all(10),
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.pushNamed(
                                context,
                                DetailPertemuanView.routeName,
                                arguments: item,
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              shadowColor: Colors.black,
                              padding: EdgeInsets.all(10),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  content.deskripsi,
                                  style: TextStyle(
                                      fontSize: 12, color: Colors.black),
                                ),
                                Icon(
                                  Icons.check_circle,
                                  color: Color(0xFFC1C1C1),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
                ListView.builder(
                  itemCount: item.daftarMahasiswa.length,
                  itemBuilder: (BuildContext context, int index) {
                    final college = item.daftarMahasiswa[index];

                    return ListTile(
                      title: Text(
                        college.nama,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text(college.nim),
                      leading: Icon(
                        college.jenisKelamin == "Male"
                            ? Icons.male
                            : Icons.female,
                      ),
                    );
                  },
                ),
              ],
            )),
      ),
    );
  }
}
