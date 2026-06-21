import 'package:flutter/material.dart';
import '../database/db_helper.dart';
import '../utils/app_theme.dart';
import 'tambah_tanaman_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Map<String, dynamic>> tanaman = [];

  @override
  void initState() {
    super.initState();
    loadTanaman();
  }

  Future<void> loadTanaman() async {
    final data = await DBHelper.getTanaman();

    setState(() {
      tanaman = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.primary,
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
        onPressed: () async {
          await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) =>
                  const TambahTanamanScreen(),
            ),
          );

          loadTanaman();
        },
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),

          child: Column(
            crossAxisAlignment:
                CrossAxisAlignment.start,

            children: [
              const SizedBox(height: 10),

              Row(
                children: [
                  Container(
                    width: 55,
                    height: 55,
                    decoration: BoxDecoration(
                      color: AppColors.secondary,
                      borderRadius:
                          BorderRadius.circular(15),
                    ),
                    child: const Icon(
                      Icons.person,
                      color: Colors.white,
                    ),
                  ),

                  const SizedBox(width: 15),

                  const Expanded(
                    child: Column(
                      crossAxisAlignment:
                          CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Halo, Farm 👋",
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight:
                                FontWeight.bold,
                          ),
                        ),
                        Text(
                          "Rawat tanamanmu hari ini",
                          style: TextStyle(
                            color:
                                AppColors.textSecondary,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 25),

              Container(
                width: double.infinity,
                padding:
                    const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius:
                      BorderRadius.circular(25),
                ),

                child: Column(
                  crossAxisAlignment:
                      CrossAxisAlignment.start,

                  children: [
                    const Text(
                      "Statistik Tanaman",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight:
                            FontWeight.w600,
                      ),
                    ),

                    const SizedBox(height: 20),

                    Row(
                      mainAxisAlignment:
                          MainAxisAlignment
                              .spaceBetween,

                      children: [
                        Column(
                          children: [
                            Text(
                              tanaman.length
                                  .toString(),
                              style:
                                  const TextStyle(
                                color:
                                    Colors.white,
                                fontSize: 30,
                                fontWeight:
                                    FontWeight
                                        .bold,
                              ),
                            ),
                            const Text(
                              "Tanaman",
                              style:
                                  TextStyle(
                                color:
                                    Colors.white,
                              ),
                            ),
                          ],
                        ),

                        Column(
                          children: [
                            Text(
                              tanaman.length
                                  .toString(),
                              style:
                                  const TextStyle(
                                color:
                                    Colors.white,
                                fontSize: 30,
                                fontWeight:
                                    FontWeight
                                        .bold,
                              ),
                            ),
                            const Text(
                              "Data Tersimpan",
                              style:
                                  TextStyle(
                                color:
                                    Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 25),

              const Text(
                "Tanaman Saya",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight:
                      FontWeight.bold,
                ),
              ),

              const SizedBox(height: 15),

              tanaman.isEmpty
                  ? const Center(
                      child: Padding(
                        padding:
                            EdgeInsets.all(30),
                        child: Text(
                          "Belum ada tanaman",
                        ),
                      ),
                    )
                  : ListView.builder(
                      shrinkWrap: true,
                      physics:
                          const NeverScrollableScrollPhysics(),
                      itemCount:
                          tanaman.length,
                      itemBuilder:
                          (context, index) {

                        final item =
                            tanaman[index];

                        return Card(
                          margin:
                              const EdgeInsets.only(
                            bottom: 15,
                          ),

                          child: ListTile(
                            contentPadding:
                                const EdgeInsets.all(
                                    12),

                            leading:
                                CircleAvatar(
                              radius: 28,
                              backgroundColor:
                                  AppColors
                                      .secondary,
                              child:
                                  const Icon(
                                Icons.eco,
                                color:
                                    Colors.white,
                              ),
                            ),

                            title: Text(
                              item["nama"] ?? "",
                              style:
                                  const TextStyle(
                                fontWeight:
                                    FontWeight
                                        .bold,
                              ),
                            ),

                            subtitle: Column(
                              crossAxisAlignment:
                                  CrossAxisAlignment
                                      .start,
                              children: [
                                Text(
                                  item["kategori"] ??
                                      "",
                                ),

                                const SizedBox(
                                    height: 5),

                                Text(
                                  "💧 Siram : ${item["jadwal_siram"] ?? "-"}",
                                ),

                                Text(
                                  "🌱 Pupuk : ${item["jadwal_pupuk"] ?? "-"}",
                                ),

                                if ((item["catatan"] ??
                                        "")
                                    .toString()
                                    .isNotEmpty)
                                  Text(
                                    "📝 ${item["catatan"]}",
                                  ),
                              ],
                            ),

                            trailing: Row(
                              mainAxisSize:
                                  MainAxisSize.min,
                              children: [

                                IconButton(
                                  icon: const Icon(
                                    Icons.edit,
                                    color:
                                        Colors.orange,
                                  ),
                                  onPressed:
                                      () async {

                                    await Navigator
                                        .push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) =>
                                            TambahTanamanScreen(
                                          tanaman:
                                              item,
                                        ),
                                      ),
                                    );

                                    loadTanaman();
                                  },
                                ),

                                IconButton(
                                  icon: const Icon(
                                    Icons.delete,
                                    color:
                                        Colors.red,
                                  ),
                                  onPressed:
                                      () async {

                                    await DBHelper
                                        .deleteTanaman(
                                      item["id"],
                                    );

                                    loadTanaman();
                                  },
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
            ],
          ),
        ),
      ),
    );
  }
}