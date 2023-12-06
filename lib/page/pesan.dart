// ignore_for_file: sort_child_properties_last, prefer_const_constructors, prefer_interpolation_to_compose_strings, unnecessary_null_comparison

import 'package:carbon_icons/carbon_icons.dart';
import 'package:dikantin/api/service_Api.dart';
import 'package:dikantin/bottom_navigation.dart';
import 'package:dikantin/model/Penjualan_mode.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:dikantin/page/beranda.dart';

class Pesan extends StatefulWidget {
  const Pesan({super.key});

  @override
  State<Pesan> createState() => _PesanState();
}

class _PesanState extends State<Pesan> {
  ServiceApiPenjualan servicepenjualan = ServiceApiPenjualan();
  late Future<List<ModelPenjualan>> listdata;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    listdata = servicepenjualan.getPenjualan();
  }

  Future<void> _refreshpesanan() async {
    setState(() {
      listdata = servicepenjualan.getPenjualan();
    });
  }

  Widget build(BuildContext context) {
    initializeDateFormatting("id_ID");
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: _refreshpesanan,
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: SingleChildScrollView(
            child: Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: 300,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/Group_14.png"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  top: 30,
                  left: MediaQuery.of(context).size.width / 500,
                  right: MediaQuery.of(context).size.width / 500,
                  child: Container(
                    width: 400,
                    height: 50,
                    child: Center(
                      child: Text("PESANAN",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.white)),
                    ),
                  ),
                ),
                Positioned(
                  top: 60,
                  left: 100,
                  child: Container(
                    width: 400,
                    height: 50,
                    child: Center(
                      child: Text(
                        DateFormat.yMMMMd("id_ID").format(DateTime.now()),
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 100),
                  // height: MediaQuery.of(context).size.height / 1.3,
                  // width: double.infinity,
                  decoration: BoxDecoration(
                    color: Color(0xffedf3f6),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25),
                      topRight: Radius.circular(25),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Color(0x3f000000),
                        offset: Offset(4, 4),
                        blurRadius: 5,
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      Container(
                        alignment: Alignment.centerLeft,
                        padding: EdgeInsets.only(top: 20, left: 20),
                        child: Text(
                          "Tekan Tombol Selesai Jika Pesanan Telah Di Antarkan !",
                          style: TextStyle(
                            color: Color(0xff514D4E),
                            fontSize: 14.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 10, right: 10, left: 10),
                        child: Column(
                          children: [
                            SizedBox(
                              height: MediaQuery.of(context).size.height / 1.35,
                              child: FutureBuilder<List<ModelPenjualan>>(
                                future: listdata,
                                builder: (context, snapshot) {
                                  if (snapshot.hasData) {
                                    List<ModelPenjualan>? isipenjualan =
                                        snapshot.data;
                                    return Container(
                                      child: ListView.builder(
                                        shrinkWrap: true,
                                        itemCount: isipenjualan?.length,
                                        itemBuilder: (context, index) {
                                          return Column(
                                            children: [
                                              SizedBox(
                                                height: 5,
                                              ),
                                              Container(
                                                  height: 80,
                                                  width: double.infinity,
                                                  decoration: BoxDecoration(
                                                    border: Border.all(
                                                        color: Colors.grey),
                                                    boxShadow: [
                                                      BoxShadow(
                                                        color:
                                                            Color(0x3f000000),
                                                        offset: Offset(
                                                          9,
                                                          9,
                                                        ),
                                                        blurRadius: 5,
                                                      ),
                                                    ],
                                                    color: Color.fromARGB(
                                                        255, 255, 255, 255),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20),
                                                  ),
                                                  child: Row(
                                                    children: [
                                                      Container(
                                                        height: 50,
                                                        width: 50,
                                                        padding:
                                                            EdgeInsets.only(
                                                                left: 10,
                                                                right: 2),
                                                        child: Image.network(
                                                          "http://10.10.0.61/public/storage/" +
                                                              isipenjualan![
                                                                      index]
                                                                  .foto
                                                                  .toString(),
                                                          fit: BoxFit.contain,
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        width: 5,
                                                      ),
                                                      Expanded(
                                                        child: Text(
                                                          isipenjualan![index]
                                                              .pesanan
                                                              .toString(),
                                                        ),
                                                        flex: 2,
                                                      ),
                                                      Expanded(
                                                        child: Text(
                                                          "x " +
                                                              isipenjualan![
                                                                      index]
                                                                  .jumlah
                                                                  .toString(),
                                                        ),
                                                        flex: 1,
                                                      ),
                                                      isipenjualan[index]
                                                                  .noMeja
                                                                  .toString() ==
                                                              "0"
                                                          ? Expanded(
                                                              child: Text(
                                                                "Pesanan Online",
                                                                style: TextStyle(
                                                                    color: Color(
                                                                        0xff514d4e),
                                                                    fontSize:
                                                                        11,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold),
                                                              ),
                                                              flex: 1,
                                                            )
                                                          : Expanded(
                                                              child: Text(
                                                                "Meja " +
                                                                    isipenjualan![
                                                                            index]
                                                                        .noMeja
                                                                        .toString(),
                                                                style: TextStyle(
                                                                    color: Color(
                                                                        0xff514d4e),
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold),
                                                              ),
                                                              flex: 1,
                                                            ),
                                                      isipenjualan[index]
                                                                  .status_detail ==
                                                              null
                                                          ? ElevatedButton(
                                                              style:
                                                                  ElevatedButton
                                                                      .styleFrom(
                                                                backgroundColor:
                                                                    Color.fromARGB(
                                                                        255,
                                                                        154,
                                                                        154,
                                                                        154),
                                                              ),
                                                              onPressed: () {},
                                                              child: const Text(
                                                                  "Memasak"),
                                                            )
                                                          : isipenjualan[index]
                                                                      .status_detail ==
                                                                  "menunggu"
                                                              ? ElevatedButton(
                                                                  style: ElevatedButton
                                                                      .styleFrom(
                                                                    backgroundColor:
                                                                        Color.fromARGB(
                                                                            255,
                                                                            231,
                                                                            208,
                                                                            1),
                                                                  ),
                                                                  onPressed:
                                                                      () {
                                                                    showDialog(
                                                                      context:
                                                                          context,
                                                                      builder:
                                                                          (context) {
                                                                        return AlertDialog(
                                                                          content:
                                                                              Image.asset(
                                                                            "assets/Logout.png",
                                                                            width:
                                                                                150.0,
                                                                            height:
                                                                                150.0,
                                                                            fit:
                                                                                BoxFit.fitHeight,
                                                                          ),
                                                                          actions: <Widget>[
                                                                            Center(
                                                                              child: Text(
                                                                                "Prose Pesanan ?",
                                                                                style: TextStyle(
                                                                                  color: Color(0xff3CA2D9),
                                                                                  fontWeight: FontWeight.w700,
                                                                                  fontSize: 18.0,
                                                                                ),
                                                                              ),
                                                                            ),
                                                                            SizedBox(
                                                                              height: 20,
                                                                            ),
                                                                            Row(
                                                                              mainAxisAlignment: MainAxisAlignment.center,
                                                                              children: [
                                                                                Expanded(
                                                                                  child: ElevatedButton(
                                                                                    child: Text('Ya'),
                                                                                    onPressed: () async {
                                                                                      final updatePenjualanService = UpdatePenjualanService();
                                                                                      await updatePenjualanService.updateStatusPenjualan(isipenjualan[index].idDetail.toString(), "1", isipenjualan[index].kantin.toString(), isipenjualan[index].idMenu.toString());
                                                                                      _refreshpesanan();
                                                                                      Navigator.pop(context);
                                                                                    },
                                                                                    style: ElevatedButton.styleFrom(
                                                                                      shape: RoundedRectangleBorder(
                                                                                        borderRadius: BorderRadius.circular(10.0),
                                                                                      ),
                                                                                      backgroundColor: Colors.green,
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                                SizedBox(width: 8),
                                                                                Expanded(
                                                                                  child: ElevatedButton(
                                                                                    child: Text('Tidak'),
                                                                                    onPressed: () {
                                                                                      Navigator.pop(context);
                                                                                    },
                                                                                    style: ElevatedButton.styleFrom(
                                                                                      shape: RoundedRectangleBorder(
                                                                                        borderRadius: BorderRadius.circular(10.0),
                                                                                      ),
                                                                                      backgroundColor: Colors.red,
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ],
                                                                        );
                                                                      },
                                                                    );
                                                                  },
                                                                  child: const Text(
                                                                      "Memasak"),
                                                                )
                                                              : isipenjualan[index]
                                                                          .status_detail ==
                                                                      "selesai"
                                                                  ? ElevatedButton(
                                                                      style: ElevatedButton
                                                                          .styleFrom(
                                                                        backgroundColor:
                                                                            Colors.green,
                                                                      ),
                                                                      onPressed:
                                                                          () {},
                                                                      child: const Text(
                                                                          "Pengiriman"),
                                                                    )
                                                                  : ElevatedButton(
                                                                      style: ElevatedButton
                                                                          .styleFrom(
                                                                        backgroundColor:
                                                                            Colors.green,
                                                                      ),
                                                                      onPressed:
                                                                          () {
                                                                        showDialog(
                                                                          context:
                                                                              context,
                                                                          builder:
                                                                              (context) {
                                                                            return AlertDialog(
                                                                              content: Image.asset(
                                                                                "assets/Logout.png",
                                                                                width: 150.0,
                                                                                height: 150.0,
                                                                                fit: BoxFit.fitHeight,
                                                                              ),
                                                                              actions: <Widget>[
                                                                                Center(
                                                                                  child: Text(
                                                                                    "Pesanan Selesai ?",
                                                                                    style: TextStyle(
                                                                                      color: Color(0xff3CA2D9),
                                                                                      fontWeight: FontWeight.w700,
                                                                                      fontSize: 18.0,
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                                SizedBox(
                                                                                  height: 20,
                                                                                ),
                                                                                Row(
                                                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                                                  children: [
                                                                                    Expanded(
                                                                                      child: ElevatedButton(
                                                                                        child: Text('Ya'),
                                                                                        onPressed: () async {
                                                                                          final updatePenjualanService = UpdatePenjualanService();
                                                                                          await updatePenjualanService.updateStatusPenjualan(isipenjualan[index].idDetail.toString(), "2", isipenjualan[index].kantin.toString(), isipenjualan[index].idMenu.toString());
                                                                                          _refreshpesanan();
                                                                                          Navigator.pop(context);
                                                                                        },
                                                                                        style: ElevatedButton.styleFrom(
                                                                                          shape: RoundedRectangleBorder(
                                                                                            borderRadius: BorderRadius.circular(10.0),
                                                                                          ),
                                                                                          backgroundColor: Colors.green,
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                    SizedBox(width: 8),
                                                                                    Expanded(
                                                                                      child: ElevatedButton(
                                                                                        child: Text('Tidak'),
                                                                                        onPressed: () {
                                                                                          Navigator.pop(context);
                                                                                        },
                                                                                        style: ElevatedButton.styleFrom(
                                                                                          shape: RoundedRectangleBorder(
                                                                                            borderRadius: BorderRadius.circular(10.0),
                                                                                          ),
                                                                                          backgroundColor: Colors.red,
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              ],
                                                                            );
                                                                          },
                                                                        );
                                                                      },
                                                                      child: const Text(
                                                                          "Selesai"),
                                                                    ),
                                                      SizedBox(
                                                        width: 10,
                                                      )
                                                    ],
                                                  )),
                                            ],
                                          );
                                        },
                                      ),
                                    );
                                  } else if (snapshot.hasError) {
                                    print("$snapshot.data");
                                    return Text("$snapshot.data");
                                  }
                                  return Center(
                                    child: CircularProgressIndicator(
                                      color: Colors.blue,
                                    ),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
