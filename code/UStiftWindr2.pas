unit UStiftWindr2;

interface

Uses graphics,TeCanvas, Forms;

Type
 TStiftwindr2 = class(TObject)
 private
  w: Real;
  x, y: Integer;
  vRunter: Boolean;
  Ort: TCanvas3D;
 public
  Procedure BewegeBis(zx,zy: Real);
  Procedure DreheBis(a: Real);
  Procedure BewegeUm(l: Real);
  Procedure Hoch;
  Procedure Runter;
  Procedure Init(Bild: TCanvas3D);
  Procedure Pfeil(g: Real);
  Procedure Schreibe(x1, y1, d, a: Real; s: String);
 End;

implementation

Procedure TStiftwindr2.BewegeBis(zx,zy:Real);

Begin
x:= Round (zx);
y:= Round (zy);
Ort.MoveTo(x,y);
End;

Procedure TStiftwindr2.DreheBis(a:Real);
Begin
w:=a;
End;

Procedure TStiftwindr2.BewegeUm(l:Real);
Var x1, y1: Integer;
Begin
x1:= Round(l*sin(w / 180 * pi));
y1:= Round(l*cos(w / 180 * pi));
x:= x + x1;
y:= y - y1;
If vRunter
 Then Ort.LineTo(x, y)
 Else Ort.MoveTo(x, y);
End;

Procedure TStiftwindr2.Hoch;
Begin
vRunter:=false;
End;

Procedure TStiftwindr2.Runter;
Begin
vRunter:=True;
End;

Procedure TStiftwindr2.Init(Bild: TCanvas3D);
Begin
Ort:=Bild;
W:=0;
End;

Procedure TStiftwindr2.Pfeil(g: Real);
Var x1, y1: Integer;
Begin
x1:= x;
y1:= y;
DreheBis(w + 195);
Runter;
BewegeUm(g);
Hoch;
BewegeBis(x1, y1);
DreheBis(w - 30);
Runter;
BewegeUm(g);
Hoch;
BewegeBis(x1, y1);
End;

Procedure TStiftwindr2.Schreibe(x1, y1, d, a: Real; s: String);
Begin
If (0 < a) And (a < 179)
  Then
  Begin
  BewegeBis(x1, y1);
  BewegeUm(d - Ort.TextWidth(S));
  DreheBis(a - 90);
  BewegeUm(Ort.TextHeight(S) - 2);
  DreheBis(a);
  Ort.RotateLabel(x, y, s, (90 - Round(w)));
  End
  Else
  Begin
  BewegeBis(x1, y1);
  BewegeUm(d);
  DreheBis(a + 90);
  BewegeUm(Ort.TextHeight(S) - 2);
  DreheBis(a - 180);
  Ort.RotateLabel(x, y, s, (90 - Round(w)));
  End;
End;

end.