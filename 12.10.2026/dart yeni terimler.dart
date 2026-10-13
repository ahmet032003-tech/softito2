1. createstate()

2. mounted == true

3. initState()

4. didChangeDependencies() (widget değişimlerinde tetiklenir(Thema.of(context) bu adımda güvenli olarak çalıştırılır))

5. build(BuildContext context) (UI burda döndürür (ASLA İÇİNDE ASENKRON İŞLEMİ YAPILMAZ))

6. didUpdateWidget(oldWidget)(üst ebeveyn yeni bir parametre yolladığında çalışır)

7. deactivete() (ağaçtan geçiçi olarak kopma)

8. disponse() (kalıcı olarak kapatma (controller.disponse Stream.cancel) burda yapılır)

9 mounted == false 




1. widget tree
*iskelet
*immutable (değişmez)
*çok ucuz (hafif)
*saniyede 60-120 kez çöpe atılıp yeniden üretilir
*ekranda çizim yapmaz
*sadece şablon sunar


2. element Tree
*yönetici & yaşayan omurga
*mutable (durumu ve referansı hafızada canlı tutar değişir)
*widget ile renderobject arasındaki koordinatörüdür (organizasyonu sunar)

//canUpdate

static bool canUpdate(Widget oldWidget,Widget newWidget){
    return oldWidget.runtimeType=newWidget.runtimeType && oldWidget.
    key==newWidget.key;"
}


stat yaşam döngüsü

*statefulwidget. immutable(olarak değişmez) her rebuild de yeniden oluşturulur
*state mutable (durumu saklar) rebuild sırasında çöpe atılmaz element tarafında devam eder 
eğer iki birleik olsaydı her rebuild esnasında kullanıcı girdiler yayaçlar controllerlar vb. sıfırlanırdı