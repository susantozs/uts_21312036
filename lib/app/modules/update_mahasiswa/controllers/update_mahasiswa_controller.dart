import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UpdateMahasiswaController extends GetxController {
  late TextEditingController cNpm;
  late TextEditingController cNama;
  late TextEditingController cAlamat;
  late TextEditingController cPs;
  late TextEditingController cJk;

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<DocumentSnapshot<Object?>> getData(String id) async {
    DocumentReference docRef = firestore.collection("mahasiswa").doc(id);

    return docRef.get();
  }

  void updateProduct(String npm, String nama, String alamat, String ps,
      String jk, String id) async {
    DocumentReference mahasiswaById = firestore.collection("mahasiswa").doc(id);

    try {
      await mahasiswaById.update({
        "npm": npm,
        "nama": nama,
        "alamat": alamat,
        "ps": ps,
        "jk": jk,
      });

      Get.defaultDialog(
        title: "Berhasil",
        middleText: "Berhasil mengubah data mahasiswa.",
        onConfirm: () {
          cNpm.clear();
          cNama.clear();
          cAlamat.clear();
          cPs.clear();
          cJk.clear();
          Get.back();
          Get.back();
        },
        textConfirm: "OK",
      );
    } catch (e) {
      print(e);
      Get.defaultDialog(
        title: "Terjadi Kesalahan",
        middleText: "Gagal Menambahkan Mahasiswa.",
      );
    }
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
