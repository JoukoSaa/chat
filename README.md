# The English version of this guide was translated from Finnish by google.

Artificial intelligence has become a topic of conversation. The reason for that is mainly Chat GPT, which surprisingly knows how to use language, including Finnish. Things usually seem to be under control, but every once in a while it makes some really stupid mistakes in controlling the facts.

That program was created by feeding millions (or billions?) of documents into very powerful computers, and then the program was still taught.

The program reminded me of my own experiment that I did with Basic for the Sinclair Spectrum in the 80s: the program is given a number and a piece of text as parameters. The program randomly generates new text from the text, always taking into account as many preceding letters as given as a parameter. This program is a new implementation for it, free for the whole world to try. In my opinion, the most beautiful thing about the implementation is that the language is generated without calculating any statistical probabilities. As such, the source text is the only table!

The program offers a few options as the starting text. Depending on the source text, values ​​of the memory parameter between 2 and 4 will probably give the funniest results.

Shortcomings in the program:
- transferring your own text to the program is clumsy, and at least hard line breaks (i.e. paragraph divisions) disappear. Who gives an example of handling HTML 'textarea' in dart?
- if the output text contains a string of the length of the memory parameter only twice and sometimes close to it, then printing may eventually stutter at the ends of this string. Yes, this could be fixed, but the end result is sometimes amusing, and the idea of ​​the program is to be as simple as possible!
- support for non-Latin letters has not been tested, at a cursory glance it seems to work. The logic of the program (generate function) is in no way dependent on the character set, the question is only about displaying and storing the information as a character string.

