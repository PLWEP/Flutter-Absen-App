import 'package:absen_app/src/models/mata_kuliah.dart';
import 'package:flutter/material.dart';

class ItemList extends StatelessWidget {
  final MataKuliah item;
  final Function() onTap;
  const ItemList({
    super.key,
    required this.onTap,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTap(),
      child: Container(
        width: double.infinity,
        height: 146,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          boxShadow: const [
            BoxShadow(
              color: Colors.black38,
              blurRadius: 10,
              offset: Offset(5, 5),
            ),
          ],
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xFF0D47A1), Color(0xFFB6C6FF)],
          ),
        ),
        padding: const EdgeInsets.all(15),
        margin: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.id,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    // overflow: TextOverflow.ellipsis,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  item.name,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            Column(
              children: [
                Row(
                  children: [
                    Icon(Icons.person_pin, color: Colors.white, size: 16),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      item.dosen,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Icon(Icons.access_time, color: Colors.white, size: 16),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      item.jadwal,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            // Column(
            //   crossAxisAlignment: CrossAxisAlignment.start,
            //   children: [
            //     Text(
            //       "Jumlah SKS : ${item.sks}",
            //       style: const TextStyle(
            //         color: Colors.white,
            //         fontSize: 16,
            //       ),
            //     ),
            //     const SizedBox(height: 10),
            //     Text(
            //       "Jumlah Mahasiswa : ${item.jumlahMahasiswa}",
            //       style: const TextStyle(
            //         color: Colors.white,
            //         fontSize: 16,
            //         overflow: TextOverflow.ellipsis,
            //       ),
            //     ),
            //   ],
            // ),
          ],
        ),
      ),
    );
  }
}
