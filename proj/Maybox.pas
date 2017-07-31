unit MayBox;
{$N+}
{.$DEFINE OLDDELPHI}
interface

uses
  MathBox, SysUtils, Winprocs, WinTypes, Windows, Messages, Graphics, Controls, Forms, Dialogs,
  StdCtrls, DB, DBTables;

const
  CR = #13#10;

type
  Str12 = string[12];
  DirStr = string[67];
  PathStr = string[79];
  NameStr = string[8];
  ExtStr = string[4];

function Address2Str(Addr : Pointer) : string;
function AddBackSlash(S: string): string;
function CleanString(S: string): string;
function GetFirstWord(S: string): string;
function GetFirstToken(S: string; Token: Char): string;
function GetHexWord(w: Word): string;
function GetLastToken(S: string; Token: Char): string;
{$ifdef OLDDELPHI}
function GetLogicalAddr(A: Pointer): Pointer;
{$endif}
function GetTodayName(Pre, Ext: string): string;
function GetTodaysDate: string;
function GetTimeString: string;
function GetTimeFormat: string;
function IsNumber(Ch: Char): Boolean;
function LeftSet(src: string; Width:Integer; var Trunc: Boolean): String;
function ReplaceChars(S: string; OldCh, NewCh: Char): string;
function RightCharSet(Src: string; Width: Integer;
                      Ch: Char; var Trunc: Boolean): string;
function FirstWord(var S : String) : String;
procedure NXYZWord(var S,one,two,three,foure : String);
procedure NXYWord(var S,one,two,three : String);
procedure Points(var S,A,B : String);
procedure DirectionAngl(var X1,Y1,X2,Y2 : Variant; A : Real);
function GmToDegr(var S : String) : Real;
function SecondWord(var S : String) : String;
function TherdWord(var S : String) : String;
function ReplaceString(NewStr, ReplaceStr, Data: string): string;
function ReverseStr(S: string): string;
function Shorten(S: string; Cut: Integer): string;
procedure SplitDirName(Path : PathStr; var Dir: DirStr; var WName: Str12);
function StripBlanks(S: string): string;
function StripEndChars(S: string; Ch: Char): string;
function StripFirstWord(S : string) : string;
function StripFirstToken(S: string; Ch: Char): string;
function StripFrontChars(S: string; Ch: Char): string;
function StripFromFront(S: string; Len: Integer): string;
function StripLastToken(S: string; Token: Char): string;
{$ifdef OldDelphi}
procedure SetLength(var S: string; i: Integer);
{$endif}

implementation
uses
  Classes;

{$ifdef OldDelphi}
procedure SetLength(var S: string; i: Integer);
begin
  S[0] := Chr(i);
end;
{$endif}

function Address2Str(Addr: Pointer): string;
begin
  Result := Format('%p', [Addr]);
end;

function AddBackSlash(S: string): string;
var
 Temp: string;
begin
  Temp := S;
  if S[Length(Temp)] <> '\' then
    Temp := Temp + '\';
  AddBackSlash := Temp;
end;

{----------------------------------------------------
       Name: CleanString function
Declaration: CleanString(S: String): string;
       Unit: StrBox
       Code: S
       Date: 05/05/94
Description: Erase blanks from end and beginning of
             a string
-----------------------------------------------------}
function CleanString(S: string): string;
var
  Temp: String;
begin
  Temp := '';
  if Length(S) <> 0 then begin
    Temp := StripFrontChars(S, #32);
    Temp := StripBlanks(Temp);
  end;
  CleanString := Temp;
end;

{----------------------------------------------------
       Name: GetFirstWord function
Declaration: GetFirstWord(var S: string): string;
       Unit: StrBox
       Code: S
       Date: 05/02/94
Description: Get the first word from a string
-----------------------------------------------------}
function GetFirstWord(S : string) : string;
  Var
    i : Integer;
    S1: String;
begin
  i := 1;
  while (S[i] <> ' ') and (i < Length(S)) do begin
     S1[i] := S[i];
     Inc(i);
  end;
  Dec(i);
  SetLength(S1, i);
  GetFirstWord := S1;
end;

function GetHexWord(w: Word): string;
const
  HexChars: array [0..$F] of Char =  '0123456789ABCDEF';
var
  Addr: string;
begin
  Addr[1] := hexChars[Hi(w) shr 4];
  Addr[2] := hexChars[Hi(w) and $F];
  Addr[3] := hexChars[Lo(w) shr 4];
  Addr[4] := hexChars[Lo(w) and $F];
  SetLength(Addr, 4);
  GetHexWord := addr;
end;

function GetFirstToken(S: string; Token: Char): string;
var
  Temp: string;
  Index: INteger;
begin
  Index := Pos(Token, S);
  if Index < 1 then begin
    GetFirstToken := '';
    Exit;
  end;
  Dec(Index);
  SetLength(Temp, Index);
  Move(S[1], Temp[1], Index);
  GetFirstToken := Temp;
end;

{ Get the last part of a string, from a token onward.
  Given "Sam.Txt", and "." as a token, this returns "Txt" }
function GetLastToken(S: string; Token: Char): string;
var
  Temp: string;
  Index: INteger;
begin
  S := ReverseStr(S);
  Index := Pos(Token, S);
  if Index < 1 then begin
    GetLastToken := '';
    Exit;
  end;
  Dec(Index);
  SetLength(Temp, Index);
  Move(S[1], Temp[1], Index);
  GetLastToken := ReverseStr(Temp);
end;

{----------------------------------------------------
       Name: GetLogicalAddress function
Declaration: GetLogicalAddr(A: Pointer): Pointer;
       Unit: StrBox
       Code: S
       Date: 02/09/95
Description: Enter a physical address and this function
             will return a logical address.
-----------------------------------------------------}

{$ifdef OLDDELPHI}
function GetLogicalAddr(A: Pointer): Pointer;
var
  APtr: Pointer;
begin
  if A = nil then exit;
  if Ofs(A) = $FFFF then exit;
  asm
    mov ax, A.Word[0]
    mov dx, A.Word[2]
    mov es,dx
    mov dx,es:Word[0]
    mov APtr.Word[0], ax
    mov APtr.Word[2], dx
  end;
  GetLogicalAddr := APtr;
end;
{$endif}

function GetTimeString: string;
begin
  Result := TimeToStr(Time);
end;

function GetTimeFormat: string;
var
 h, m, s, hund : Word;
begin
   DecodeTime(Time, h, m, s, hund);
   GetTimeFormat:= Int2StrPad0(h, 2) + ':' +
           Int2StrPad0(m, 2) + ':' + Int2StrPad0(s, 2);
end;

{----------------------------------------------------
       Name: GetTodayName function
Declaration: GetTodayName(Pre, Ext: string): string;
       Unit: StrBox
       Code: S
       Date: 03/01/94
Description: Return a filename of type PRE0101.EXT,
             where PRE and EXT are user supplied strings,
             and 0101 is today's date.
-----------------------------------------------------}
function GetTodayName(Pre, Ext: string): string;
var
  y, m, d : Word;
  Year: String;
begin
  DecodeDate(Date,y,m,d);
  Year := Int2StrPad0(y, 4);
  Delete(Year, 1, 2);
  GetTodayName := Pre + Int2StrPad0(m, 2) + Int2StrPad0(d, 2) +
                    Year + '.' + Ext;
end;

{----------------------------------------------------
       Name: GetTodaysDate function
Declaration: GetTodaysDate: string;
       Unit: StrBox
       Code: S
       Date: 08/16/94
Description: Return a string of type MM/DD/YY.
-----------------------------------------------------}
function GetTodaysDate: string;
var
  y, m, d: Word;
  Year: String;
begin
  DecodeDate(Date, y,m,d);
  Year := Int2StrPad0(y, 4);
  Delete(Year, 1, 2);
  GetTodaysDate := Int2StrPad0(m, 2) + '/' + Int2StrPad0(d, 2) + '/' + Year;
end;

function IsNumber(Ch: Char): Boolean;
begin
  IsNumber := ((Ch >= '0') and (Ch <= '9'));
end;

{----------------------------------------------------
       Name: LeftSet function
Declaration: LeftSet(src: string; Width: Integer;
                     var Trunc: Boolean): string;
       Unit: StrBox
       Code: S
       Date: 03/01/94
Description: Pad a string on the left
-----------------------------------------------------}
function LeftSet(src: string; Width: Integer; var Trunc: Boolean): String;
var
  I : Integer;
  Temp: string[80];
begin
  Trunc := False;
  Temp := src;
  if(Length(Temp) > Width) and (Width > 0) then begin
    Temp[0] := CHR(Width);
    Trunc := True;
  end else
    for i := Length(Temp) to width do
      Temp := Temp + ' ';
  LeftSet := Temp;
end;

{----------------------------------------------------
       Name: StripFirstWord function
Declaration: StripFirstWord(S : string) : string;
       Unit: StrBox
       Code: S
       Date: 03/02/94
Description: Strip the first word from a sentence,
             return the shortened sentence. Return original
             string if there is no first word.
-----------------------------------------------------}
function StripFirstWord(S : string) : string;
var
  i, Size: Integer;
begin
  i := Pos(#32, S);
  if i = 0 then begin
    StripFirstWord := S;
    Exit;
  end;
  Size := (Length(S) - i);
  Move(S[i + 1], S[1], Size);
  SetLength(S, Size);
  StripFirstWord := S;
end;
{----------------------------------------------------
       Name: FirstWord procedure
Declaration: FirstWord(var S, First: String) : String;
       Unit: MayBox
       Code: S
       Date: 20/01/98
Description: Эта функция выбирает из строки S  первое слово и посылается в FirstWord
-----------------------------------------------------}



function FirstWord(var S : String) : String;
var
  i,i1, Size: Integer;
begin
    i:=1;Size:=Length(S);
    while (S[i]=#32) and (i<=Size) do i:=i+1;i1:=i;
    while (S[i1]<>#32) and (i<=Size) do i1:=i1+1;
    FirstWord:=copy(S,i,i1-i);
end;
{----------------------------------------------------
       Name: NXYWord procedure
Declaration: NXYWord(var S, N, X, Y : String) : String;
       Unit: MayBox
       Code: S
       Date: 20/01/98
Description: Эта процедура разбивает строку S  на три
             слова (первое слово посылается в N
                    второе - в X
                    третье - в Y
-----------------------------------------------------}

procedure NXYWord(var S,one,two,three : String);
var
  i,i1, Size: Integer;
  S1,S2: String;
begin
    i:=1;Size:=Length(S);
    while (S[i]=#32) and (i<=Size) do i:=i+1;i1:=i;
    while (S[i1]<>#32) and (i<=Size) do i1:=i1+1;
    one:=copy(S,i,i1-i);
    s1:='                                                ';
    s2:='                                                ';
    move(S[i1],S1[1],size-i1+1);
    i:=1;Size:=Length(S1);
    while (S1[i]=#32) and (i<=Size) do i:=i+1;i1:=i;
    while (S1[i1]<>#32) and (i<=Size) do i1:=i1+1;
    two:=copy(S1,i,i1-i);
    move(S1[i1],S2[1],size-i1+1);
    i:=1;Size:=Length(S2);
    while (S2[i]=#32) and (i<=Size) do i:=i+1;i1:=i;
    while (S2[i1]<>#32) and (i<=Size) do i1:=i1+1;
    three:=copy(S2,i,i1-i);
  end;
{----------------------------------------------------
       Name: Points procedure
Declaration: Points(var S,A,B : String);
       Unit: MayBox
       Code: S
       Date: 20/01/98
Description: Эта процедура разбивает строку S  на два
             слова (первое слово посылается в А
                                   второе - в В
-----------------------------------------------------}
procedure Points(var S,A,B : String);
var
  i,i1, Size: Integer;
  S1,S2: String;
begin
  i:=1;Size:=Length(S);
  while (S[i]=#32) and (i<=Size) do i:=i+1;i1:=i;
  while (S[i1]<>#32) and (i<=Size) do i1:=i1+1;
  A:=copy(S,i,i1-i);
  s1:='                                                ';
  s2:='                                                ';
  move(S[i1],S1[1],size-i1+1);
  i:=1;Size:=Length(S1);
  while (S1[i]=#32) and (i<=Size) do i:=i+1;i1:=i;
  while (S1[i1]<>#32) and (i<=Size) do i1:=i1+1;
  B:=copy(S1,i,i1-i);
  end;
  {----------------------------------------------------
       Name: NXYZWord procedure
Declaration: procedure NXYZWord(var S,one,two,three,foure : String);
       Unit: MayBox
       Code: S
       Date: 20/01/98
Description: Эта процедура разбивает строку S  на четыре
             слова (первое слово посылается в one
                    второе - в two
                    третье - в three
                    четвертое - в foure
-----------------------------------------------------}

procedure NXYZWord(var S,one,two,three,foure : String);
var
  i,i1, Size: Integer;
  S1,S2,S3: String;
begin
    i:=1;Size:=Length(S);
    while (S[i]=#32) and (i<=Size) do i:=i+1;i1:=i;
    while (S[i1]<>#32) and (i<=Size) do i1:=i1+1;
    one:=copy(S,i,i1-i);
    s1:='                                                                                                    ';
    s2:='                                                                                                    ';
    s3:='                                                                                                    ';
    move(S[i1],S1[1],size-i1+1);
    i:=1;Size:=Length(S1);
    while (S1[i]=#32) and (i<=Size) do i:=i+1;i1:=i;
    while (S1[i1]<>#32) and (i<=Size) do i1:=i1+1;
    two:=copy(S1,i,i1-i);
    move(S1[i1],S2[1],size-i1+1);
    i:=1;Size:=Length(S2);
    while (S2[i]=#32) and (i<=Size) do i:=i+1;i1:=i;
    while (S2[i1]<>#32) and (i<=Size) do i1:=i1+1;
    three:=copy(S2,i,i1-i);
    move(S2[i1],S3[1],size-i1+1);
    i:=1;Size:=Length(S2);
    while (S3[i]=#32) and (i<=Size) do i:=i+1;i1:=i;
    while (S3[i1]<>#32) and (i<=Size) do i1:=i1+1;
    foure:=copy(S3,i,i1-i);

  end;

  {----------------------------------------------------
       Name: GMToDegr function
Declaration: GMToDegr(var S : String): Real;
       Unit: MayBox
       Code: S
       Date: 20/01/98
Description: Эта функция преобразует строку S  в градусы и
             десяные градусов
-----------------------------------------------------}
function GMToDegr(var S : String): Real;
var
  Sizegr,i,Size: Integer;
  Sec,Min,Gr,S1,S2,msg: String;
  Grad,Minut,A,B,C:Real;
  PI:Double;
  label 1;
begin
  PI:=3.141592653591781;
  S1:='     ';
  S2:='     ';
  S:=Trim(S);
  Size:=Length(S);
  i:=Pos(#46,S);
  if (i<>0) then
      begin
         move(S[i-2],S1[1],4);
         move(S[1],S2[1],Size-4);
         Min:=trim(S1);
         A:=Str2Real(Min);
         Minut:=A;
         C:=Int(Minut);
         if C>=60 then
         begin
            msg:='                                Внимание !  Внимание !                                                        Угол'+'   '+s+'  в координировании имеет минуты больше 60 ';
            MessageDlg(msg, mtInformation,
            [mbOk], 0);
         end;
         Gr:=trim(S2);
         B:=Str2Real(Gr);
         Grad:=B;
         Grad:=Grad+Minut/60;
         GMToDegr:=PI*Grad/180;
      end;
  if (i=0) then
      begin
         move(S[Size-1],S1[1],2);
         move(S[1],S2[1],Size-2);
         Min:=trim(S1);
         A:=Str2Real(Min);
         Minut:=A;
         C:=Int(Minut);
         if C>=60 then
         begin
            msg:='                                Внимание !  Внимание !                                                        Угол'+'   '+s+'  в координировании имеет минуты больше 60 ';
            MessageDlg(msg, mtInformation,
            [mbOk], 0);
         end;
         Gr:=trim(S2);
         B:=Str2Real(Gr);
         Grad:=B;
         Grad:=Grad+Minut/60;
         GMToDegr:=PI*Grad/180;
      end;
 end;

 {----------------------------------------------------
       Name: DirectionAngl procedure
Declaration: DirectionAngl(var X1,Y1,X2,Y2 : String; A : Real);
       Unit: MayBox
       Code: S
       Date: 20/01/98
Description: Эта процедура вычисляет дирекционный угол
с точки координаты которой Х1,У1 на точку (Х2,У2)
результат Real посылается в А
-----------------------------------------------------}

procedure DirectionAngl(var X1,Y1,X2,Y2 : Variant; A : Real);
var
Result,Result_X1,Result_Y1,Result_X2,Result_Y2,DeltaX,DeltaY,Alfa:Real;
begin
         X1:=trim(X1);
         Result_X1:=Str2Real(X1);
         X2:=trim(X2);
         Result_X2:=Str2Real(X2);
         Y1:=trim(Y1);
         Result_Y1:=Str2Real(Y1);
         Y2:=trim(Y2);
         Result_Y2:=Str2Real(Y2);
         DeltaX:=Result_X2-Result_X1;
         DeltaY:=Result_Y2-Result_Y1;
         if (DeltaX<>0) then Alfa:=DeltaY/DeltaX else A:=0;
         Result:=ArcTan(Alfa);
         A:=Result;
end;
{----------------------------------------------------
       Name: SecondtWord function
Declaration: SecondWord(var S : String) : String;
       Unit: MayBox
       Code: S
       Date: 03/02/94
Description: Strip the first word from a sentence,
             return word and a shortened sentence.
             Return an empty string if there is no
             first word.
-----------------------------------------------------}
function SecondWord(var S : String) : String;
var
  i,i1, Size: Integer;
  S1: String;
begin
  i:=1;Size:=Length(S);
  while (S[i]=#32) and (i<=Size) do i:=i+1;i1:=i;
  while (S[i1]<>#32) and (i<=Size) do i1:=i1+1;
  SecondWord:=copy(S,i,i1-1);
  s:=copy(s,i1,size-i1);
end;

{----------------------------------------------------
       Name: TherdWord function
Declaration: TherdWord(var S : String) : String;
       Unit: MayBox
       Code: S
       Date: 03/02/94
Description: Strip the first word from a sentence,
             return word and a shortened sentence.
             Return an empty string if there is no
             first word.
-----------------------------------------------------}
function TherdWord(var S : String) : String;
var
  i,i1, Size: Integer;
  S1: String;
begin
  i:=1;Size:=Length(S);
  while (S[i]=#32) and (i<=Size) do i:=i+1;i1:=i;
  while (S[i1]<>#32) and (i<=Size) do i1:=i1+1;
  TherdWord:=copy(S,i,i1);
  s:=copy(s,i1,size-i1);

end;

{----------------------------------------------------
       Name: ReplaceString
Declaration: ReplaceString(NewStr, ReplaceStr, Data: string): string;
       Unit: StrBox
       Code: S
       Date: 06/06/95
Description: Given a long string, replace one substring with another.
             Take the string: "Football Delight"
             The job is to replace the word Delight with Night:
             S := ReplaceString(Night, Delight, 'Football Delight');
             where S ends up equaling "Football Night';
-----------------------------------------------------}
function ReplaceString(NewStr, ReplaceStr, Data: string): string;
var
  OffSet: Integer;
begin
  OffSet := Pos(ReplaceStr, Data);
  Delete(Data, OffSet, Length(ReplaceStr));
  Insert(NewStr, Data, OffSet);
  Result := Data;
end;

function ReplaceChars(S: string; OldCh, NewCh: Char): string;
var
  Len: Integer;
  i: Integer;
begin
  Len := Length(S);
  for i := 1 to Len do
    if S[i] = OldCh then
      S[i] := NewCh;
  Result := S;
end;

function ReverseStr(S: string): string;
var
  Len: Integer;
  Temp: String;
  i,j: Integer;
begin
  Len := Length(S);
  SetLength(Temp, Len);
  j := Len;
  for i := 1 to Len do begin
    Temp[i] := S[j];
    dec(j);
  end;
  ReverseStr := Temp;
end;

function RightCharSet(Src: string; Width: Integer;
                      Ch: Char; var Trunc: Boolean): String;
var
  I : Integer;
  Temp: string[80];
begin
  Trunc := False;
  Temp := Src;
  if(Length(Temp) > Width) and (Width > 0) then begin
    Temp[0] := CHR(Width);
    Trunc := True;
  end else
    for i := Length(Temp) to (width - 1) do
      Temp := Ch + Temp ;
  RightCharSet := Temp;
end;

function Shorten(S: string; Cut: Integer): string;
begin
  SetLength(S, Length(S) - Cut);
  Shorten := S;
end;

procedure SplitDirName(Path : PathStr; var Dir: DirStr; var WName: Str12);
begin
  Dir := ExtractFilePath(Path);
  WName := ExtractFileName(Path);
end;
{
procedure SplitDirName(Path : PathStr; var Dir: DirStr; var WName: Str12);
begin
  FSplit(Path, Dir, Name, Ext);
  WName := ExtractFileName(Path);
end;
}

{----------------------------------------------------
       Name: StripBlanks function
Declaration: function StripBlanks(var S: string): String;
       Unit: StrBox
       Code: S
       Date: 03/02/94
Description: Strip any stray spaces from the end of
             a string
-----------------------------------------------------}
function StripBlanks(S: string): string;
var
  i: Integer;
begin
  i := Length(S);
  while (Length(S) <= i) and (Length(S) > 0) and (S[i] = ' ') do begin
    Delete(S,i,1);
    Dec(i);
  end;
  StripBlanks := S;
end;

function StripEndChars(S: string; Ch: Char): string;
var
  i: Integer;
begin
  i := Length(S);
  while (length(S) > 0) and (S[i] = Ch) do begin
    Delete(S,i,1);
    Dec(i);
  end;
  StripEndChars := S;
end;


function StripFirstToken(S: string; Ch: Char): string;
var
  i, Size: Integer;
begin
  i := Pos(Ch, S);
  if i = 0 then begin
    StripFirstToken := S;
    Exit;
  end;
  Size := (Length(S) - i);
  Move(S[i + 1], S[1], Size);
  SetLength(S, Size);
  StripFirstToken := S;
end;

{----------------------------------------------------
       Name: StripFrontChars function
Declaration: StripFrontChars(S: string; Ch: Char) : String;
       Unit: StrBox
       Code: S
       Date: 03/02/94
Description: Strips any occurances of charact Ch that
             might precede a string.
-----------------------------------------------------}
function StripFrontChars(S: string; Ch: Char): string;
begin
  while (Length(S) > 0) and (S[1] = Ch) do
    S := Copy(S,2,Length(S) - 1);
  StripFrontChars := S;
end;

function StripFromFront(S: string; Len: Integer): string;
begin
  S := ReverseStr(S);
  S := Shorten(S, Len);
  S := ReverseStr(S);
  StripFromFront := S;
end;

{----------------------------------------------------
       Name: StripLastToken function
Declaration: function RemoveLastToken(var S: String): String;
       Unit: StrBox
       Code: S
       Date: 03/02/94
Description: Given a string like "c:\sam\file.txt"
             This returns: "c:\sam"
             But not specific to files any token will do
-----------------------------------------------------}
function StripLastToken(S: string; Token: Char): string;
var
  Temp: string;
  Index: INteger;
begin
  SetLength(Temp, Length(S));
  S := ReverseStr(S);
  Index := Pos(Token, S);
  Inc(Index);
  Move(S[Index], Temp[1], Length(S) - (Index - 1));
  SetLength(Temp, Length(S) - (Index - 1));
  StripLastToken := ReverseStr(Temp);
end;


  {----------------------------------------------------
       Name: NXYHABCWord procedure
Declaration: procedure NXYZWord(var S,one,two,three,foure,five,six,seven: String);
       Unit: MayBox
       Code: S
       Date: 21/06/99,by Rom
Description: Эта процедура разбивает строку S  на семь
             слов (первое слово посылается в one
                    второе - в two
                    третье - в three
                    четвертое - в foure
                    пятое - в five
                    шестое - в six
                    седьмое - в seven
-----------------------------------------------------}

{procedure NXYHABCWord(var S,one,two,three,foure,five,six,seven : String);
var
  i,i1, Size: Integer;
  S1,S2,S3: String;
begin
    i:=1;Size:=Length(S);
    while (S[i]=#32) and (i<=Size) do i:=i+1;i1:=i;
    while (S[i1]<>#32) and (i<=Size) do i1:=i1+1;
    one:=copy(S,i,i1-i);
    s1:='                                                ';
    s2:='                                                ';
    s3:='                                                ';
    move(S[i1],S1[1],size-i1+1);
    i:=1;Size:=Length(S1);
    while (S1[i]=#32) and (i<=Size) do i:=i+1;i1:=i;
    while (S1[i1]<>#32) and (i<=Size) do i1:=i1+1;
    two:=copy(S1,i,i1-i);
    move(S1[i1],S2[1],size-i1+1);
    i:=1;Size:=Length(S2);
    while (S2[i]=#32) and (i<=Size) do i:=i+1;i1:=i;
    while (S2[i1]<>#32) and (i<=Size) do i1:=i1+1;
    three:=copy(S2,i,i1-i);
    move(S1[i1],S3[1],size-i1+1);
    i:=1;Size:=Length(S2);
    while (S2[i]=#32) and (i<=Size) do i:=i+1;i1:=i;
    while (S2[i1]<>#32) and (i<=Size) do i1:=i1+1;
    foure:=copy(S3,i,i1-i);

  end; }




end.

