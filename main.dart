import 'dart:html';
import 'dart:math';

// Käännä komennolla
// C:\Tools\flutter\bin\dart compile js -o app.js main.dart
main() async {
  querySelector('#nappi').onClick.listen(tervehdi);
  querySelector('#pika').onClick.listen(luetiedosto);
}

virheteksti(aputeksti) {
  querySelector('#teksti').text = aputeksti;
  return;
}

luetiedosto(e) async {
  querySelector('#story').text = 'luetiedosto alkaa';

  var osoite = 'https://joukosaa.github.io/chat/maindart.txt';
  var sisalto = await HttpRequest.getString(osoite);

  querySelector('#story').text = sisalto;
  querySelector('#alkuteksti').text = '';
}

tervehdi(e) {
  querySelector('#teksti').text = '';
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
  var alkuteksti = elementti.value;

  //InputElement x = document.getElementById("story");
  //elementti = querySelector('#story');
  var story = querySelector('#story').text;

  if (story.length < 20) {
    if (alkuteksti.length >= 20) {
      querySelector('#story').text = alkuteksti;
      story = alkuteksti;
      alkuteksti = '';
      elementti = querySelector('#alkuteksti');
      elementti.value = alkuteksti;
    } else {
      virheteksti('Lähtöteksti liian lyhyt!');
      return;
    }
  }
  var storyPituus = story.length;
  story = '$story + ${story.substring(0, 20)}';

  // nyt se alkaa!
  var muistiPatka = story.substring(0, muisti);
  var tulosTeksti = muistiPatka;
  querySelector('#teksti').text = tulosTeksti;
  while (tulosTeksti.length < pituus) {
    var rng = Random();
    var hyppyStoryyn = rng.nextInt(storyPituus);
    if (muisti == 0) {
      tulosTeksti = '$tulosTeksti${story[hyppyStoryyn]}';
    } else {
      tulosTeksti =
          '$tulosTeksti arvotaan luku väliltä 0-$storyPituus, tulos $hyppyStoryyn ';
    }
    querySelector('#teksti').text = tulosTeksti;
  }
}
