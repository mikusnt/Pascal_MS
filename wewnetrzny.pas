unit wewnetrzny;

interface
        uses
                crt;
        function bin(a:longint):string;
        procedure typowyk;
        procedure czbk;
        procedure niebbial;
        procedure niebcz;
        procedure cznieb;
        procedure wymazywanie(x,y,op1:integer);
        procedure haslo_pop(x,y,op1:integer);
        procedure haslo_niepop(x,y,a:integer);
        procedure haslo_brak(x,y,op1:integer);
        procedure wymazywanie2(x,y,op1,a:integer);
        procedure wymazywanie3(x,y:integer);
        procedure wymazywanie4(x,y:integer);

implementation
        function bin(a:longint):string;

        var
                b,c,d,e:longint;
                wartosc,liczba:string;
                tablica:array[1..100] of integer;
        begin
                wartosc:='';
                d:=0;
                while a > 0 do
                begin
                        d:=d+1;
                        b:=a div 2;
                        c:=a mod 2;
                        a:=b;
                        tablica[d]:=c;

                end;

        for e:=d downto 1 do
                begin
                        str(tablica[e],liczba);
                        wartosc:=wartosc+liczba;

                end;
        bin:=wartosc;
        end;

        procedure typowyk;
        begin
                TextColor(7);
                TextBackGround(0);
        end;

        procedure czbk;
        begin
                textcolor(0);
                textbackground(7);
        end;

        procedure niebbial;
        begin
                textcolor(7);
                textbackground(11);
        end;

        procedure niebcz;
        begin
                textcolor(0);
                textbackground(11);
        end;

        procedure cznieb;
        begin
                textcolor(11);
                textbackground(0);
        end;

        procedure wymazywanie(x,y,op1:integer);
        begin
                gotoxy(x,y);
                writeln('    ');
                gotoxy(x,y);
                delay(op1);
                gotoxy(x-27,y+4);
                write('                                   ');
                gotoxy(x,y);
                delay(op1);
                gotoxy(x-27,y+5);
                write('                                   ');
                gotoxy(x,y);
        end;

        procedure haslo_pop(x,y,op1:integer);
        begin
                gotoxy(x,y);
                write('Has�o jest poprawne...');
                gotoxy(x,y);
                delay(op1);
                write('                      ');
                gotoxy(x,y);
                delay(op1 div 2);
        end;

        procedure haslo_niepop(x,y,a:integer);
        begin
                gotoxy(x,y+a);
                writeln('Has�o jest niepoprawne...');
        end;

        procedure haslo_brak(x,y,op1:integer);
        begin
                gotoxy(x-4,y-7);
                writeln('                               ');
                gotoxy(x,y-7);
                writeln('Brakuje pliku z has�em.');
                gotoxy(x-1,y);
                writeln('Musisz poda� has�o g��wne.');
                gotoxy(x+15,y-3);
        end;

        procedure wymazywanie2(x,y,op1,a:integer);
        begin
                if a=1 then
                        begin
                                gotoxy(x,y);
                                delay(op1+(op1 div 2));
                                write('                           ');
                                gotoxy(x,y+1);
                                delay(op1+(op1 div 2));
                                write('                           ');
                                gotoxy(x,y+1);
                                delay(op1);
                        end
                else
                        begin
                                gotoxy(x,y);
                                delay(op1);
                                write('                           ');
                                gotoxy(x,y+1);
                                delay(op1);
                                write('                           ');
                                gotoxy(x,y+2);
                                delay(op1);
                                write('                           ');
                                gotoxy(x,y+2);
                                delay(op1);
                        end;

        end;

        procedure wymazywanie3(x,y:integer);
        var
                a:integer;
        begin
                for a:=0 to 11 do
                        begin
                                gotoxy(x,y+a);
                                writeln('                                                                                       ');
                        end;
        end;

        procedure wymazywanie4(x,y:integer);
        var
                a:integer;
        begin
                for a:=0 to 8 do
                        begin
                                gotoxy(x,y+a);
                                writeln('                                       ');
                        end;
        end;


begin
end.
