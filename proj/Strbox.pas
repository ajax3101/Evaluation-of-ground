unit StrBox;
{$N+}
{.$DEFINE OLDDELPHI}
interface

uses
  MathBox, SysUtils, Winprocs, WinTypes;

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
function GetTodaysDate_R: string;
function GetTimeString: string;
function GetTimeFormat: string;
function IsNumber(Ch: Char): Boolean;
function LeftSet(src: string; Width:Integer; var Trunc: Boolean): String;
function ReplaceChars(S: string; OldCh, NewCh: Char): string;
function RightCharSet(Src: string; Width: Integer;
                      Ch: Char; var Trunc: Boolean): string;
function RemoveFirstWord(var S : String) : String;
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
{----------------------------------------------------
       Name: GetTodaysDate_R function
Declaration: GetTodaysDate_R: string;
       Unit: StrBox
       Code: S
       Date: 16/08/94
Description: Return a string of type DD/MM/YY.
-----------------------------------------------------}
function GetTodaysDate_R: string;
var
  y, m, d: Word;
  Year: String;
begin
  DecodeDate(Date, y,m,d);
  Year := Int2StrPad0(y, 4);
  Delete(Year, 1, 2);
  GetTodaysDate_R := Int2StrPad0(d, 2) + '/' + Int2StrPad0(m, 2) + '/' + Year;
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
       Name: RemoveFirstWord function
Declaration: RemoveFirstWord(var S : String) : String;
       Unit: StrBox
       Code: S
       Date: 03/02/94
Description: Strip the first word from a sentence,
             return word and a shortened sentence.
             Return an empty string if there is no
             first word.
-----------------------------------------------------}
function RemoveFirstWord(var S : String) : String;
var
  i, Size: Integer;
  S1: String;
begin
  i := Pos(#32, S);
  if i = 0 then begin
    RemoveFirstWord := '';
    Exit;
  end;
  SetLength(S1, i);
  Move(S[1], S1[1], i);
  SetLength(S1, i-1);
  Size := (Length(S) - i);
  Move(S[i + 1], S[1], Size);
  SetLength(S, Size);
  RemoveFirstWord := S1;
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

end.

