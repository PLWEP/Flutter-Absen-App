import 'package:flutter/material.dart';

class DetailPertemuanView extends StatefulWidget {
  DetailPertemuanView({
    super.key,
  });

  static const routeName = '/detail_pertemuan';

  @override
  _DetailPertemuanViewState createState() => _DetailPertemuanViewState();
}

class _DetailPertemuanViewState extends State<DetailPertemuanView> {
  final items = ['Hadir', 'Izin'];

  String? value;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        backgroundColor: Color.fromRGBO(13, 71, 161, 1),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(),
            ),
            Text(
              'Pertemuan 1',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              'Kontrak kuliah',
              style: TextStyle(
                fontSize: 12,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            padding: EdgeInsets.only(right: 20),
            iconSize: 30,
            icon: const Icon(
              Icons.bookmark_border,
              color: Colors.white,
            ),
            onPressed: () {},
          ),
        ],
        leading: IconButton(
          padding: EdgeInsets.only(left: 20),
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        margin: EdgeInsets.only(top: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Materi Pembelajaran',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              alignment: Alignment.center,
              height: 50,
              decoration: BoxDecoration(
                //warna boder
                border: Border.all(
                  color: Colors.black,
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 10),
                  ),
                  Icon(Icons.download),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Kontrak Kuliah.pdf',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              //dropdown hadir/izin
              margin: EdgeInsets.only(top: 40),
              child: Column(
                children: [
                  Text(
                    'Kehadiran',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 12),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: Colors.black,
                        width: 2,
                      ),
                    ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        isExpanded: true,
                        value: value,
                        iconEnabledColor: Colors.black,
                        hint: Text('Pilih Kehadiran'),
                        icon: Icon(Icons.arrow_drop_down_outlined),
                        iconSize: 30,
                        onChanged: (value) =>
                            setState(() => this.value = value),
                        items: items.map(buildMenuItem).toList(),
                      ),
                    ),
                  ),
                  Container(
                    //submit button,
                    margin: EdgeInsets.only(top: 40),
                    child: Column(
                      children: [
                        Container(
                          width: double.infinity,
                          height: 50,
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color.fromRGBO(13, 71, 161, 1),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              shadowColor: Colors.black,
                              padding: EdgeInsets.all(10),
                            ),
                            child: Text(
                              'Submit',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  DropdownMenuItem<String> buildMenuItem(String item) => DropdownMenuItem(
        value: item,
        child: Text(
          item,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      );
}
