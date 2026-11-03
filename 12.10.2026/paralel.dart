Future<void> fetchDashboardData() async {
  try{
    final result= await Future.wait([
      fetchUserProfile(),
      fetchAccountBalance(),
      fetchNotification(),
    ],eagerError: true);

     print("Tüm veriler geldi $result");
  } catch (e) {
    print("İsteklerden Biri başarısız oldu $e");
  }
}

//future:Tek bir kere veri çekileceği zaman kullanılır ya hata ya da değer dönüp bitirir
//stream:boru hattı şeklinde çalışır , zaman içinde 1 10 100 ya da sonsuz sayıda veri akılı sağlanabilir. borsa fşyatları GPS konum güncelleme, firebase canlı dinleme

import 'dart:async';

void main(){
    final controller=StreamController<int>();
    final subscription = controller.stream.listen(
        (data)=> print("yeni veri: $data"),
        onError: (err) => print("hata oluştu: $err"),
        onDone: () => print("Yayın Tamamlandı"),
  );

  controller.sink.add(10);
  controller.sink.add(20);
  controller.sink.add(30);

final broadcastStream=controller.:stream.asBroadcastStream();
broadcastStream.listen((d) => print("UI Ekranı: +d"));
broadcastStream.listen((d) => print("Analitik Servisi Ekranı: $d"));





  controller.close();

    
}