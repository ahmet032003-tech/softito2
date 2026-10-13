1. createstate()

2. mounted == true

3. initState()

4. didChangeDependencies() (widget değişimlerinde tetiklenir(Thema.of(context) bu adımda güvenli olarak çalıştırılır))

5. build(BuildContext context) (UI burda döndürür (ASLA İÇİNDE ASENKRON İŞLEMİ YAPILMAZ))

6. didUpdateWidget(oldWidget)(üst ebeveyn yeni bir parametre yolladığında çalışır)

7. deactivete() (ağaçtan geçiçi olarak kopma)

8. disponse() (kalıcı olarak kapatma (controller.disponse Stream.cancel) burda yapılır)

9 mounted == false 