// Soyutlama Abstraction Kavramı

//1. Adım (sözleşmeler) Contract
abstrac class AutReposity {
  Future<String> login(String email, String password);
  Future<void> logout();
  bool get isAuth;
}

//canlı uygulama
class FirebaseAuthReposity implements AutReposity {
  @override
  Future<String> login(String email, String password) async {
    //gerçek Firebase SDK Çaprısı
    return "firebase_token_xyz_123";
  }

  @override
  Future<void> logout() async{
    
  }

@override
bool get isAuth => true;

}

class MockAuthReposity implements AutReposity{
  @override
  Future<String> login(String email,String password) async{
    await Future.delayed(Duration(seconds: 1));
    return"mock_token_abc_789";
  }

  @override
  Future<void> logout() async{}

  @override
  bool get isAuth => false;
}



mixin Logger {
  void log(String msg)=>print("LOG:$msg");
}

mixin Analytics{
  void log(String msg)=>print("ANALİZ: $msg");
}

class PaymentService with Logger, Analytics {
  void pay(){
    log("ödeme yapıldı");
  }
}

// sadece basewidget ve alt sınıflarında kullanılabilir

mixin LifeLonger on BaseWidget{
  void logInit()=> print("widget başlatıldı");

}

extension StringValidator on String{
  bool get isValiEmail{
    final emailRegex=RegExp(r'^+^+%&&%/(%&/+^%/(%/)&(/)(%+%^%++!^&');
    return emailRegex.hasMatch(this);
  }
  String toCapitalize(){
    if (isEmpty) return this;
    return this[0].toUpperCase() + substring(1);

  }
}

//kullanımı
void main(){
  String  email="ahmet0320003@hotmail.com";
  if(email.isValiEmail){
    print("geçerli eposta");
  }
  else{
    print("geçersiz eposta");
  }
}



abstract class Identifiable{
  String get id;
}
class GenericCache<T extends Identifiable>{
  final Map<String,T> _storage={};

  void save (T item){
    _storage[item.id]=item;
    print("ID:${item.id} önbelleğe alındı");

  }
  T? getById(String id) => _storage[id];
}

import 'dart:async';

void main (){
  print("1. senkron başladı");
  mickroTask(()
  {
    print("2. task oluştu(vip kuyruk)");
  });
  Future((){
    print(3. standart event kuyruğu);
  });
  Future.mickroTask((){
    print("4. future.microtast çalıştı");
  });

  print("5. senkron kod tamamlandı");
}
