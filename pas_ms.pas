unit pas_ms;

interface
        uses
                crt,
                wewnetrzny,
                windows,
                dos;
        procedure napis_glowny(ogranicz:boolean);
        procedure napis_okrojony;
        procedure napis_haslo;
        procedure wczytywanie(x,y,op1:integer);
        procedure wczytywanie_sz(x,y,op1:integer);
        procedure zam_modulu(x,y,op1:integer);
        procedure zam_programu(x,y,op1:integer);
        procedure przel_modulu(x,y,op1:integer);
        procedure negacja(a,x,y:integer);
        procedure przes_lewo(a,b,x,y:integer);
        procedure przes_prawo(a,b,x,y:integer);
        procedure koniukcja(a,b,x,y:integer);
        procedure alternatywa(a,b,x,y:integer);
        procedure sumas(a,b,x,y:integer);
        procedure wizytowka(x,y:integer);
        procedure autor(x,y:integer);
        procedure error(sciezka:string);
        function pkoncowe:char;
        function pkoncowe_tlo(x,y:integer):char;
        function pkoncowen_tlo(x,y,czyszczenie:integer):char;
        procedure tabelka(x,y,waga,ilosc:integer);
        procedure tabelka_punkty(x,y,ilosc:integer);
        procedure podswietlenie(x,y,wartosc,max,aktualne:integer);
        procedure zaznaczenie(x,y:integer);
        procedure odswietlenie(x,y,wartosc,max,aktualne:integer);
        procedure instrukcja(x,y:integer;tekst1,tekst2:string);
        function godzina:string;
        function data:string;
        procedure podswietlenie_slowa(x,y:integer;wartosc:string);
        procedure odswietlenie_slowa(x,y:integer;wartosc:string);
        procedure zaznaczenie_slowa(x,y,dlugosc:integer);
        procedure menu_podswietlenie(x,y:integer;slowo:string;zaznaczenie:integer);
        procedure poziom_listy(x,y,lista,polozenie:integer);
        procedure poziom_listyn(x,y,lista,polozenie:integer);
        procedure komentarz(x,y,lista:integer);
        function naslowo(liczba:extended;dokl:byte):string;
        function Zaokraglij(Liczba: extended; miejsca: Byte): extended;  //funkcja z internetu


implementation
        procedure napis_glowny(ogranicz:boolean);
        var
                licznik:integer;
        begin
                writeln('ษอออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออป');
                writeln('บ                                                                                           บ');
                writeln('บ ooooooooo.                                          oooo     ooo        ooooo  .oooooo..o บ');
                writeln('บ `888   `Y88.                                        `888     `88.       .888` d8P`    `Y8 บ');
                writeln('บ  888   .d88`  .oooo.    .oooo.o  .ooooo.   .oooo.    888      888b     d`888  Y88bo.      บ');
                writeln('บ  888ooo88P`  `P  )88b  d88(  "8 d88` `"Y8 `P  )88b   888      8 Y88. .P  888   `"Y8888o.  บ');
                writeln('บ  888          .oP"888  `"Y88b.  888        .oP"888   888      8  `888`   888       `"Y88b บ');
                writeln('บ  888         d8(  888  o.  )88b 888   .o8 d8(  888   888      8    Y     888  oo     .d8P บ');
                writeln('บ o888o        `Y888bb8o 8bb888P` `Y8bod8P` `Y888bb8o o888o    o8o        o888o 8bb88888P`  บ');
                writeln('บ                                                                                           บ');
                writeln('ศอออออออออออออออออออออออออป   Mikoaj Stankowiak, 09.08.2012r   ษอออออออออออออออออออออออออออผ');
                writeln('                          ศออป                               ษออผ                               ');
                writeln('                             ฬอออออออออออออออออออออออออออออออน                               ');
                writeln('                             บ                               บ          Komentarz:           ');
                writeln('                             บ      Wybierz podprogram:      บ                               ');
                writeln('                             บ                               บ                               ');
                writeln('                             ฬอออออออออออออออออออออออออออออออน                               ');
                writeln('       Wcinij               บ                               บ                               ');
                writeln('        aby wywoa          บ                               บ                               ');
                writeln('       danฅ czynno         บ                               บ                               ');
                writeln('                             ฬอออออออออออออออออออออออออออออออน                               ');
                writeln('   Program jest w wersji     บ                               บ                               ');
                writeln('   demo. Skontaktuj siฉ z    บ                               บ                               ');
                writeln(' wacicielem w celu zakupu  บ                               บ                               ');
                writeln('         licencji.           ฬอออออออออออออออออออออออออออออออน                               ');
                writeln('                             บ                               บ                               ');
                writeln('        Wcinij              บ                               บ                               ');
                writeln('         aby wyj           บ                               บ                               ');
                writeln('                             ฬอออออออออออออออออออออออออออออออน                               ');
                writeln('                             บ                               บ                               ');
                writeln('                             บ                               บ                               ');
                writeln('                             บ                               บ                               ');
                writeln('                             ศอออออออออออออออออออออออออออออออผ                               ');
                cznieb;
                gotoxy(11,13);
                write('v. 2.03');
                gotoxy(16,18);
                write('Enter');
                gotoxy(17,27);
                write('ESC');

                gotoxy(29,11);
                write(#01);
                gotoxy(63,11);
                write(#01);
                typowyk;

                if ogranicz = false then
                begin
                        for licznik:=0 to 3 do
                        begin
                                gotoxy(2,22+licznik);
                                write('                           ');
                        end;
                end;
        end;

        procedure napis_okrojony;
        begin
                writeln('ษอออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออป');
                writeln('บ                                                                                           บ');
                writeln('บ ooooooooo.                                          oooo     ooo        ooooo  .oooooo..o บ');
                writeln('บ `888   `Y88.                                        `888     `88.       .888` d8P`    `Y8 บ');
                writeln('บ  888   .d88`  .oooo.    .oooo.o  .ooooo.   .oooo.    888      888b     d`888  Y88bo.      บ');
                writeln('บ  888ooo88P`  `P  )88b  d88(  "8 d88` `"Y8 `P  )88b   888      8 Y88. .P  888   `"Y8888o.  บ');
                writeln('บ  888          .oP"888  `"Y88b.  888        .oP"888   888      8  `888`   888       `"Y88b บ');
                writeln('บ  888         d8(  888  o.  )88b 888   .o8 d8(  888   888      8    Y     888  oo     .d8P บ');
                writeln('บ o888o        `Y888bb8o 8bb888P` `Y8bod8P` `Y888bb8o o888o    o8o        o888o 8bb88888P`  บ');
                writeln('บ                                                                                           บ');
                writeln('ศอออออออออออออออออออออออออป   Mikoaj Stankowiak, 09.08.2012r   ษอออออออออออออออออออออออออออผ');
                writeln('                          ศออป                               ษออผ                            ');
                writeln('                             ฬอออออออออออออออออออออออออออออออน                               ');
                writeln('                             บ                               บ                               ');
                writeln('                             บMasz 3 prขby na wpisanie hasa.บ                               ');
                writeln('                             บ                               บ                               ');
                writeln('                             ฬอออออออออออออออออออออออออออออออน                               ');
                writeln('        Wcinij Enter        บ                               บ         Wcinij F2 aby        ');
                writeln('       aby zatwiedzi        บ      Podaj haso:             บ        zmieni aktualne       ');
                writeln('            haso            บ                               บ             haso             ');
                writeln('                             ศอออออออออออออออออออออออออออออออผ                               ');
                writeln('                                                                                             ');
                writeln('                                                                                             ');
                writeln('                                                                     Wcinij Backspace      ');
                writeln('                                                                        aby usunฅ          ');
                writeln('                                                                     niepoพฅdany znak     ');
                cznieb;
                gotoxy(11,13);
                write('v. 2.03');
                gotoxy(29,11);
                write(#01);
                gotoxy(63,11);
                write(#01);
                gotoxy(80,18);
                write('F2');
                gotoxy(17,18);
                write('Enter');
                gotoxy(78,24);
                write('Backspace');
                typowyk;
        end;

        procedure napis_haslo;
        begin
                writeln('ษอออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออป');
                writeln('บ                                                                                           บ');
                writeln('บ ooooooooo.                                          oooo     ooo        ooooo  .oooooo..o บ');
                writeln('บ `888   `Y88.                                        `888     `88.       .888` d8P`    `Y8 บ');
                writeln('บ  888   .d88`  .oooo.    .oooo.o  .ooooo.   .oooo.    888      888b     d`888  Y88bo.      บ');
                writeln('บ  888ooo88P`  `P  )88b  d88(  "8 d88` `"Y8 `P  )88b   888      8 Y88. .P  888   `"Y8888o.  บ');
                writeln('บ  888          .oP"888  `"Y88b.  888        .oP"888   888      8  `888`   888       `"Y88b บ');
                writeln('บ  888         d8(  888  o.  )88b 888   .o8 d8(  888   888      8    Y     888  oo     .d8P บ');
                writeln('บ o888o        `Y888bb8o 8bb888P` `Y8bod8P` `Y888bb8o o888o    o8o        o888o 8bb88888P`  บ');
                writeln('บ                                                                                           บ');
                writeln('ศอออออออออออออออออออออออออป   Mikoaj Stankowiak, 09.08.2012r   ษอออออออออออออออออออออออออออผ');
                writeln('                          ศออป                               ษออผ                            ');
                writeln('                             ฬอออออออออออออออออออออออออออออออน                               ');
                writeln('                             บ                               บ                               ');
                writeln('                             บ      Menu zmiany hasa:       บ                               ');
                writeln('                             บ                               บ                               ');
                writeln('                             ฬอออออออออออออออออออออออออออออออน                               ');
                writeln('                             บ                               บ                               ');
                writeln('                             บ      Podaj haso:             บ                               ');
                writeln('                             บ                               บ                               ');
                writeln('                             ฬอออออออออออออออออออออออออออออออน                               ');
                writeln('                             บ                               บ                               ');
                writeln('                             บ    Powtขrz haso:             บ                               ');
                writeln('                             บ                               บ                               ');
                writeln('                             ฬอออออออออออออออออออออออออออออออน                               ');
                writeln('                             บ                               บ                               ');
                writeln('                             บ       Nowe haso:             บ                               ');
                writeln('                             บ                               บ                               ');
                writeln('                             ฬอออออออออออออออออออออออออออออออน                               ');
                writeln('                             บ                               บ                               ');
                writeln('                             บ             Zmieไ             บ                               ');
                writeln('                             บ                               บ                               ');
                writeln('                             ศอออออออออออออออออออออออออออออออผ                               ');
                cznieb;
                gotoxy(11,13);
                write('v. 2.03');
                gotoxy(29,11);
                write(#01);
                gotoxy(63,11);
                write(#01);
                typowyk;
        end;


        procedure wczytywanie(x,y,op1:integer);
        var
                a,b:integer;
        begin
                gotoxy(x,y);
                write('Wczytywanie muduu...');
                gotoxy(x-6,y+1);
                textcolor(3);
                writeln('ษอออออออออออออออออออออออออออออออป');
                gotoxy(x-6,y+3);
                writeln('ศอออออออออออออออออออออออออออออออผ');
                gotoxy(x-6,y+2);
                writeln('บ');
                gotoxy(x+26,y+2);
                writeln('บ');

                textcolor(11);
                gotoxy(x-6,y+1);
                writeln('ษ');
                gotoxy(x+26,y+1);
                writeln('ป');
                gotoxy(x-6,y+3);
                writeln('ศ');
                gotoxy(x+26,y+3);
                writeln('ผ');

                typowyk;
                gotoxy(x-5,y+2);
                delay(op1);
                for a:=1 to 31 do
                        begin
                                write('*');
                                delay(op1);
                        end;

                gotoxy(1,1);
                for b:=1 to 5000 do
                write(' ');
                gotoxy(1,1);
        end;

        procedure wczytywanie_sz(x,y,op1:integer);
        var
                a,b:integer;
        begin
                gotoxy(x+4,y);
                write('Wczytywanie...');
                gotoxy(x-6,y+1);
                textcolor(3);
                writeln('ษอออออออออออออออออออออออออออออออป');
                gotoxy(x-6,y+3);
                writeln('ศอออออออออออออออออออออออออออออออผ');
                gotoxy(x-6,y+2);
                writeln('บ');
                gotoxy(x+26,y+2);
                writeln('บ');

                 textcolor(11);
                gotoxy(x-6,y+1);
                writeln('ษ');
                gotoxy(x+26,y+1);
                writeln('ป');
                gotoxy(x-6,y+3);
                writeln('ศ');
                gotoxy(x+26,y+3);
                writeln('ผ');

                typowyk;
                gotoxy(x-5,y+2);
                delay(op1);
                for a:=1 to 31 do
                        begin
                                write('*');
                                delay(op1);
                        end;
                gotoxy(1,1);
        end;

        procedure zam_modulu(x,y,op1:integer);
        var
                a,b,c:integer;
        begin
                c:=0;
                gotoxy(x-2,y);
                write('  Zamykanie moduu...');
                gotoxy(x-6,y+1);
                textcolor(3);
                writeln('ษอออออออออออออออออออออออออออออออป');
                gotoxy(x-6,y+3);
                writeln('ศอออออออออออออออออออออออออออออออผ');
                gotoxy(x-6,y+2);
                writeln('บ');
                gotoxy(x+26,y+2);
                writeln('บ');

                textcolor(11);
                gotoxy(x-6,y+1);
                writeln('ษ');
                gotoxy(x+26,y+1);
                writeln('ป');
                gotoxy(x-6,y+3);
                writeln('ศ');
                gotoxy(x+26,y+3);
                writeln('ผ');

                typowyk;
                gotoxy(x-5,y+2);
                delay(op1);
                for a:=1 to 31 do
                        begin
                                if (c = 21) then
                                        begin
                                                gotoxy(x-5,y);
                                                writeln('  adowanie moduu gขwnego...');

                                        end;
                                if c = 10 then op1:=op1 * 2;
                                if c = 20 then op1:=op1 div 2;
                                gotoxy(x+25-c,y+2);
                                write('*');
                                c:=c+1;
                                delay(op1);
                        end;

                gotoxy(1,1);
                for b:=1 to 5000 do
                write(' ');
                gotoxy(1,1);
                clrscr;
        end;

        procedure zam_programu(x,y,op1:integer);
        var
                a,b,c:integer;
        begin
                c:=0;
                gotoxy(x-2,y);
                write('  Zapisywanie ustawieไ...');
                gotoxy(x-6,y+1);
                textcolor(3);
                writeln('ษอออออออออออออออออออออออออออออออป');
                gotoxy(x-6,y+3);
                writeln('ศอออออออออออออออออออออออออออออออผ');
                gotoxy(x-6,y+2);
                writeln('บ');
                gotoxy(x+26,y+2);
                writeln('บ');

                textcolor(11);
                gotoxy(x-6,y+1);
                writeln('ษ');
                gotoxy(x+26,y+1);
                writeln('ป');
                gotoxy(x-6,y+3);
                writeln('ศ');
                gotoxy(x+26,y+3);
                writeln('ผ');

                typowyk;
                gotoxy(x-5,y+2);
                delay(op1);
                for a:=1 to 31 do
                        begin
                                if (c = 11) then
                                        begin
                                                gotoxy(x-5,y);
                                                writeln('                             ');
                                                gotoxy(x-1,y);
                                                writeln('  Zamykanie programu...');

                                        end;
                                if c = 15 then op1:=op1 div 2;
                                gotoxy(x+25-c,y+2);
                                write('*');
                                c:=c+1;
                                delay(op1);
                        end;

                gotoxy(1,1);
                for b:=1 to 5000 do
                write(' ');
                gotoxy(1,1);
                clrscr;
        end;

        procedure przel_modulu(x,y,op1:integer);
        var
                a,b:integer;
        begin
                gotoxy(x-2,y);
                write('  Odwieพanie moduu...');
                gotoxy(x-6,y+1);
                textcolor(3);
                writeln('ษอออออออออออออออออออออออออออออออป');
                gotoxy(x-6,y+3);
                writeln('ศอออออออออออออออออออออออออออออออผ');
                gotoxy(x-6,y+2);
                writeln('บ');
                gotoxy(x+26,y+2);
                writeln('บ');

                textcolor(11);
                gotoxy(x-6,y+1);
                writeln('ษ');
                gotoxy(x+26,y+1);
                writeln('ป');
                gotoxy(x-6,y+3);
                writeln('ศ');
                gotoxy(x+26,y+3);
                writeln('ผ');

                typowyk;
                gotoxy(x-5,y+2);
                delay(op1);
                for a:=1 to 31 do
                        begin
                                write('*');
                                delay(op1);
                        end;

                gotoxy(1,1);
                clrscr;
        end;


        procedure negacja(a,x,y:integer);
        var
                licznik:byte;
                c:longint;
                t1:text;
                slowoc,slowoa,slowobina:string;
        begin
                c:=not a;
                slowoc:=naslowo(c,0);
                slowoa:=naslowo(a,0);
                slowobina:=bin(a);
                gotoxy(x,y);
                assign(t1,'logi\logi_opbit.txt');
                append(t1);
                write('Negacja (');
                cznieb;
                write(' NOT ');
                typowyk;
                write(a,' ):');
                writeln(t1,godzina,' - Negacja ( NOT ',a,' ):');
                gotoxy(x,y+2);
                write('"nie"   a = ');
                cznieb;
                write(a);
                write(t1,'           "nie"   a = ',a);


                write(bin(a));
                write(t1,bin(a));
                gotoxy(x,y+4);
                write('Wynik:  ');
                cznieb;
                write(c);
                typowyk;
                write(t1,'           Wynik: ',c);
                for licznik:=1 to 10-length(slowoc) do
                        begin
                                write(' ');
                                write(t1,' ');
                        end;
                licznik:=0;
                repeat
                        licznik:=licznik+1;
                        if slowobina[licznik] = '1' then
                        begin
                                write('0');
                                write(t1,'0');
                        end;
                until slowobina[licznik] = '1';

                write(bin(c));
                writeln(t1,bin(c));
                close(t1);
        end;


        procedure przes_lewo(a,b,x,y:integer);
        var
                licznik:byte;
                c:longint;
                t1:text;
                slowoc,slowoa,slowob:string;
        begin
                c:=a shl b;
                slowoc:=naslowo(c,0);
                slowoa:=naslowo(a,0);
                slowob:=naslowo(b,0);
                gotoxy(x,y);
                assign(t1,'logi\logi_opbit.txt');
                append(t1);
                writeln('Przesuniฉcie w lewo o ',b,':');
                writeln(t1,godzina,' - Przesuniecie w lewo o ',b,':');
                gotoxy(x,y+2);
                write('SHL     b = ');
                cznieb;
                write(b);
                writeln(t1,'           SHL     b = ',b,'     <-------');
                gotoxy(x,y+2);
                write('SHL');
                gotoxy(x+18,y+2);
                write('<-------');
                typowyk;
                gotoxy(x,y+4);
                write('        a = ');
                cznieb;
                write(a);
                typowyk;
                write(t1,'                   a = ',a);
                for licznik:=1 to 6-length(slowoa) do
                begin
                        write(' ');
                        write(t1,' ');
                end;

                while b > 0 do
                        begin
                                write('0');
                                write(t1,'0');
                                b:=b-1;
                        end;
                writeln(bin(a));
                writeln(t1,bin(a));
                gotoxy(x,y+6);
                write('Wynik:  ');
                cznieb;
                write(c);
                typowyk;
                write(t1,'           Wynik:  ',c);
                for licznik:=1 to 10-length(slowoc) do
                        begin
                                write(' ');
                                write(t1,' ');
                        end;
                write(bin(c));
                writeln(t1,bin(c));
                close(t1);
        end;

        procedure przes_prawo(a,b,x,y:integer);
        var
                c,licznik:integer;
                t1:text;
                slowoa,slowoc:string;
        begin
                c:=a shr b;
                slowoa:=naslowo(a,0);
                slowoc:=naslowo(c,0);
                gotoxy(x,y);
                assign(t1,'logi\logi_opbit.txt');
                append(t1);
                writeln('Przesuniฉcie w prawo o ',b,':');
                writeln(t1,godzina,' - Przesuniecie w prawo o ',b,':');
                gotoxy(x,y+2);
                write('SHR     b = ');
                cznieb;
                write(b);
                gotoxy(x,y+2);
                write('SHR');
                gotoxy(x+18,y+2);
                write('------->');
                typowyk;
                writeln(t1,'           SHR     b = ',b,'     ------->');
                gotoxy(x,y+4);
                write('        a = ');
                cznieb;
                write(a);
                typowyk;
                write(t1,'                   a = ',a);
                for licznik:=1 to 6-length(slowoa) do
                begin
                        write(' ');
                        write(t1,' ');
                end;


                writeln(bin(a));
                writeln(t1,bin(a));
                gotoxy(x,y+6);
                write('Wynik:  ');
                cznieb;
                write(c);
                typowyk;
                write(t1,'           Wynik:  ',c);
                for licznik:=1 to 10-length(slowoc) do
                begin
                        write(' ');
                        write(t1,' ');
                end;
                while b > 0 do
                        begin
                                write('0');
                                write(t1,'0');
                                b:=b-1;
                        end;
                write(bin(c));
                write(t1,bin(c));
                close(t1);
        end;

        procedure koniukcja(a,b,x,y:integer);
        var
                c,e,d,licznik:integer;
                t1:text;
                slowob,slowoc,slowoa:string;
        begin
                c:=a and b;
                slowoc:=naslowo(c,0);
                slowob:=naslowo(b,0);
                slowoa:=naslowo(a,0);
                d:=length(bin(a)) - length(bin(b));
                gotoxy(x,y);
                assign(t1,'logi\logi_opbit.txt');
                append(t1);
                write('Koniukcja (',a,' ');
                cznieb;
                write('AND');
                typowyk;
                write(' ',b,'):');
                writeln(t1,godzina,' - Koniukcja (',a,' AND ',b,'):');
                gotoxy(x,y+2);
                write('        a = ');
                cznieb;
                write(a);
                typowyk;
                write(t1,'           "a"     a = ',a);
                for licznik:=1 to 7-length(slowoa) do
                begin
                        write(' ');
                        write(t1,' ');
                end;

                if (length(bin(a))) < (length(bin(b))) then                  //dopisywanie zera przed abin
                        begin
                                for licznik:=1 to length(bin(b)) - length(bin(a)) do
                                begin
                                        write('0');
                                        write(t1,'0');
                                end;
                        end;
                writeln(bin(a));
                writeln(t1,bin(a));
                gotoxy(x,y+3);
                write('"i"');
                gotoxy(x,y+4);
                write('        b = ');
                cznieb;
                write(b);
                typowyk;
                write(t1,'                   b = ',b);
                for licznik:=1 to 7-length(slowob) do
                begin
                        write(' ');
                        write(t1,' ');
                end;

                while d > 0 do
                        begin
                                write('0');
                                write(t1,'0');
                                e:=e+1;
                                d:=d-1;
                        end;

                writeln(bin(b));
                writeln(t1,bin(b));
                gotoxy(x,y+6);
                write('Wynik:  ');
                cznieb;
                write(c);
                typowyk;
                write(t1,'           Wynik:  ',c);

                for licznik:=1 to 11-length(slowoc) do
                begin
                        write(' ');
                        write(t1,' ');
                end;

                if c > 0 then
                        begin
                                d:=length(bin(a)) - length(bin(b));
                                e:=0;
                                while d > 0 do
                                        begin
                                                write('0');
                                                write(t1,'0');
                                                e:=e+1;
                                                d:=d-1;
                                        end;
                        end;
                write(bin(c));
                writeln(t1,bin(c));

                close(t1);
        end;

        procedure alternatywa(a,b,x,y:integer);
        var
                c,d,d1,e,licznik:integer;
                t1:text;
                slowob,slowoc,slowoa:string;
        begin
                c:=a or b;
                d:=length(bin(a)) - length(bin(b));
                d1:=length(bin(b)) - length(bin(a));
                e:=0;
                slowob:=naslowo(b,0);
                slowoc:=naslowo(c,0);
                slowoa:=naslowo(a,0);
                gotoxy(x,y);
                assign(t1,'logi\logi_opbit.txt');
                append(t1);
                write('Alternatywa (',a,' ');
                cznieb;
                write('OR');
                typowyk;
                write(' ',b,'):');
                writeln(t1,godzina,' - Alternatywa (',a,' OR ',b,'):');
                gotoxy(x,y+2);
                write('        a = ');
                cznieb;
                write(a);
                typowyk;
                write(t1,'           "lub"   a = ',a);
                for licznik:=1 to 7-length(slowoa) do
                begin
                        write(' ');
                        write(t1,' ');
                end;
                while d1 > 0 do
                        begin
                                write('0');
                                write(t1,'0');
                                d1:=d1-1;
                        end;
                writeln(bin(a));
                writeln(t1,bin(a));
                gotoxy(x,y+3);
                write('"lub"');
                gotoxy(x,y+4);
                write('        b = ');
                cznieb;
                write(b);
                typowyk;
                write(t1,'                   b = ',b);

                for licznik:=1 to 7-length(slowob) do
                begin
                        write(' ');
                        write(t1,' ');
                end;

                while d > 0 do
                        begin
                                write('0');
                                write(t1,'0');
                                e:=e+1;
                                d:=d-1;
                        end;

                writeln(bin(b));
                writeln(t1,bin(b));
                gotoxy(x,y+6);
                write('Wynik:  ');
                cznieb;
                write(c);
                typowyk;
                write(t1,'           Wynik:  ',c);

                for licznik:=1 to 11-length(slowoc) do
                begin
                        write(' ');
                        write(t1,' ');
                end;

                write(bin(c));
                writeln(t1,bin(c));
                close(t1);
        end;

        procedure sumas(a,b,x,y:integer);
        var
                c,d,d1,e,licznik:integer;
                t1:text;
                slowob,slowoc,slowoa:string;
        begin
                c:=a xor b;
                d:=length(bin(a)) - length(bin(b));
                d1:=length(bin(b)) - length(bin(a));
                e:=0;
                slowob:=naslowo(b,0);
                slowoc:=naslowo(c,0);
                slowoa:=naslowo(a,0);

                gotoxy(x,y);
                assign(t1,'logi\logi_opbit.txt');
                append(t1);
                write('Suma symetryczna (',a,' ');
                cznieb;
                write('XOR');
                typowyk;
                write(' ',b,'):');
                writeln(t1,godzina,' - Suma symetryczna (',a,' XOR ',b,'):');
                gotoxy(x,y+2);
                write('        a = ');
                cznieb;
                write(a);
                typowyk;
                write(t1,'                   a = ',a);
                 for licznik:=1 to 7-length(slowoa) do
                begin
                        write(' ');
                        write(t1,' ');
                end;
                while d1 > 0 do
                        begin
                                write('0');
                                write(t1,'0');
                                d1:=d1-1;
                        end;
                writeln(bin(a));
                writeln(t1,bin(a));

                gotoxy(x,y+4);
                write('        b = ');
                cznieb;
                write(b);
                typowyk;
                write(t1,'                   b = ',b);

                for licznik:=1 to 7-length(slowob) do
                begin
                        write(' ');
                        write(t1,' ');
                end;

                while d > 0 do
                        begin
                                write('0');
                                write(t1,'0');
                                e:=e+1;
                                d:=d-1;
                        end;

                writeln(bin(b));
                writeln(t1,bin(b));
                gotoxy(x,y+6);
                write('Wynik:  ');
                cznieb;
                write(c);
                typowyk;
                write(t1,'           Wynik:  ',c);
                for licznik:=1 to 11-length(slowoc) do
                begin
                        write(' ');
                        write(t1,' ');
                end;
                if c > 0 then
                        begin
                                d:=length(bin(a)) - length(bin(c));
                                e:=0;
                                while d > 0 do
                                        begin
                                                write('0');
                                                write(t1,'0');
                                                e:=e+1;
                                                d:=d-1;
                                        end;
                        end;

                write(bin(c));
                writeln(t1,bin(c));
                close(t1);
        end;

        procedure wizytowka(x,y:integer);
        begin
                gotoxy(x,y);
                writeln(' **************************');
                gotoxy(x,y+1);
                writeln('ษออออออออออออออออออออออออป*');
                gotoxy(x,y+2);
                writeln('บ                        บ*');
                gotoxy(x,y+3);
                writeln('บ                        บ*');
                gotoxy(x,y+4);
                writeln('บ    Twขrca programu     บ*');
                gotoxy(x,y+5);
                writeln('บ                        บ*');
                gotoxy(x,y+6);
                writeln('บ                        บ*');
                gotoxy(x,y+7);
                writeln('ศออออออออออออออออออออออออผ');
                gotoxy(x+4,y+3);
                cznieb;
                write('Mikoaj Stankowiak');
                gotoxy(x+5,y+5);
                write('mik-stan@go2.pl');
                typowyk;

        end;

        procedure autor(x,y:integer);
        begin
                gotoxy(x,y);
                writeln('Nazywam siฉ Mikoaj Stankowiak, program ten jest napisany w jฉzyku oprogramowania');
                gotoxy(x,y+1);
                writeln('Pascal dla celขw edukacyjnych. Jฉzyka Pascal uczฉ siฉ odkฅd uczฉszczam do technikum');
                gotoxy(x,y+2);
                writeln('informatycznego (od wrzenia 2011r). W tym czasie poznaem wiele mniej lub bardziej');
                gotoxy(x,y+3);
                writeln('rozbudowanych komend, aplikacja ta jest najlepszym tego przykadem. Dziฉkujฉ mojemu');
                gotoxy(x,y+4);
                writeln('nauczycielowi mgr Marcinowi Chrขstowi za wiedzฉ, ktขrฅ przyswoiem na lekcjach ');
                gotoxy(x,y+5);
                writeln('programowania strukturalnego. Dziฉki pisaniu kodu ซrudowego tego programu zrozumiaem');
                gotoxy(x,y+6);
                writeln('podstawowe zasady komunikacji z maszynฅ, utrwaliem komendy, ktขre poznaem. Mylฉ, พe');
                gotoxy(x,y+7);
                writeln('w tym przypadku praktyka jest najlepszฅ metodฅ zapamiฉtywania takich partii informacji.');
                gotoxy(x,y+8);
                writeln('Moja dziaalno programistyczna na tym programie siฉ nie zakoไczy, bฉdฉ poszerza');
                gotoxy(x,y+9);
                writeln('swojฅ wiedzฉ w obecnej szkole. Wszelkie sugestie i komentarze pisz na e-mail podany w ');
                gotoxy(x,y+10);
                writeln('module kontakt. Pozdrawiam !');
                gotoxy(x,y+11);
                writeln('');
        end;

        procedure error(sciezka:string);
        var
                a:integer;
                t1,t2:text;
        begin
                assign(t1,'logi\logi_pas_ms.txt');
                append(t1);
                assign(t2, sciezka);
                append(t2);
                writeln(t1);
                writeln(t1,godzina, ' - bluescreen - brak miejsca w konsoli,');
                writeln(t1, '           Zbyt duzo blednie wpisanych zmiennych');
                writeln(t1, '           Zamkniecie glownego modulu');
                writeln(t2);
                writeln(t2,godzina, ' - bluescreen - brak miejsca w konsoli,');
                writeln(t2, '           Zbyt duzo blednie wpisanych zmiennych');
                writeln(t2, '           Zamkniecie modulu');
                close(t1);
                close(t2);

                gotoxy(1,1);
                textbackground(9);
                clrscr;
                gotoxy(30,24);
                textbackground(11);
                textcolor(15);
                writeln('  Nastฅpi bฅd krytyczny: zbyt mao miejsca   ');
                gotoxy(30,25);
                writeln('   w konsoli do poprawnego dziaania moduu.   ');
                gotoxy(30,26);
                writeln('Niestety musisz uruchomi program jeszcze raz. ');
                gotoxy(1,1);

                beep(1000,500);
                delay(500);
                beep(1000,1000);
                readln;
                halt;
        end;

        function pkoncowe:char;
        var
                odp:char;
        begin

                writeln('Wybierz jednฅ z moพliwych opcji: ');
                writeln;
                cznieb;
                write(' J');
                typowyk;
                writeln(' - Powtขrne uruchomienie moduu ');
                cznieb;
                write(' M');
                typowyk;
                writeln(' - Powrขt do menu gขwnego');
                writeln();
                write('Twoja opcja to: ');
                readln(odp);
                pkoncowe:=odp;
        end;

        function pkoncowe_tlo(x,y:integer):char;
        var
                odp:char;
                licznik,licznik2:integer;
        begin
                for licznik:=0 to 9 do
                begin
                        gotoxy(x,y+licznik);
                        write('                                  ');
                end;
                gotoxy(x,y+1);
                writeln('Wybierz jednฅ z moพliwych opcji: ');
                writeln;
                cznieb;
                write(' J');
                typowyk;
                writeln(' - Powtขrne uruchomienie moduu ');
                cznieb;
                write(' M');
                typowyk;
                writeln(' - Powrขt do menu gขwnego');
                writeln();
                write('Twoja opcja to: ');
                readln(odp);
                pkoncowe_tlo:=odp;
        end;

        function pkoncowen_tlo(x,y,czyszczenie:integer):char;
        var
                odp:char;
                licznik,licznik2:integer;
        begin
                for licznik:=0 to 9 do
                begin
                        if czyszczenie = 1 then
                        begin
                                gotoxy(x,y+licznik);
                                write('                                                        ');
                        end;
                        if czyszczenie = 0 then
                        begin
                                gotoxy(x,y+licznik);
                                write('                                   ');
                        end;
                        if czyszczenie = 2 then
                        begin
                                gotoxy(x,y+licznik);
                                write('                                             ');
                        end;
                end;
                gotoxy(x,y+1);
                writeln('Wybierz jednฅ z moพliwych opcji: ');
                writeln;
                cznieb;
                write(' J');
                typowyk;
                writeln(' - Powtขrne uruchomienie moduu');
                cznieb;
                write(' M');
                typowyk;
                writeln(' - Powrขt do menu gขwnego');
                cznieb;
                write(' P');
                typowyk;
                writeln(' - Powrขt do edycji tabeli');
                writeln();
                write('Twoja opcja to: ');
                readln(odp);
                pkoncowen_tlo:=odp;
        end;

        procedure tabelka(x,y,waga,ilosc:integer);
        var
                licznik,cyfra:integer;
                parzysta:boolean;
        begin
                parzysta:=true;
                cyfra:=1;
                if ilosc mod 2 > 0 then
                        begin
                                ilosc:=ilosc+1;
                                parzysta:=false;
                        end;

                gotoxy(x,y-2);
                write('Wypenij nastฉpujฅcฅ tabelฉ: ');
                gotoxy(x+1,y+1);
                niebbial;
                write(' Lp.    ');
                typowyk;

                gotoxy(x,y+2);
                write('____________');
                gotoxy(x+1,y+4);
                niebbial;
                write(' Ocena  ');
                typowyk;

                gotoxy(x,y+5);
                write('____________');
                gotoxy(x+1,y+7);
                niebbial;
                write(' Waga   ');
                textcolor(7);
                textbackground(0);
                gotoxy(x,y+8);
                write('____________');
                gotoxy(x+10,y+9);
                write('|');
                gotoxy(x+10,y+10);
                write('|');
                gotoxy(x+18,y+9);
                write('|');
                gotoxy(x+18,y+10);
                write('|');
                gotoxy(x,y+11);
                write('__________|_______|');
                gotoxy(x+18,y+12);
                write('|');
                gotoxy(x+18,y+13);
                write('|');
                gotoxy(x,y+14);
                write('__________________|');
                gotoxy(x+2,y+13);
                write('Zapisz do pliku');


                x:=x+10;
                for licznik:=1 to ilosc div 2 do
                        begin
                                gotoxy(x,y);
                                write('|   |');
                                gotoxy(x,y+1);
                                write('|   |   ');
                                gotoxy(x,y+2);
                                write('|___|___');
                                gotoxy(x,y+3);
                                write('|   |');
                                gotoxy(x,y+4);
                                write('|   |');
                                gotoxy(x,y+5);
                                write('|___|___');
                                gotoxy(x,y+6);
                                write('|   |');
                                gotoxy(x,y+7);
                                write('|   |');
                                gotoxy(x,y+8);
                                if (licznik=1) then
                                        begin
                                                write('|___|___');
                                                gotoxy(x+2,y+10);
                                                write(#25,'   ',#25);
                                        end
                                else write('|   |');
                                niebcz;
                                gotoxy(x+2,y+1);          //nr oceny 1,3
                                write(cyfra);
                                textcolor(7);
                                textbackground(0);
                                gotoxy(x+2,y+4); //oceny 1,3
                                write('1');
                                gotoxy(x+2,y+7); //waga ocen 1,3
                                write(waga);
                                if (parzysta = true) or (licznik <> ilosc div 2) then
                                begin
                                         gotoxy(x+6,y+1); //gdy ilo ocen jest parzysta 2,4
                                         niebcz;
                                         write(cyfra+1);
                                         textcolor(7);
                                         typowyk;
                                         gotoxy(x+6,y+4); //oceny 2,4
                                         write('1');
                                         gotoxy(x+6,y+7); //waga ocen 2,4
                                         write(waga);
                                end;

                                cyfra:=cyfra+2;
                                x:=x+8;
                        end;
        end;


        procedure tabelka_punkty(x,y,ilosc:integer);
        var
                licznik,cyfra:integer;
                parzysta:boolean;
        begin
                cyfra:=1;
                parzysta:=true;
                if ilosc mod 2 > 0 then
                        begin
                                ilosc:=ilosc+1;
                                parzysta:=false;
                        end;

                gotoxy(x,y-2);
                write('Wypenij nastฉpujฅcฅ tabelฉ: ');
                gotoxy(x+1,y+1);
                niebbial;
                write(' Lp.     ');
                typowyk;

                gotoxy(x,y+2);
                write('_____________');
                gotoxy(x+1,y+4);
                niebbial;
                write(' Max.    ');
                typowyk;

                gotoxy(x,y+5);
                write('_____________');
                gotoxy(x+1,y+7);
                niebbial;
                write(' Zdobyte ');
                typowyk;

                gotoxy(x,y+8);
                write('_____________');
                gotoxy(x+1,y+10);
                niebbial;
                write(' % popr. ');
                typowyk;
                gotoxy(x,y+11);
                write('_______________________');
                gotoxy(x+2,y+13);
                write('Zakoไcz');
                gotoxy(x+13,y+13);
                write('Kontynuuj');

                gotoxy(x,y+11);
                write('_______________');
                gotoxy(x+11,y+12);
                write('|');
                gotoxy(x+11,y+13);
                write('|');
                gotoxy(x,y+14);
                write('___________|___________|');
                gotoxy(x+23,y+12);
                write('|');
                gotoxy(x+23,y+13);
                write('|');



                x:=x+11;
                for licznik:=1 to ilosc div 2 do
                        begin
                                gotoxy(x,y);
                                write('|   |');
                                gotoxy(x,y+1);
                                write('|   |   ');
                                gotoxy(x,y+2);
                                write('|___|___');
                                gotoxy(x,y+3);
                                write('|   |');
                                gotoxy(x,y+4);
                                write('|   |');
                                gotoxy(x,y+5);
                                write('|___|___');
                                gotoxy(x,y+6);
                                write('|   |');
                                gotoxy(x,y+7);
                                write('|   |');
                                gotoxy(x,y+8);
                                write('|___|___');
                                gotoxy(x,y+9);
                                write('|   |');
                                gotoxy(x,y+10);
                                write('|   |');
                                gotoxy(x,y+11);
                                write('|');
                                gotoxy(x+4,y+11);
                                write('|');



                                niebcz;
                                gotoxy(x+2,y+1);          //nr oceny 1,3
                                write(cyfra);
                                typowyk;
                                gotoxy(x+2,y+4); //oceny 1,3
                                write('1');
                                gotoxy(x+2,y+7); //waga ocen 1,3
                                write('1');
                                gotoxy(x+1,y+10); //poprawnosc 1,3
                                niebbial;
                                write('100');
                                czbk;
                                if (parzysta = true) or (licznik <> ilosc div 2) then
                                begin
                                         gotoxy(x+6,y+1); //gdy ilo ocen jest parzysta 2,4
                                         niebcz;
                                         write(cyfra+1);
                                         typowyk;
                                         gotoxy(x+6,y+4); //oceny 2,4
                                         write('1');
                                         gotoxy(x+6,y+7); //waga ocen 2,4
                                         write('1');
                                         niebbial;
                                         gotoxy(x+5,y+10); //poprawnosc 2,4
                                         write('100');
                                         typowyk;
                                end;
                                cyfra:=cyfra+2;
                                x:=x+8;
                        end;
        end;


        procedure podswietlenie(x,y,wartosc,max,aktualne:integer);
        begin
                gotoxy(x-1,y);
                textcolor(0);
                textbackground(7);
                write(' ',wartosc);
                if wartosc < 10 then
                        begin
                                gotoxy(x+1,y);
                                write(' ');

                        end;
                gotoxy(x+2,y);
                typowyk;
                if (wartosc < 10) and (aktualne <> max) then
                        begin
                                write('| ');
                        end
                        else if (aktualne <> max) then write('| ');
                gotoxy(x,y);
        end;

        procedure odswietlenie(x,y,wartosc,max,aktualne:integer);
        begin
                typowyk;
                gotoxy(x-1,y);
                write(' ',wartosc);
                if (wartosc < 10) and (aktualne <> max) then
                        begin
                                gotoxy(x+1,y);
                                write(' | ');
                        end
                        else if (aktualne <> max) then write('| ')
                        else if (wartosc < 10) then write(' ');
                gotoxy(x,y);

        end;

        procedure zaznaczenie(x,y:integer);
        begin
                textcolor(3);
                textbackground(11);
                gotoxy(x-1,y);
                write(' ');
                gotoxy(x+1,y);
                write(' ');
                textcolor(0);
                textbackground(7);
                gotoxy(x,y);
                write(' ');
                gotoxy(x,y);


        end;

        procedure instrukcja(x,y:integer;tekst1,tekst2:string);
        var
                licznik:integer;
        begin
        gotoxy(x,y);
        writeln('Instrukcja:                             ');
        gotoxy(x,y+2);
        writeln(' 1) Wybierz ',tekst1,' za pomocฅ strzaek');
        gotoxy(x,y+3);
        write(' 2) Wybขr zatwierdซ klawiszem ');
        cznieb;
        writeln('ENTER');
        typowyk;
        gotoxy(x,y+4);
        writeln(' 3) Wpisz okrelonฅ warto');
        gotoxy(x,y+5);
        write(' 4) Wybขr zatwierdซ klawiszem ');
        cznieb;
        writeln('ENTER');
        typowyk;
        gotoxy(x,y+7);
        write('Jeพeli chcesz wyj to wcinij ');
        cznieb;
        write('ESCAPE');
        typowyk;
        writeln(' w czasie');
        gotoxy(x,y+8);
        writeln('wyboru ',tekst2);
        end;

        function godzina:string;
        var
                g,m,s,ss:word;
                s1,s2,s3,lp:string;
                lpoj:set of 0..9;
                dwuk:string;
        begin
                lpoj:=[0..9];
                dwuk:=':';
                gettime(g,m,s,ss);
                if g in lpoj then
                        begin
                                str(g,s1);
                                s1:='0'+s1;
                        end
                else str(g,s1);
                if m in lpoj then
                        begin
                                str(m,s2);
                                s2:='0'+s2;
                        end
                else str(m,s2);
                if s in lpoj then
                        begin
                                str(s,s3);
                                s3:='0'+s3;
                        end
                else str(s,s3);
                godzina:=s1+':'+s2+':'+s3;
        end;

        function data:string;
        var
                r,m,d,dt:word;
                s1,s2,s3:string;
                lpoj:set of 0..9;
                dwuk:string;
        begin
                lpoj:=[0..9];
                dwuk:=':';
                getdate(r,m,d,dt);
                str(r,s3);
                if m in lpoj then
                        begin
                                str(m,s2);
                                s2:='0'+s2;
                        end
                else str(m,s2);
                if d in lpoj then
                        begin
                                str(d,s1);
                                s1:='0'+s1;
                        end
                else str(d,s1);
                data:=s1+'-'+s2+'-'+s3;
        end;

        procedure podswietlenie_slowa(x,y:integer;wartosc:string);
        var
                dlugoscs,licznik,plusx:integer;
        begin
                dlugoscs:=length(wartosc);
                plusx:=0;
                typowyk;
                gotoxy(x-1,y);
                write(' ');
                czbk;
                if dlugoscs<=3 then
                        begin
                                for licznik:=1 to 3 do
                                        begin
                                                gotoxy(x+plusx,y);
                                                write(' ');
                                                plusx:=plusx+1;
                                        end;
                        end;
                if dlugoscs>3 then
                        begin
                                for licznik:=1 to dlugoscs do
                                        begin
                                                gotoxy(x+plusx,y);
                                                write(' ');
                                                plusx:=plusx+1;
                                        end;
                        end;
                gotoxy(x,y);
                write(wartosc);
                gotoxy(x,y);
        end;

        procedure odswietlenie_slowa(x,y:integer;wartosc:string);
        var
                dlugoscs,licznik,plusx:integer;
        begin
                dlugoscs:=length(wartosc);
                plusx:=0;
                typowyk;
                gotoxy(x-1,y);
                write(' ');
                if dlugoscs<=3 then
                        begin
                                for licznik:=1 to 3 do
                                        begin
                                                gotoxy(x+plusx,y);
                                                write(' ');
                                                plusx:=plusx+1;
                                        end;
                        end;
                if dlugoscs>3 then
                        begin
                                for licznik:=1 to length(wartosc) do
                                        begin
                                                gotoxy(x+plusx,y);
                                                write(' ');
                                                plusx:=plusx+1;
                                        end;
                        end;
                gotoxy(x,y);
                write(wartosc);
                gotoxy(x,y);

        end;

        procedure zaznaczenie_slowa(x,y,dlugosc:integer);
        begin
                niebbial;
                gotoxy(x-1,y);
                write(' ');
                czbk;
                gotoxy(x,y);
                write(' ');
                typowyk;
                gotoxy(x+1,y);
                if dlugosc = 1 then write('          ');
                if dlugosc = 2 then write('                ');
                if (dlugosc <> 2) and (dlugosc <> 1) then write('                                ');
                czbk;
                gotoxy(x,y);
        end;

        procedure menu_podswietlenie(x,y:integer;slowo:string;zaznaczenie:integer);
        var
                licznik:integer;
                parzyste:set of byte;
        begin
                parzyste:=[2,4,6,8,10,12,14];
                gotoxy(x,y);
                write('                               ');
                gotoxy(x,y+1);
                write('                               ');

                gotoxy(x+15-(length(slowo) div 2),y+1);
                write(slowo);

                gotoxy(x,y+2);
                write('                               ');
                if zaznaczenie <> 0 then
                        begin
                                niebcz;
                                gotoxy(x,y);
                                write(' ');
                                gotoxy(x+30,y);
                                write(' ');
                                gotoxy(x,y+2);
                                write(' ');
                                gotoxy(x+30,y+2);
                                write(' ');
                        end;

                case zaznaczenie of
                        0:typowyk;
                        1:czbk;
                        2:niebbial;
                end;
                gotoxy(x+3,y+1);
                write('                         ');
                gotoxy(x+15-(length(slowo) div 2),y+1);
                write(slowo);

                typowyk;
                gotoxy(x+30,y+2);
        end;

        procedure poziom_listy(x,y,lista,polozenie:integer);
        var
                licznik:integer;
        begin
                czbk;
                gotoxy(x,y);
                write(#31);
                y:=y+1;
                gotoxy(x,y+15);
                write(#30);
                typowyk;
                for licznik:=0 to 14 do
                        begin
                                gotoxy(x,y+licznik);
                                write(' ');
                        end;

                y:=y+((lista-1+polozenie-1));
                for licznik:=0 to 6 do
                        begin
                                gotoxy(x,y+licznik);
                                write('*');
                        end;

        end;

        procedure poziom_listyn(x,y,lista,polozenie:integer);
        var
                licznik:integer;
        begin
                czbk;
                gotoxy(x,y);
                write(#31);
                y:=y+1;
                gotoxy(x,y+15);
                write(#30);
                typowyk;
                for licznik:=0 to 14 do
                        begin
                                gotoxy(x,y+licznik);
                                write(' ');
                        end;

                y:=y+((lista-1+polozenie-1));
                for licznik:=0 to 6 do
                        begin
                                gotoxy(x,y+licznik);
                                write('*');
                        end;
                if (lista = 5) and (polozenie = 4) then
                begin
                        gotoxy(x,y+licznik+1);
                        write('*');
                end;

        end;

        procedure komentarz(x,y,lista:integer);
        var
                licznik:integer;
        procedure komentarz1(x,y:integer);
        begin
                gotoxy(x,y);
                cznieb;
                write('-');
                typowyk;
                write(' wykonuje podstawowe');
                gotoxy(x,y+1);
                write('obliczenia matematyczne');
        end;
        procedure komentarz2(x,y:integer);
        begin
                gotoxy(x,y);
                cznieb;
                write('-');
                typowyk;
                write(' przelicza wybrane');
                gotoxy(x,y+1);
                write('jednostki na inne');
        end;
        procedure komentarz3(x,y:integer);
        begin
                gotoxy(x,y);
                cznieb;
                write('-');
                typowyk;
                write(' wykonuje podstawowe');
                gotoxy(x,y+1);
                write('obliczenia logiczne');
        end;
        procedure komentarz4(x,y:integer);
        begin
                gotoxy(x,y);
                cznieb;
                write('-');
                typowyk;
                write(' pozwala zakodowa');
                gotoxy(x,y+1);
                write('ciฅg znakขw');
        end;
        procedure komentarz5(x,y:integer);
        begin
                gotoxy(x,y);
                cznieb;
                write('-');
                typowyk;
                write(' oblicza redniฅ ocen');
                gotoxy(x,y+1);
                write('biorฅc pod uwagฉ wagi');
                gotoxy(x,y+2);
                write('ocen');
        end;
        procedure komentarz6(x,y:integer);
        begin
                gotoxy(x,y);
                cznieb;
                write('-');
                typowyk;
                write(' podaje ocenฉ na ');
                gotoxy(x,y+1);
                write('podstawie iloci');
                gotoxy(x,y+2);
                write('zdobytych punktขw');
        end;
        procedure komentarz7(x,y:integer);
        begin
                gotoxy(x,y);
                cznieb;
                write('-');
                typowyk;
                write(' pozwala przejrze ');
                gotoxy(x,y+1);
                write('dziaania wykonywane');
                gotoxy(x,y+2);
                write('przez program');
        end;
        procedure komentarz8(x,y:integer);
        begin
                gotoxy(x,y);
                cznieb;
                write('-');
                typowyk;
                write(' kilka sขw o');
                gotoxy(x,y+1);
                write('programicie');
        end;
        procedure komentarz9(x,y:integer);
        begin
                gotoxy(x,y);
                cznieb;
                write('-');
                typowyk;
                write(' wizytขwka od autora');
        end;
        procedure komentarz10(x,y:integer);
        begin
                gotoxy(x,y);
                cznieb;
                write('-');
                typowyk;
                write(' pozwala powtขrnie');
                gotoxy(x,y+1);
                write('wpisa haso');
        end;
        begin
                for licznik:=0 to 15 do
                        begin
                                gotoxy(x,y+licznik);
                                write('                       ');
                        end;
                if lista = 1 then
                        begin
                                komentarz1(x,y);
                                y:=y+4;
                                komentarz2(x,y);
                                y:=y+4;
                                komentarz3(x,y);
                                y:=y+4;
                                komentarz4(x,y);
                        end;
                if lista = 2 then
                        begin
                                komentarz2(x,y);
                                y:=y+4;
                                komentarz3(x,y);
                                y:=y+4;
                                komentarz4(x,y);
                                y:=y+4;
                                komentarz5(x,y);
                        end;
                if lista = 3 then
                        begin
                                komentarz3(x,y);
                                y:=y+4;
                                komentarz4(x,y);
                                y:=y+4;
                                komentarz5(x,y);
                                y:=y+4;
                                komentarz6(x,y);
                        end;
                if lista = 4 then
                        begin
                                komentarz4(x,y);
                                y:=y+4;
                                komentarz5(x,y);
                                y:=y+4;
                                komentarz6(x,y);
                                y:=y+4;
                                komentarz7(x,y);
                        end;
                if lista = 5 then
                        begin
                                komentarz5(x,y);
                                y:=y+4;
                                komentarz6(x,y);
                                y:=y+4;
                                komentarz7(x,y);
                                y:=y+4;
                                komentarz8(x,y);
                        end;
                if lista = 6 then
                        begin
                                komentarz6(x,y);
                                y:=y+4;
                                komentarz7(x,y);
                                y:=y+4;
                                komentarz8(x,y);
                                y:=y+4;
                                komentarz9(x,y);
                        end;
                 if lista = 7 then
                        begin
                                komentarz1(x,y);
                                y:=y+4;
                                komentarz10(x,y);
                                y:=y+4;
                                komentarz8(x,y);
                                y:=y+4;
                                komentarz9(x,y);
                        end;

        end;

        function naslowo(liczba:extended;dokl:byte):string;
        begin
                str(liczba:1:dokl,naslowo);
        end;


        function Zaokraglij(Liczba: extended; miejsca: Byte): extended;  //funkcja z internetu
        var
                Ile,licznik: Integer;
        begin
                Ile := 1;
                for licznik := 1 to Miejsca do
                Ile := Ile * 10;
                Zaokraglij := Round(Liczba * Ile) / Ile;
        end;


begin
end.
