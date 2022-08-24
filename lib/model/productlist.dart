class Products {
  List<Cat1>? cat1;
  List<Cat2>? cat2;
  List<Cat3>? cat3;
  List<Cat4>? cat4;
  List<Cat5>? cat5;
  List<Cat6>? cat6;

  Products({this.cat1, this.cat2, this.cat3, this.cat4, this.cat5, this.cat6});

  Products.fromJson(Map<String, dynamic> json) {
    if (json['cat1'] != null) {
      cat1 = <Cat1>[];
      json['cat1'].forEach((v) {
        cat1!.add(new Cat1.fromJson(v));
      });
    }
    if (json['cat2'] != null) {
      cat2 = <Cat2>[];
      json['cat2'].forEach((v) {
        cat2!.add(new Cat2.fromJson(v));
      });
    }
    if (json['cat3'] != null) {
      cat3 = <Cat3>[];
      json['cat3'].forEach((v) {
        cat3!.add(new Cat3.fromJson(v));
      });
    }
    if (json['cat4'] != null) {
      cat4 = <Cat4>[];
      json['cat4'].forEach((v) {
        cat4!.add(new Cat4.fromJson(v));
      });
    }
    if (json['cat5'] != null) {
      cat5 = <Cat5>[];
      json['cat5'].forEach((v) {
        cat5!.add(new Cat5.fromJson(v));
      });
    }
    if (json['cat6'] != null) {
      cat6 = <Cat6>[];
      json['cat6'].forEach((v) {
        cat6!.add(new Cat6.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.cat1 != null) {
      data['cat1'] = this.cat1!.map((v) => v.toJson()).toList();
    }
    if (this.cat2 != null) {
      data['cat2'] = this.cat2!.map((v) => v.toJson()).toList();
    }
    if (this.cat3 != null) {
      data['cat3'] = this.cat3!.map((v) => v.toJson()).toList();
    }
    if (this.cat4 != null) {
      data['cat4'] = this.cat4!.map((v) => v.toJson()).toList();
    }
    if (this.cat5 != null) {
      data['cat5'] = this.cat5!.map((v) => v.toJson()).toList();
    }
    if (this.cat6 != null) {
      data['cat6'] = this.cat6!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Cat1 {
  String? name;
  int? price;
  bool? instock;

  Cat1({this.name, this.price, this.instock});

  Cat1.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    price = json['price'];
    instock = json['instock'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['price'] = this.price;
    data['instock'] = this.instock;
    return data;
  }
}
class Cat2 {
  String? name;
  int? price;
  bool? instock;

  Cat2({this.name, this.price, this.instock});

  Cat2.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    price = json['price'];
    instock = json['instock'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['price'] = this.price;
    data['instock'] = this.instock;
    return data;
  }
}
class Cat3 {
  String? name;
  int? price;
  bool? instock;

  Cat3({this.name, this.price, this.instock});

  Cat3.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    price = json['price'];
    instock = json['instock'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['price'] = this.price;
    data['instock'] = this.instock;
    return data;
  }
}
class Cat4 {
  String? name;
  int? price;
  bool? instock;

  Cat4({this.name, this.price, this.instock});

  Cat4.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    price = json['price'];
    instock = json['instock'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['price'] = this.price;
    data['instock'] = this.instock;
    return data;
  }
}
class Cat5 {
  String? name;
  int? price;
  bool? instock;

  Cat5({this.name, this.price, this.instock});

  Cat5.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    price = json['price'];
    instock = json['instock'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['price'] = this.price;
    data['instock'] = this.instock;
    return data;
  }
}
class Cat6 {
  String? name;
  int? price;
  bool? instock;

  Cat6({this.name, this.price, this.instock});

  Cat6.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    price = json['price'];
    instock = json['instock'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['price'] = this.price;
    data['instock'] = this.instock;
    return data;
  }
}