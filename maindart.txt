import 'dart:html';

// Käännä komennolla
// C:\Tools\flutter\bin\dart compile js -o app.js main.dart
main() {
  querySelector('#nappi').onClick.listen(tervehdi);
  querySelector('#pika').onClick.listen(luetiedosto);
}

virheteksti(aputeksti) {
  querySelector('#teksti').text = aputeksti;
  return;
}

luetiedosto(e) async {
  print('luetiedosto alkaa');

  var osoite = 'https://joukosaa.github.io/kysely/';
  var sisalto = await HttpRequest.getString(osoite);

  String teksti = sisalto;
  querySelector('#teksti').text = teksti;
}

tervehdi(e) {
  InputElement elementti = querySelector('#muisti');
  int muisti = int.parse(elementti.value);
  if (muisti == null) {
    virheteksti('Muistin pituus ei ole numero!');
    return;
  }
  if (muisti > 10) {
    virheteksti('Muisti on yli 10, virhe!');
    return;
  }

  elementti = querySelector('#pituus');
  int pituus = int.parse(elementti.value);

  elementti = querySelector('#alkuteksti');
  var lahto = elementti.value;

  //InputElement x = document.getElementById("story");
  //elementti = querySelector('#story');
  querySelector('#story').text = lahto;

  if (lahto.length < 20) {
    virheteksti('Lähtöteksti liian lyhyt!');
    return;
  }

  var teksti = 'Hei $muisti ja $pituus, hauska tutustua $lahto !';
  querySelector('#teksti').text = teksti;
}
