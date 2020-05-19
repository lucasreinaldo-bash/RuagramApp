import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ruagramapp/datas/product_data.dart';

class CartProduct {
  String cid;
  String categoria;
  String pid;
  int quantidade;
  String variacao;
  String data;

  ProductData productData;

  CartProduct();
  CartProduct.fromDocument(DocumentSnapshot document) {
    cid = document.documentID;
    data = document.data["data"];
    categoria = document.data["categoria"];
    pid = document.data["pid"];
    quantidade = document.data["quantidade"];
    variacao = document.data["variacao"];
  }

  Map<String, dynamic> toMap() {
    return {
      "categoria": categoria,
      "pid": pid,
      "data": data,
      "quantidade": quantidade,
      "variacao": variacao,
      "product": productData.toResumedMap(),
    };
  }
}
