unit Kurs00007;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ComCtrls;

type
  TProgramminfo = class(TForm)
    RichEdit1: TRichEdit;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Programminfo: TProgramminfo;

implementation

{$R *.DFM}

procedure TProgramminfo.FormCreate(Sender: TObject);
begin
With RichEdit1 do
     Begin
     Lines.Clear;
     SelAttributes.Style := [fsBold, fsUnderline];
     SelAttributes.Size:= 10;
     Lines.Add('Programm Kursberechnung');
     SelAttributes.Style := [];
     SelAttributes.Size:= 8;
     Lines.Add('');
     Lines.Add('Copyright � 6.3.2002 Roman Grothausmann, Version 4.02');
     Lines.Add('');
     Lines.Add('');
     Lines.Add('Dieses Programm berechnet den Kurswinkel vom Ursprungsort zu den'
              +' Orten, die in der Tabelle eingetragen sind. Der Kurswinkel ist'
              +' der Winkel, der die Himmelsrichtung angibt, in die man sich vom Urs'
              +'prungsort bewegen m�sste, um am Zielort anzukommen. Um einen '
              +'Ursprungsort festzulegen, doppelklicken Sie auf einen eingetragen'
              +'en Ortsnamen in der Tabelle. Falls Sie einen neuen Ort eintrage'
              +'n wollen, k�nnen Sie durch einmaliges Markieren der Zelle und '
              +'dann durch einen weiteren Mausklick oder durch Dr�cken der '
              +'Eingabetaste in den Eingabemodus wechseln. '
              +'Der Unterschied zum Doppelklick liegt in der gr��eren '
              +'Zeitspanne zwischen den beiden Klicks! Zum Beenden der Eingabe '
              +'die Eingabetaste dr�cken! Um eine Zeile zu l�schen, '
              +'klicken Sie mit der rechten Maustaste auf diese und w�hlen Sie '
              +'''Diese Zeile l�schen'', oder zum L�schen der letzten Zeile im '
              +'Men� ''Bearbeiten'' ''Letzte Zeile l�schen''. Unter ''Bearbeiten'' '
              +'k�nnen Sie auch eine neue Zeile hinzuf�gen, oder direkt nach dem '
              +'L�schen den Vorgang r�ckg�ngig machen. Zudem ist es m�glich, die '
              +'Tabelle neu durchzunummerieren, um eine eigene Reihenfolge der Zeilen '
              +'zu erstellen. Die Zeilen k�nnen untereinander vertauscht werden. '
              +'Die Spaltenbreite ist variierbar und durch ''Tabelle initialisieren'' '
              +'wieder auf die urspr�ngliche Einstellung r�ckstellbar. Die Option '
              +'''Suchen'' erm�glicht es, einen bestimmten Eintrag in der Tabelle '
              +'ausfindig zu machen. Dabei wird auf Gro�- und Kleinschreibung '
              +'geachtet! Das Doppelklicken auf den Ursprungsort in dem unteren '
              +'Kasten sucht automatisch den Ursprungsort in der Tabelle. Durch '
              +'einfaches Klicken auf einen Ort wird dieser zum aktuellen Ort. '
              +'Das f�hrt dazu, dass er beim Sortieren immer der oberste von den '
              +'sichtbaren Orten ist. Man kann auch durch Klicken der rechten Maustaste '
              +'eine Zeile zum Speicher hinzuf�gen und mit ''Bearbeiten'' ''Zeilen '
              +'einf�gen'' alle Zeilen aus dem Speicher am Ende der Tabelle einf�gen. '
              +'Mit ''Speicher l�schen'' kann man die Zeilen aus dem Speicher wieder '
              +'entfernen.');
     Lines.Add('');
     Lines.Add('In der ersten Spalte m�ssen die Namen der Orte eingegeben werden'
              +'. Die Spalte f�r die geographische Breite muss die Koordinaten f'
              +'�r die Breitengrade beinhalten, die Spalte f�r die geographische'
              +' L�nge ben�tigt die L�ngenkoordinaten. Die Koordinaten k�nnen in'
              +' Grad, Minuten und Sekunden angegeben werden ( 56� 12'' 34" N ) '
              +'oder nur in Grad, Minuten oder Sekunden ( 56� N/ 3372'' N / 2023'
              +'54" N). F�r die Angabe der Sekunden muss das Doppelstrichzeichen '
              +'verwendet werden (") nicht zwei Apostrophe ('''')! '
              +'Wenn die Himmelsrichtung nicht angegeben wird (N/S oder '
              +'O/W), dann wird f�r die Breite die Richtung Nord verwendet und '
              +'f�r die L�nge Ost. Man kann deshalb auch die Koordinaten negativ'
              +' angeben, man muss dann aber vor jede Zahl ein Minuszeichen setz'
              +'en (-56�-12''-34"). Die Buchstaben N, S, O, W m�ssen als Gro�buch'
              +'staben eingegeben werden, sonst werden sie nicht beachtet. Die '
              +'Spalten "Land" und "Besonderheit" haben f�r'
              +' die Berechnung keine Bedeutung.');
     Lines.Add('');
     Lines.Add('Um nach der Eingabe der Koordinaten die verschiedenen Kurswinkel'
              +' zu berechnen, muss man unter ''Kurs'' auf ''Kurswinkel berechnen'''
              +' klicken. Die ersten beiden neuen Spalten geben die Koordinaten '
              +'in reellen Zahlen wieder, die n�chste den Betrag der Differenz d'
              +'er L�ngen zum Ursprungsort, dann kommt die Distanz zwischen Ort'
              +' und Ursprungsort (in � und km) und dann folgt der Winkel, der i'
              +'n die Richtung der k�rzesten Entfernung zeigt (nur Werte von 0�'
              +'- 180�) und zuletzt der Winkel der Kursgleiche.');
     Lines.Add('');
     Lines.Add('Die Tabelle kann man nun unter ''Datei'' ausdrucken oder speichern. '
              +'Die Druckvorschau hat noch eine eigene Hilfe. '
              +'Au�erdem ist es m�glich, eine neue Tabelle zu erzeugen oder eine schon '
              +'bestehende zu �ffnen. Die Tabellen lassen sich entweder als Kursdatei '
              +'(*.krs) mit allen Informationen oder als CSV-Datei (*.csv) speichern. '
              +'Die CSV-Datei l�sst sich mit der fr�heren BDE-Version �ffnen oder mit '
              +'MS Excel. Beide Dateiformate sind reine Textdateien um BDE-Probeleme '
              +'zu vermeiden. Durch Klicken auf einen Spa'
              +'ltentitel kann man die gesamte Tabelle nach dieser Spalte sortie'
              +'ren lassen (auch die Nummern). Wenn man ein weiteres Mal auf den selben Titel klick'
              +'t, wird die Sortierung umgekehrt.');
     Lines.Add('');
     Lines.Add('Will man eine Windrose mit Hilfe der Kurswinkel erstellen'
              +', so kann man dies mit ''Kurs'' ''Windrose erstellen''. Die'
              +'se Windrose kann man ausschnittsweise vergr��ern und auch ausdru'
              +'cken. Im Windrosenfenster gibt es noch eine Zoominfo. Falls einige Orte zu eng '
              +'bei einander liegen, kann man sie in der Tabelle durch die Optio'
              +'n ''Bearbeiten'' ''Filtern'' herausfiltern oder per Hand ausw�hl'
              +'en, indem man in die letzte Spalte des entsprechenden Ortes klic'
              +'kt, in der der Haken ist. Wenn dann das Windrosenfenster aktivie'
              +'rt wird, werden nur die Orte gezeichnet, die einen Haken haben. '
              +'Der Ursprungsort bekommt automatisch keinen Haken! '
              +'Um alle Orte mit einem Haken zu versehen, muss man nur auf den '
              +'Titelhaken klicken. Zur graphischen Darstellung der Berechnung'
              +'en kann man auf das Bild im Hauptfenster klicken.');
     SelStart:= 500;
     End;
end;

end.
 