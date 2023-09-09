import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddMahasiswaController extends GetxController {
  late TextEditingController cNpm;
  late TextEditingController cNama;
  late TextEditingController cAlamat;
  late TextEditingController cPs;
  late TextEditingController cJk;

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  void addMahasiswa(
      String npm, String nama, String alamat, String ps, String jk) async {
    CollectionReference mahasiswa = firestore.collection("mahasiswa");

    try {
      await mahasiswa.add({
        "npm": npm,
        "nama": nama,
        "alamat": alamat,
        "ps": ps,
        "jk": jk,
      });
      Get.defaultDialog(
          title: "Berhasil",
          middleText: "Berhasil menyimpan data mahasiswa",
          onConfirm: () {
            cNpm.clear();
            cNama.clear();
            cAlamat.clear();
            cPs.clear();
            cJk.clear();
            Get.back();
            Get.back();
            textConfirm:
            "OK";
          });
    } catch (e) {}
  }

  @override
  void onInit() {
    // TODO: implement onInit
    cNpm = TextEditingController();
    cNama = TextEditingController();
    cAlamat = TextEditingController();
    cPs = TextEditingController();
    cJk = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    cNpm.dispose();
    cNama.dispose();
    cAlamat.dispose();
    cPs.dispose();
    cJk.dispose();
    super.onClose();
  }
}
