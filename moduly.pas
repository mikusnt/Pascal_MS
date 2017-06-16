unit moduly;
interface
        uses
                crt,
                dos,
                pas_ms,
                prze_jedn,
                wewnetrzny;
        procedure kalk;
        procedure op_bit;
        procedure przel;
        procedure kd;
        procedure srednia;
        procedure punkty;
        procedure przeglad;

implementation
        procedure kalk;


        var
                a,b:extended;
                odp:char;
                c,d:shortint;
                e,f,licznik:longint;
                t1:text;
                powtorzenie:boolean;

        label
                kalk1,
                kalk2,
                poczatek,
                koniec,
                zamkniecie,
                ponowne;

        begin
                powtorzenie:=false;
                poczatek:
                clrscr;

                writeln('浜様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様融');
                writeln('�  ____  __        __   __          __          __                 �');
                writeln('� |    |/ _|____  |  | |  | ____ __|  | _____ _/  |_  ___________  �');
                writeln('� |      < \__  \ |  | |  |/ /  |  \  | \__  \\   __\/  _ \_  __ \ �');
                writeln('� |    |  \ / __ \|  |_|    <|  |  /  |__/ __ \|  | (  <_> )  | \/ �');
                writeln('� |____|__ (____  /____/__|_ \____/|____(____  /__|  \____/|__|    �');
                writeln('�         \/    \/          \/               \/                    �');
                writeln('藩様様様様様様�   Miko�aj Stankowiak, 09.08.2012r   浜様様様様様様夕');
                writeln('              �                                     �                  ');
                writeln('   v. 2.03    藩様様様様様様様様様様様様様様様様様様�               ');

                cznieb;
                gotoxy(4,10);
                write('v. 2.03');
                gotoxy(17,8);
                write(#01);
                gotoxy(51,8);
                write(#01);
                typowyk;
                gotoxy(1,12);

                if powtorzenie = false then
                begin
                if fsearch('logi\logi_kalk.txt','') = '' then
                        begin
                                writeln('Brakuje pliku raportowego, w�a�nie go wygenerowa�em.');
                                assign(t1,'logi\logi_kalk.txt');
                                rewrite(t1);
                                writeln(t1, 'Ten plik przechowuje logi modulu Kalkulator');
                                writeln(t1,'Data i czas wygenerowania tego pliku: ',data, ', ',godzina );
                                writeln(t1,'Autor programu: Mikolaj Stankowiak');
                                close(t1);
                                writeln;
                        end;

                assign(t1,'logi\logi_kalk.txt');
                append(t1);
                writeln(t1);
                writeln(t1);
                writeln(t1);
                writeln(t1,'Uruchomienie modulu Kalkulator');
                writeln(t1,'Aktualna data i czas: ',data,', ',godzina );
                writeln(t1,'Brak mozliwosci wyswietlenia polskich znakow !');
                writeln(t1,'Dane moga byc nieczytelne.');
                writeln(t1);
                close(t1);
                end;

                powtorzenie:=false;
                writeln('Dost�pne s� nast�puj�ce dzia�ania: ');
                writeln;
                cznieb;
                write(' 1');
                typowyk;
                writeln(') Dodawanie');
                cznieb;
                write(' 2');
                typowyk;
                writeln(') Odejmowanie');
                cznieb;
                write(' 3');
                typowyk;
                writeln(') Mno�enie');
                cznieb;
                write(' 4');
                typowyk;
                writeln(') Dzielenie');
                cznieb;
                write(' 5');
                typowyk;
                writeln(') Dielenie ca�kowite/modulo');
                cznieb;
                write(' 6');
                typowyk;
                writeln(') Pot�gowanie');
                cznieb;
                write(' 7');
                typowyk;
                writeln(') Pierwiastkowanie');
                cznieb;
                write(' 8');
                typowyk;
                writeln(') Tryb rozszerzony');
                writeln();
                kalk1:
                write('Wpisz ilo�� miejsc po przecinku: ');
                readln(c);
                if (c > 17) then
                        begin
                                writeln('Warto�� musi by� mniejsza.');
                                writeln();
                                goto kalk1;
                        end;

                writeln();
                kalk2:
                write('Wybierz numer dia�ania: ');
                readln(d);
                if (d <= 0) then
                        begin
                                writeln('Warto�� musi by� wi�ksza od zera.');
                                writeln();
                                goto kalk2;
                        end;

                if (d > 8) then
                        begin
                                writeln('Nie ma takiego dzia�ania.');
                                writeln();
                                goto kalk2;
                        end;

                writeln();


                case d of
                        1:
                                begin
                                        write('Wybra�e� dodawanie, podal liczb� a: ');
                                        readln(a);
                                        writeln();
                                        write('Podaj liczb� b: ');
                                        readln(b);
                                        writeln();
                                        writeln('Suma liczb ',a:1:c, ' i ',b:1:c, ' jest r�wna ', a+b:1:c, '.');
                                        write(a:1:c,' ');
                                        cznieb;
                                        write('+');
                                        typowyk;
                                        write(' ',b:1:c,' ');
                                        cznieb;
                                        write('=');
                                        typowyk;
                                        writeln(' ',a+b:1:c);

                                        assign(t1,'logi\logi_kalk.txt');
                                        append(t1);
                                        writeln(t1,godzina,' - Obliczenie dzialania:');
                                        writeln(t1,'           ',a:1:c,' + ',b:1:c,' = ',a+b:1:c);
                                        close(t1);

                                        writeln();
                                end;

                        2:
                                begin
                                        write('Wybra�e� odejmowanie, podal liczb� a: ');
                                        readln(a);
                                        writeln();
                                        write('Podaj liczb� b: ');
                                        readln(b);
                                        writeln();
                                        writeln('R⊂nica liczb ',a:1:c, ' i ',b:1:c, ' jest r�wna ', a-b:1:c, '.');
                                        write(a:1:c,' ');
                                        cznieb;
                                        write('-');
                                        typowyk;
                                        write(' ',b:1:c,' ');
                                        cznieb;
                                        write('=');
                                        typowyk;
                                        writeln(' ',a-b:1:c);

                                        assign(t1,'logi\logi_kalk.txt');
                                        append(t1);
                                        writeln(t1,godzina,' - Obliczenie dzialania:');
                                        writeln(t1,'           ',a:1:c,' - ',b:1:c,' = ',a-b:1:c);
                                        close(t1);

                                        writeln();
                                end;

                        3:
                                begin
                                        write('Wybra�e� mno�enie, podal liczb� a: ');
                                        readln(a);
                                        writeln();
                                        write('Podaj liczb� b: ');
                                        readln(b);
                                        writeln();
                                        writeln('iloczyn liczb ',a:1:c, ' i ',b:1:c, ' jest r�wny ', a*b:1:c, '.');
                                        write(a:1:c,' ');
                                        cznieb;
                                        write('*');
                                        typowyk;
                                        write(' ',b:1:c,' ');
                                        cznieb;
                                        write('=');
                                        typowyk;
                                        writeln(' ',a*b:1:c);

                                        assign(t1,'logi\logi_kalk.txt');
                                        append(t1);
                                        writeln(t1,godzina,' - Obliczenie dzialania:');
                                        writeln(t1,'           ',a:1:c,' * ',b:1:c,' = ',a*b:1:c);
                                        close(t1);

                                        writeln();
                                end;

                        4:
                                begin
                                        write('Wybra�e� dzielenie, podal liczb� a: ');
                                        readln(a);
                                        writeln();
                                        write('Podaj liczb� b: ');
                                        readln(b);
                                        writeln();
                                        writeln('Iloraz liczb ',a:1:c, ' i ',b:1:c, ' jest r�wny ', a/b:1:c, '.');
                                        write(a:1:c,' ');
                                        cznieb;
                                        write('/');
                                        typowyk;
                                        write(' ',b:1:c,' ');
                                        cznieb;
                                        write('=');
                                        typowyk;
                                        writeln(' ',a/b:1:c);

                                        assign(t1,'logi\logi_kalk.txt');
                                        append(t1);
                                        writeln(t1,godzina,' - Obliczenie dzialania:');
                                        writeln(t1,'           ',a:1:c,' / ',b:1:c,' = ',a/b:1:c);
                                        close(t1);

                                        writeln();
                                end;

                        5:
                                begin
                                        writeln('Wybra�e� dzielenie ca�kowite/modulo.');
                                        writeln();
                                        write('Musisz poda� liczby ca�kowite, podaj liczb� a: ');
                                        readln(a);
                                        e:=trunc(a);
                                        if a <> e then writeln('Poda�e� mi liczb� z u�amkiem, musia�em zaokr�gli�...');
                                        writeln();
                                        write('Podaj liczb� b: ');
                                        readln(b);
                                        f:=trunc(b);
                                        if b <> f then writeln('Poda�e� mi liczb� z u�amkiem, musia�em zaokr�gli�...');
                                        writeln();
                                        writeln('Iloraz ca�kowity liczb ',e, ' i ',f, ' jest r�wny ', e div f, ', reszta z dzielenia to ',e mod f, '.');
                                        write(e,' ');
                                        cznieb;
                                        write('div');
                                        typowyk;
                                        write(' ',f,' ');
                                        cznieb;
                                        write('=');
                                        typowyk;
                                        writeln(' ',e div f);

                                        write(e,' ');
                                        cznieb;
                                        write('mod');
                                        typowyk;
                                        write(' ',f,' ');
                                        cznieb;
                                        write('=');
                                        typowyk;
                                        writeln(' ',e mod f);

                                        assign(t1,'logi\logi_kalk.txt');
                                        append(t1);
                                        writeln(t1,godzina,' - Obliczenie dzialania:');
                                        writeln(t1,'           ',e,' div ',f,' = ',e div f);
                                        writeln(t1,'           ',e,' mod ',f, ' = ',e mod f);
                                        close(t1);

                                        writeln();
                                end;

                        6:
                                begin
                                        write('Wybra�e� pot�gowanie, podal podstaw� pot�gi: ');
                                        readln(a);
                                        writeln;
                                        write('Podaj wyk�adnik pot�gi:');
                                        readln(b);
                                        f:=trunc(b);
                                        if b <> f then writeln('Poda�e� mi liczb� z u�amkiem, musia�em zaokr�gli�...');
                                        b:=1;

                                        assign(t1,'logi\logi_kalk.txt');
                                        append(t1);

                                        if f >=0 then
                                        begin
                                                for licznik:=1 to f do b:=b*a;
                                                writeln();
                                                writeln('Pot�ga liczby ',a:1:c,' o wyk�. ',f,' jest r�wna ', b:1:c, '.');
                                                write(a:1:c,' ');
                                                cznieb;
                                                write('^');
                                                typowyk;
                                                write(' ',f,' ');
                                                cznieb;
                                                write('=');
                                                typowyk;
                                                writeln(' ',b:1:c);
                                                writeln(t1,godzina,' - Obliczenie dzialania:');
                                                writeln(t1,'           ',a:1:c,' ^ ',f,'  = ',b:1:c);
                                                close(t1);
                                        end
                                        else
                                        begin
                                                for licznik:=f to -1 do b:=b*a;
                                                writeln();
                                                writeln('Pot�ga liczby ',a:1:c,' o wyk�. ',f,' jest r�wna ',1/b:1:c, '.');
                                                write(a:1:c,' ');
                                                cznieb;
                                                write('^');
                                                typowyk;
                                                write(' ',f,' ');
                                                cznieb;
                                                write('=');
                                                typowyk;
                                                writeln(' ',1/b:1:c);
                                                writeln(t1,godzina,' - Obliczenie dzialania:');
                                                writeln(t1,'           ',a:1:c,' ^ ',f,'  = ',1/b:1:c);
                                                close(t1);
                                        end;

                                        writeln();
                                        end;

                        7:
                                begin
                                        write('Wybra�e� pierwiastkowanie, podal liczb� a: ');
                                        readln(a);
                                        writeln();
                                        writeln('Pierwiastek liczby ',a:1:c,' jest r�wny ', sqrt(a):1:c, '.');

                                        assign(t1,'logi\logi_kalk.txt');
                                        append(t1);
                                        writeln(t1,godzina,' - Obliczenie dzialania:');
                                        writeln(t1,'           Pierwiastek z ',a:1:c,' jest rowny ',sqrt(a):1:c);
                                        close(t1);

                                        writeln();
                                end;
                         8:
                                begin
                                        wczytywanie_sz(36,36,20);
                                        assign(t1,'logi\logi_kalk.txt');
                                        append(t1);
                                        writeln(t1,godzina,' - Uruchomienie trybu rozszerzonego');
                                        close(t1);
                                        if kalk_rozszerzony = true then
                                        begin
                                                assign(t1,'logi\logi_kalk.txt');
                                                append(t1);
                                                goto ponowne;
                                        end
                                        else
                                        begin
                                                assign(t1,'logi\logi_kalk.txt');
                                                append(t1);
                                                goto zamkniecie;
                                        end;
                                end;
                        end;

                writeln;
                writeln;
                odp:=pkoncowe;

                assign(t1,'logi\logi_kalk.txt');
                append(t1);
                odp:=upcase(odp);
                if (odp = 'M') then
                        begin
                                zamkniecie:
                                wymazywanie4(27,34);
                                zam_modulu(36,36,30);
                                writeln(t1,godzina, ' - Zamkniecie modulu');
                                close(t1);
                                goto koniec;
                        end;

                ponowne:
                wymazywanie4(27,34);
                przel_modulu(36,36,20);
                powtorzenie:=true;
                writeln(t1);
                writeln(t1,godzina, ' - Uruchomienie ponowne modulu');
                writeln(t1);
                close(t1);
                goto poczatek;
                koniec:
        end;

        procedure op_bit;
        var
                a,b,c,x,y,licznik:integer;
                odp:char;
                t1:text;
                powtorzenie:boolean;
        label
                op_bit1,poczatek,koniec,kotwica2,kotwica21,kotwica3,
                kotwica31,kotwica4,kotwica41,kotwica5,kotwica51,kotwica6,kotwica61;

        begin
                powtorzenie:=false;
                poczatek:

                writeln('浜様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様融 ');
                writeln('�  _____                           _                      _     _ _             _      � ');
                writeln('� |  _  |                         (_)                    | |   (_) |           | |     � ');
                writeln('� | | | |_ __   ___ _ __ __ _  ___ _  ___   _ __   __ _  | |__  _| |_ __ _  ___| |__   � ');
                writeln('� | | | | `_ \ / _ \ `__/ _` |/ __| |/ _ \ | `_ \ / _` | | `_ \| | __/ _` |/ __| `_ \  � ');
                writeln('� \ \_/ / |_) |  __/ | | (_| | (__| |  __/ | | | | (_| | | |_) | | |_ (_| | (__| | | | � ');
                writeln('�  \___/| .__/ \___|_|  \__,_|\___| |\___| |_| |_|\__,_| |_.__/|_|\__\__,_|\___|_| |_| � ');
                writeln('�       | |                      _/ |                                                  � ');
                writeln('�       |_|                     |__/                                                   � ');
                writeln('藩様様様様様様様様様様様�   Miko�aj Stankowiak, 09.08.2012r   浜様様様様様様様様様様様夕 ');
                writeln('                        �                                     �                                     ');
                writeln('                        藩様様様様様様様様様様様様様様様様様様�                             ');

                cznieb;
                gotoxy(11,12);
                write('v. 2.03');
                gotoxy(27,10);
                write(#01);
                gotoxy(61,10);
                write(#01);
                typowyk;
                gotoxy(1,13);
                x:=60;
                y:=31;
                licznik:=0;


                if powtorzenie = false then
                begin
                        if fsearch('logi\logi_opbit.txt','') = '' then
                                begin
                                        writeln('Brakuje pliku raportowego, w�a�nie go wygenerowa�em.');
                                        assign(t1,'logi\logi_opbit.txt');
                                        rewrite(t1);
                                        writeln(t1, 'Ten plik przechowuje logi modulu Operacji na Bitach');
                                        writeln(t1,'Data i czas wygenerowania tego pliku: ',data, ', ',godzina );
                                        writeln(t1,'Autor programu: Mikolaj Stankowiak');
                                        close(t1);
                                        writeln;
                                end;

                        assign(t1,'logi\logi_opbit.txt');
                        append(t1);
                        writeln(t1);
                        writeln(t1);
                        writeln(t1);
                        writeln(t1,'Uruchomienie modulu Operacje na bitach');
                        writeln(t1,'Aktualna data i czas: ',data,', ',godzina );
                        writeln(t1,'Brak mozliwosci wyswietlenia polskich znakow !');
                        writeln(t1,'Dane moga byc nieczytelne.');
                        writeln(t1);
                        close(t1);
                end;

                powtorzenie:=false;


                writeln;
                writeln('Dost�pne s� nast�puj�ce dzia�ania:');
                writeln;
                cznieb;
                write(' 1');
                typowyk;
                writeln(')Przesuni�cie w lewo');
                cznieb;
                write(' 2');
                typowyk;
                writeln(')Przesuni�cie w prawo');
                cznieb;
                write(' 3');
                typowyk;
                writeln(')Koniukcja (AND)');
                cznieb;
                write(' 4');
                typowyk;
                writeln(')Alternatywa (OR)');
                cznieb;
                write(' 5');
                typowyk;
                writeln(')Suma Symetryczna (XOR)');
                writeln();
                writeln('Obs�ugiwane liczby w zakresie od 1 do 1023.');
                writeln('Obs�ugiwany wsp��czynnik przesuni�cia L/P od 1 do 10.');
                writeln;

                op_bit1:
                if licznik = 7 then error('logi\logi_opbit.txt');
                 write('Wybierz numer dzia�ania: ');
                 readln(a);
                 if a <= 0 then
                        begin
                                writeln('Warto�� musi by� wi�ksza od zera.');
                                writeln();
                                licznik:=licznik+1;
                                goto op_bit1;
                        end;

                if a > 5 then
                        begin
                                writeln('Nie ma takiego dzia�ania.');
                                writeln();
                                licznik:=licznik+1;
                                goto op_bit1;
                        end;

                writeln();

                case a of
                        1:
                                begin
                                        kotwica2:
                                        write('Wybra�e� przesuni�cie w lewo, podaj liczb� a: ');
                                        readln(b);
                                        if (b > 1023) or (b < 1) then
                                                begin
                                                        if licznik = 7 then error('logi\logi_opbit.txt');;
                                                        writeln;
                                                        writeln('Poda�e� z�� liczb� !');
                                                        writeln;
                                                        licznik:=licznik+1;
                                                        goto kotwica2;
                                                end;
                                        writeln;

                                        kotwica21:
                                        write('Podaj wsp��czynnik przesuni�cia: ');
                                        readln(c);
                                        if (c > 10) or (c < 1) then
                                                begin
                                                        if licznik = 7 then error('logi\logi_opbit.txt');
                                                        writeln;
                                                        writeln('Poda�e� z�� liczb� !');
                                                        writeln;
                                                        licznik:=licznik+1;
                                                        goto kotwica21;
                                                end;
                                        writeln;
                                        przes_lewo(b,c,x,y);
                                        writeln;
                                end;
                        2:
                                begin
                                        kotwica3:
                                        write('Wybra�e� przesuni�cie w prawo, podaj liczb� a: ');
                                        readln(b);
                                        if (b > 1023) or (b < 1) then
                                                begin
                                                        if licznik = 7 then error('logi\logi_opbit.txt');
                                                        writeln;
                                                        writeln('Poda�e� z�� liczb� !');
                                                        writeln;
                                                        licznik:=licznik+1;
                                                        goto kotwica3;
                                                end;
                                        writeln;
                                        kotwica31:
                                        write('Podaj wsp��czynnik przesuni�cia: ');
                                        readln(c);
                                        if (c > 10) or (c < 1) then
                                                begin
                                                        if licznik = 7 then error('logi\logi_opbit.txt');
                                                        writeln;
                                                        writeln('Poda�e� z�� liczb� !');
                                                        writeln;
                                                        licznik:=licznik+1;
                                                        goto kotwica31;
                                                end;
                                        writeln;
                                        przes_prawo(b,c,x,y);
                                        writeln;
                                end;
                        3:
                                begin
                                        kotwica4:
                                        write('Wybra�e� koniukcj� (AND), podaj liczb� a: ');
                                        readln(b);
                                        if (b > 1023) or (b < 1) then
                                                begin
                                                        if licznik = 7 then error('logi\logi_opbit.txt');
                                                        writeln;
                                                        writeln('Poda�e� z�� liczb� !');
                                                        writeln;
                                                        licznik:=licznik+1;
                                                        goto kotwica4;
                                                end;
                                        writeln;
                                        kotwica41:
                                        write('Podaj liczb� b: ');
                                        readln(c);
                                        if (c > 1023) or (c < 1) then
                                                begin
                                                        if licznik = 7 then error('logi\logi_opbit.txt');
                                                        writeln;
                                                        writeln('Poda�e� z�� liczb� !');
                                                        writeln;
                                                        licznik:=licznik+1;
                                                        goto kotwica41;
                                                end;
                                        writeln;
                                        koniukcja(b,c,x,y);
                                        writeln;
                                end;
                        4:
                                begin
                                        kotwica5:
                                        write('Wybra�e� alternatyw� (OR), podaj liczb� a: ');
                                        readln(b);
                                        if (b > 1023) or (b < 1) then
                                                begin
                                                        if licznik = 7 then error('logi\logi_opbit.txt');
                                                        writeln;
                                                        writeln('Poda�e� z�� liczb� !');
                                                        writeln;
                                                        licznik:=licznik+1;
                                                        goto kotwica5;
                                                end;
                                        writeln;
                                        kotwica51:
                                        write('Podaj liczb� b: ');
                                        readln(c);
                                        if (c > 1023) or (c < 1) then
                                                begin
                                                        if licznik = 7 then error('logi\logi_opbit.txt');
                                                        writeln;
                                                        writeln('Poda�e� z�� liczb� !');
                                                        writeln;
                                                        licznik:=licznik+1;
                                                        goto kotwica51;
                                                end;
                                        writeln;
                                        alternatywa(b,c,x,y);
                                        writeln;
                                end;
                        5:
                                begin
                                        kotwica6:
                                        write('Wybra�e� sum� symetryczn� (XOR), podaj liczb� a: ');
                                        readln(b);
                                        if (b > 1023) or (b < 1) then
                                                begin
                                                        if licznik = 7 then error('logi\logi_opbit.txt');
                                                        writeln;
                                                        writeln('Poda�e� z�� liczb� !');
                                                        writeln;
                                                        licznik:=licznik+1;
                                                        goto kotwica6;
                                                end;
                                        writeln;
                                        kotwica61:
                                        write('Podaj liczb� b: ');
                                        readln(c);
                                        if (c > 1023) or (c < 1) then
                                                begin
                                                        if licznik = 7 then error('logi\logi_opbit.txt');
                                                        writeln;
                                                        writeln('Poda�e� z�� liczb� !');
                                                        writeln;
                                                        licznik:=licznik+1;
                                                        goto kotwica61;
                                                end;
                                        writeln;
                                        sumas(b,c,x,y);
                                        writeln;
                                end;
                        end;
                writeln;
                writeln;
                odp:=pkoncowe;

                assign(t1,'logi\logi_opbit.txt');
                append(t1);
                odp:=upcase(odp);
                if (odp = 'M') then
                        begin
                                wymazywanie4(27,34);
                                zam_modulu(36,36,30);
                                writeln(t1);
                                writeln(t1,godzina, ' - Zamkniecie modulu');
                                close(t1);
                                goto koniec;
                        end;
                wymazywanie4(27,34);
                przel_modulu(36,36,20);
                powtorzenie:=true;
                writeln(t1);
                writeln(t1,godzina, ' - Uruchomienie ponowne modulu');
                writeln(t1);
                close(t1);
                goto poczatek;

                koniec:

        end;

        procedure przel;
        label
                poczatek,
                wybieranie1,
                wybieranie2,
                tabela,
                koniec;
        var
                a,b,x,y,z,licznik:integer;
                odp:char;
                t1,t2:text;
                powtorzenie:boolean;

        begin
                powtorzenie:=false;
                poczatek:
                clrscr;

                writeln('浜様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様� ');
                writeln('�  _____              _ _                _ _        _          _                 _       _      � ');
                writeln('� |  __ \            | (_)              (_) |      (_)        | |               | |     | |     � ');
                writeln('� | |__) | __ _______| |_  ___ _____ __  _| | __    _  ___  __| |_ __   ___  ___| |_ ___| | __  � ');
                writeln('� |  ___/ `__|_  / _ \ | |/ __|_  / `_ \| | |/ /   | |/ _ \/ _` | `_ \ / _ \/ __| __/ _ \ |/ /  � ');
                writeln('� | |   | |   / /  __/ | | (__ / /| | | | |   <    | |  __/ (_| | | | | (_) \__ \ ||  __/   <   � ');
                writeln('� |_|   |_|  /___\___|_|_|\___/___|_| |_|_|_|\_\   | |\___|\__,_|_| |_|\___/|___/\__\___|_|\_\  � ');
                writeln('�                                                 _/ |                                          � ');
                writeln('�                                                |__/                                           � ');
                writeln('�                                                                                               � ');
                writeln('藩様様様様様様様様様様様様様融   Miko�aj Stankowiak, 09.08.2012r   浜様様様様様様様様様様様様様夕 ');
                writeln('                             �                                     �                                ');
                writeln('                             藩様様様様様様様様様様様様様様様様様様�                                ');

                cznieb;
                gotoxy(11,13);
                write('v. 2.03');
                gotoxy(32,11);
                write(#01);
                gotoxy(66,11);
                write(#01);
                typowyk;
                gotoxy(1,14);

                if powtorzenie = false then
                begin
                        if fsearch('logi\logi_pj.txt','') = '' then
                                begin
                                        writeln('Brakuje pliku raportowego, w�a�nie go wygenerowa�em.');
                                        assign(t1,'logi\logi_pj.txt');
                                        rewrite(t1);
                                        writeln(t1, 'Ten plik przechowuje logi modulu Przelicznik Jednostek');
                                        writeln(t1,'Data i czas wygenerowania tego pliku: ',data, ', ',godzina );
                                        writeln(t1,'Autor programu: Mikolaj Stankowiak');
                                        close(t1);
                                        writeln;
                                end;

                        assign(t1,'logi\logi_pj.txt');
                        append(t1);
                        writeln(t1);
                        writeln(t1);
                        writeln(t1);
                        writeln(t1,'Uruchomienie modulu Przelicznik Jednostek');
                        writeln(t1,'Aktualna data i czas: ',data,', ',godzina );
                        writeln(t1,'Brak mozliwosci wyswietlenia polskich znakow !');
                        writeln(t1,'Dane moga byc nieczytelne.');
                        writeln(t1);
                        close(t1);
                end;

                powtorzenie:=false;

                writeln('Dost�pne s� przeliczenia:');
                writeln;
                cznieb;
                write(' 1');
                typowyk;
                writeln(') Jednostki d�ugo�ci');
                cznieb;
                write(' 2');
                typowyk;
                writeln(') Jednostki pola');
                cznieb;
                write(' 3');
                typowyk;
                writeln(') Jednostki obj�to�ci');
                cznieb;
                write(' 4');
                typowyk;
                writeln(') Jednostki czasu');
                cznieb;
                write(' 5');
                typowyk;
                writeln(') Jednostki pr�dko�ci');
                cznieb;
                write(' 6');
                typowyk;
                writeln(') Jednostki temperatury');
                cznieb;
                write(' 7');
                typowyk;
                writeln(') Jednostki mocy');
                cznieb;
                write(' 8');
                typowyk;
                writeln(') Jednostki masy');
                cznieb;
                write(' 9');
                typowyk;
                writeln(') Jednostki rozmiaru danych');
                cznieb;
                write(' 10');
                typowyk;
                writeln(') Przedrostki SI');
                writeln;
                x:=50;
                y:=15;
                z:=2*y;

                wybieranie1:
                if z > 48 then
                        begin
                                error('logi\logi_pj.txt');;
                        end;
                write('Wpisz ilo�� miejsc po przecinku: ');
                readln(a);
                if (a <= 0) then
                        begin
                                writeln('Warto�� musi by� wi�ksza od zera.');
                                writeln();
                                z:=z+3;
                                goto wybieranie1;
                        end;
                if (a > 10) then
                        begin
                                writeln('Warto�� musi by� mniejsza.');
                                writeln();
                                z:=z+3;
                                goto wybieranie1;
                        end;

                writeln;
                wybieranie2:
                if z > 48 then error('logi\logi_pj.txt');
                write('Wybierz numer przeliczenia: ');
                readln(b);
                if (b <= 0) then
                        begin
                                writeln('Warto�� musi by� wi�ksza od zera.');
                                writeln();
                                z:=z+3;
                                goto wybieranie2;
                        end;

                if (b > 10) then
                        begin
                                writeln('Nie ma takiego przeliczenia.');
                                writeln();
                                z:=z+3;
                                goto wybieranie2;
                        end;
                tabela:
                assign(t1,'logi\logi_pj.txt');
                append(t1);
                case b of
                        1:
                                begin
                                        if powtorzenie = false then
                                        begin
                                                writeln('Wybra�e� przeliczanie w jednostkach d�ugo�ci.');
                                                writeln(t1,godzina,' - Wybranie przeliczenia w jednostkach dlugosci');
                                        end;
                                        close(t1);
                                        przel_dlugosc(x,y,a);
                                end;
                        2:
                                begin
                                        if powtorzenie = false then
                                        begin
                                                writeln('Wybra�e� przeliczanie w jednostkach powierzchni.');
                                                writeln(t1,godzina,' - Wybranie przeliczenia w jednostkach powierzchni');
                                        end;
                                        close(t1);
                                        przel_powierzchnia(x,y,a);
                                end;
                        3:
                                begin
                                        if powtorzenie = false then
                                        begin
                                                writeln('Wybra�e� przeliczanie w jednostkach obj�to�ci.');
                                                writeln(t1,godzina,' - Wybranie przeliczenia w jednostkach obj�to�ci');
                                        end;
                                        close(t1);
                                        przel_objetosc(x,y,a);
                                end;
                        4:
                                begin
                                        if powtorzenie = false then
                                        begin
                                                writeln('Wybra�e� przeliczanie w jednostkach czasu.');
                                                writeln(t1,godzina,' - Wybranie przeliczenia w jednostkach czasu');
                                        end;
                                        close(t1);
                                        przel_czas(x,y,a);
                                end;
                        5:
                                begin
                                        if powtorzenie = false then
                                        begin
                                                writeln('Wybra�e� przeliczanie w jednostkach pr�dko�ci.');
                                                writeln(t1,godzina,' - Wybranie przeliczenia w jednostkach pr�dko�ci');
                                        end;
                                        close(t1);
                                        przel_predkosc(x,y,a);
                                end;
                        6:
                                begin
                                        if powtorzenie = false then
                                        begin
                                                writeln('Wybra�e� przeliczanie w jednostkach temperatury.');
                                                writeln(t1,godzina,' - Wybranie przeliczenia w jednostkach temperatury');
                                        end;
                                        close(t1);
                                        przel_temperatura(x,y,a);
                                end;
                        7:
                                begin
                                        if powtorzenie = false then
                                        begin
                                                writeln('Wybra�e� przeliczanie w jednostkach mocy.');
                                                writeln(t1,godzina,' - Wybranie przeliczenia w jednostkach mocy');
                                        end;
                                        close(t1);
                                        przel_moc(x,y,a);
                                end;
                        8:
                                begin
                                        if powtorzenie = false then
                                        begin
                                                writeln('Wybra�e� przeliczanie w jednostkach masy.');
                                                writeln(t1,godzina,' - Wybranie przeliczenia w jednostkach masy');
                                        end;
                                        close(t1);
                                        przel_masa(x,y,a);
                                end;
                        9:
                                begin
                                        if powtorzenie = false then
                                        begin
                                                writeln('Wybra�e� przeliczanie w jednostkach danych.');
                                                writeln(t1,godzina,' - Wybranie przeliczenia w jednostkach danych');
                                        end;
                                        close(t1);
                                        przel_dane(x,y,a);
                                end;
                        10:
                                begin
                                        if powtorzenie = false then
                                        begin
                                                writeln(t1,godzina,' - Wyswietlenie tabeli przedrostk�w');
                                                close(t1);
                                        end;
                                        clrscr;
                                        przedrostki;
                                end;
                end;
                powtorzenie:=true;
                assign(t1,'logi\logi_pj.txt');
                append(t1);
                if b <> 10 then
                begin

                        odp:=pkoncowen_tlo(1,34,2);
                        odp:=upcase(odp);
                        if (odp = 'M') then
                                begin
                                        wymazywanie4(27,34);
                                        zam_modulu(36,36,30);
                                        writeln(t1,godzina, ' - Zamkniecie modulu');
                                        close(t1);
                                        goto koniec;
                                end;
                        if (odp = 'J') then
                                begin
                                        wymazywanie4(27,34);
                                        przel_modulu(36,36,20);
                                        writeln(t1,godzina, ' - Uruchomienie ponowne modulu');
                                        writeln(t1);
                                        close(t1);
                                        goto poczatek;
                                end;




                        writeln(t1,godzina, ' - Powrot do edycji tabeli');
                        close(t1);
                        for licznik:=1 to 7 do       //czyszczenie okna pytania
                        begin
                                gotoxy(1,34+licznik);
                                writeln('                                                            ');
                        end;
                        goto tabela;
                end
                else
                begin
                        odp:=pkoncowe_tlo(1,34);
                        odp:=upcase(odp);
                        if (odp = 'M') then
                                begin
                                        wymazywanie4(27,34);
                                        zam_modulu(36,36,30);
                                        writeln(t1,godzina, ' - Zamkniecie modulu');
                                        close(t1);
                                        goto koniec;
                                end;
                        wymazywanie4(27,34);
                        przel_modulu(36,36,20);
                        writeln(t1,godzina, ' - Uruchomienie ponowne modulu');
                        writeln(t1);
                        close(t1);
                        goto poczatek;
                end;
                koniec:

        end;

        procedure kd;
        label
                poczatek,
                poczpetli,
                koniec;

        var
                dane:array[1..100] of char;
                kod,kod2,haslo,test:string;
                a,b,licznik:integer;
                t1:text;
                odp:char;

                x,y,yruchome:integer;
                klawisz:char;
                oryginal,kodowanie1,kodowanie2:string;

        begin
                poczatek:
                clrscr;
                writeln('浜様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様融');
                writeln('�    __ __        __          ___      __           __         �');
                writeln('�   / //_/__  ___/ /__ ____  / _ \___ / /_____  ___/ /__ ____  �');
                writeln('�  / ,< / _ \/ _  / -_) __/ / // / -_)  `_/ _ \/ _  / -_) __/  �');
                writeln('� /_/|_|\___/\_,_/\__/_/   /____/\__/_/\_\\___/\_,_/\__/_/     �');
                writeln('�                                                              �');
                writeln('藩様様様様様融   Miko�aj Stankowiak, 09.08.2012r   浜様様様様様�');
                writeln('             �                                     �             ');
                writeln('             藩様様様様様様様様様様様様様様様様様様�             ');
                cznieb;
                gotoxy(4,9);
                write('v. 2.03');
                gotoxy(16,7);
                write(#01);
                gotoxy(50,7);
                write(#01);
                typowyk;
                gotoxy(1,12);

                if fsearch('logi\logi_kd.txt','') = '' then
                        begin
                                writeln('Brakuje pliku raportowego, w�a�nie go wygenerowa�em.');
                                assign(t1,'logi\logi_kd.txt');
                                rewrite(t1);
                                writeln(t1, 'Ten plik przechowuje logi modulu Koder / Dekoder');
                                writeln(t1,'Data i czas wygenerowania tego pliku: ',data, ', ',godzina );
                                writeln(t1,'Autor programu: Mikolaj Stankowiak');
                                close(t1);
                                writeln;
                        end;

                assign(t1,'logi\logi_kd.txt');
                append(t1);
                writeln(t1);
                writeln(t1);
                writeln(t1);
                writeln(t1,'Uruchomienie modulu Koder_Dekoder');
                writeln(t1,'Aktualna data i czas: ',data,', ',godzina );
                writeln(t1,'Brak mozliwosci wyswietlenia polskich znakow !');
                writeln(t1,'Dane moga byc nieczytelne.');
                writeln(t1);
                close(t1);



                y:=14;
                x:=1;
                oryginal:='';
                kodowanie1:='';
                kodowanie2:='';
                yruchome:=y;
                gotoxy(x,y);
                writeln('Oryginalny tekst: ');
                gotoxy(x,y+2);
                writeln('Tekst zakodowany (1): ');
                gotoxy(x,y+4);
                writeln('Tekst zakodowany (2): ');
                instrukcja(x,y+7,'szyfrowanie','szyfrowania');
                x:=x+24;
                gotoxy(x,y);
                repeat
                poczpetli:

                if yruchome=y then podswietlenie_slowa(x,yruchome,oryginal);    //podswietlenie
                if yruchome=y+2 then  podswietlenie_slowa(x,yruchome,kodowanie1);
                if yruchome=y+4 then  podswietlenie_slowa(x,yruchome,kodowanie2);

                klawisz:=readkey;
                typowyk;
                gotoxy(x*2,y+7);
                write('                         ');
                gotoxy(x*2,y+8);
                write('                         ');
                if klawisz=#13 then
                        begin
                                zaznaczenie_slowa(x,yruchome,0);
                                readln(kod);
                                if length(kod) > 34 then
                                begin                             //gdy za d�ugi ci�g znak�w
                                        gotoxy(x,yruchome);
                                        typowyk;
                                        write('                                                           ');
                                        gotoxy(x*2,y+7);
                                        write(godzina,' - za d�ugi');
                                        gotoxy(x*2,y+8);
                                        write('ci�g znak�w !');
                                        goto poczpetli;
                                end;
                                oryginal:='';
                                kodowanie1:='';
                                kodowanie2:='';
                                typowyk;
                                kod2:=kod;

                                assign(t1,'logi\logi_kd.txt');
                                append(t1);
                                writeln(t1);

                                gotoxy(x,y);
                                write('                                   ');
                                gotoxy(x,y+2);
                                write('                                   ');
                                gotoxy(x,y+4);
                                write('                                   ');

                                if yruchome = y then
                                        begin
                                                write(t1,godzina,' - ');
                                                writeln(t1, 'Wpisano slowo oryginalne: ',kod);
                                                oryginal:=kod;
                                        end;
                                if yruchome = y+2 then
                                        begin
                                                write(t1,godzina,' - ');
                                                writeln(t1, 'Wpisano slowo kodowania(1): ',kod);
                                                kodowanie1:=kod;

                                                kod2:='';
                                                for licznik:=1 to length(kod) do dane[licznik]:=kod[licznik];
                                                for licznik:=1 to length(kod) do kod2:=kod2 + dekoder(dane[licznik]);
                                                oryginal:=kod2;
                                        end;
                                if yruchome = y+4 then
                                        begin
                                                write(t1,godzina,' - ');
                                                writeln(t1, 'Wpisano slowo kodowania(2): ',kod);
                                                kodowanie2:=kod;

                                                kod2:='';
                                                for licznik:=1 to length(kod) do dane[licznik]:=kod[licznik];
                                                for licznik:=1 to length(kod) do kod2:=kod2 + dekoder2(dane[licznik]);
                                                oryginal:=kod2;
                                        end;
                                kod:=kod2;
                                typowyk;
                                gotoxy(x,y);
                                if (yruchome = y+2) or (yruchome = y+4) then
                                        begin
                                                writeln(t1, '           Tlumaczenie na oryginal: ',kod2);
                                        end;
                                write(kod2);

                                gotoxy(x,y+2);
                                for licznik:=1 to length(kod) do dane[licznik]:=kod2[licznik];
                                for licznik:=1 to length(kod) do write(koder(dane[licznik]));
                                if (yruchome = y) or (yruchome = y+4) then
                                        begin
                                                write(t1, '           Tlumaczenie na kodowanie(1): ');
                                                for licznik:=1 to length(kod) do
                                                        begin
                                                                write(t1,koder(dane[licznik]));
                                                                kodowanie1:=kodowanie1+koder(dane[licznik]);
                                                        end;
                                                writeln(t1);
                                        end;

                                gotoxy(x,y+4);
                                for licznik:=1 to length(kod2) do dane[licznik]:=kod[licznik];
                                for licznik:=1 to length(kod2) do write(koder2(dane[licznik]));
                                if (yruchome = y) or (yruchome = y+2) then
                                        begin
                                                write(t1, '           Tlumaczenie na kodowanie(2): ');
                                                for licznik:=1 to length(kod) do
                                                        begin
                                                                write(t1,koder2(dane[licznik]));
                                                                kodowanie2:=kodowanie2+koder2(dane[licznik]);
                                                        end;
                                                writeln(t1);
                                        end;

                                close(t1);
                                gotoxy(x,yruchome);
                        end
                else
                begin
                        if yruchome=y then odswietlenie_slowa(x,yruchome,oryginal);    //odswietlenie
                        if yruchome=y+2 then  odswietlenie_slowa(x,yruchome,kodowanie1);
                        if yruchome=y+4 then  odswietlenie_slowa(x,yruchome,kodowanie2);

                        if klawisz=chr(0) then klawisz:=readkey;
                        case klawisz of
                                'H':
                                        begin
                                                if yruchome=y then yruchome:=yruchome+4
                                                else yruchome:=yruchome-2;
                                                gotoxy(x,yruchome);
                                        end;
                                'P':
                                        begin
                                                if yruchome=y+4 then yruchome:=y
                                                else yruchome:=yruchome+2;
                                                gotoxy(x,yruchome);
                                        end;
                                end;
                end;
                until klawisz=#27;

                typowyk;

                odp:=pkoncowe_tlo(1,30);

                assign(t1,'logi\logi_kd.txt');
                append(t1);
                odp:=upcase(odp);
                if (odp = 'M') then
                        begin
                                wymazywanie4(27,34);
                                zam_modulu(36,36,30);
                                writeln(t1);
                                writeln(t1,godzina, ' - Zamkniecie modulu');
                                close(t1);
                                goto koniec;
                        end;
                wymazywanie4(27,34);
                przel_modulu(36,36,20);
                writeln(t1);
                writeln(t1,godzina, ' - Uruchomienie ponowne modulu');
                writeln(t1);
                close(t1);
                goto poczatek;

                koniec:

        end;


        procedure srednia;
        label
                poczatek,
                kotwica1,
                kotwica2,
                kotwica3,
                pocz_tabeli,
                koniec;

        var
                tabela:array[1..20,1..3] of integer;
                t1,t2:text;
                odp,znak:char;

                x,ruchomex,y,ruchomey:integer;
                ilosco,waga,licznik,ocenax,ocenay,liczba,polozenie,dokl:integer;
                srocen:real;

        begin

                poczatek:
                clrscr;

                writeln('浜様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様融 ');
                writeln('�                                                                                    � ');
                writeln('� .|```|                    ||`                                                      � ');
                writeln('� ||                        ||            ``                                         � ');
                writeln('� `|```|, `||``| .|``|, .|``||  `||``|,   ||   ```|.     .|``|, .|``, .|``|, `||``|, � ');
                writeln('�  .   ||  ||    ||..|| ||  ||   ||  ||   ||  .|``||     ||  || ||    ||..||  ||  || � ');
                writeln('� |...|` .||.   `|...  `|..||. .||  ||. .||. `|..||.    `|..|` `|..` `|...  .||  ||. � ');
                writeln('�                                                                                    � ');
                writeln('藩様様様様様様様様様様融   Miko�aj Stankowiak, 09.08.2012r   浜様様様様様様様様様様様�');
                writeln('                       �                                     �                     ');
                writeln('                       藩様様様様様様様様様様様様様様様様様様�                      ');

                cznieb;
                gotoxy(9,11);
                write('v. 2.03');
                gotoxy(26,9);
                write(#01);
                gotoxy(60,9);
                write(#01);
                typowyk;
                gotoxy(1,13);

                y:=15;
                x:=1;
                ruchomey:=y;
                ruchomex:=x;
                ocenax:=1;
                ocenay:=1;
                polozenie:=1;

                if fsearch('logi\logi_srednia.txt','') = '' then //sprawdza czy istnieje plik z logami
                        begin                       //jezeli nie to go tworzy
                                writeln('Brakuje pliku raportowego, w�a�nie go wygenerowa�em.');
                                assign(t1, 'logi\logi_srednia.txt');
                                rewrite(t1);
                                writeln(t1, 'Ten plik przechowuje logi modulu Srednia Ocen');
                                writeln(t1,'Data i czas wygenerowania tego pliku: ',data,', ',godzina );
                                writeln(t1,'Autor programu: Mikolaj Stankowiak');
                                close(t1);
                        end
                        else writeln;
                writeln;
                assign(t1,'logi\logi_srednia.txt');         //wpis uruchomienia programu
                append(t1);
                writeln(t1);
                writeln(t1);
                writeln(t1);
                writeln(t1,'Uruchomienie modulu Srednia Ocen');
                writeln(t1,'Aktualna data i czas ',data,', ',godzina );
                writeln(t1,'Brak mozliwosci wyswietlenia polskich znakow !');
                writeln(t1,'Dane moga byc nieczytelne.');
                writeln(t1);
                writeln(t1);
                close(t1);

                kotwica1:
                if polozenie > 8 then error('logi\logi_srednia.txt');
                writeln;
                write('Podaj ilo�� ocen: ');
                readln(ilosco);
                if (ilosco < 2) or (ilosco > 20) then
                        begin
                                writeln('Warto�� musi by� w rzedziale od 2 do 20.');
                                polozenie:= polozenie+1;
                                goto kotwica1;

                        end;

                kotwica2:
                if polozenie > 9 then error('logi\logi_srednia.txt');

                writeln;
                write('Podaj domy�ln� wag� ocen: ');
                readln(waga);
                if (waga < 1) or (waga > 12) then
                        begin
                                writeln('Warto�� musi by� w rzedziale od 1 do 12.');
                                polozenie:= polozenie+1;
                                goto kotwica2;
                        end;


                kotwica3:
                if polozenie > 10 then error('logi\logi_srednia.txt');
                writeln;
                write('Podaj dok�adno�� �redniej w miejscach po przecinku: ');
                readln(dokl);
                if (dokl < 0) or (dokl > 5) then
                        begin
                                writeln('Warto�� musi by� w rzedziale od 0 do 5.');
                                polozenie:= polozenie+1;
                                goto kotwica3;
                        end;

                assign(t1,'logi\logi_srednia.txt');
                append(t1);
                write(t1, godzina,' - ');                   //zapis wprowadzonych zmiennych do pliku
                writeln(t1, 'Wprowadzono zmienne:');
                writeln(t1, '           Ilosc ocen: ',ilosco);
                writeln(t1, '           Domyslna waga oceny: ',waga);
                writeln(t1, '           Dokladnosc sredniej: ',dokl);
                writeln(t1);
                close(t1);


                for licznik:=1 to 30 do             //wymazywanie przed rysowaniem tabelki
                        begin
                                gotoxy(1,11+licznik);
                                write('                                                        ');
                        end;

                instrukcja(41,32,'kom�rk� tabeli','kom�rki tabeli');
                                                                     //przypisywanie domy�lnych warto�ci tabeli
                for licznik:=1 to ilosco do tabela[licznik,2]:=waga;

                for licznik:=1 to ilosco do tabela[licznik,1]:=1;

                x:=13;
                ruchomex:=x;
                y:=19;
                ruchomey:=y;

                tabelka(1,15,waga,ilosco);

                pocz_tabeli:
                repeat
                if ocenay < 3 then podswietlenie(ruchomex,ruchomey,tabela[ocenax,ocenay],ilosco,ocenax);


                waga:=0;                                //obliczanie i wpisywanie sredniej
                srocen:=0;
                for licznik:=1 to ilosco do
                        begin
                                srocen:=srocen+(tabela[licznik,1]*tabela[licznik,2]);
                                waga:=waga+tabela[licznik,2];
                        end;
                srocen:=srocen/waga;
                gotoxy(2,25);
                textcolor(7);
                textbackground(11);
                write(' ',srocen:2:dokl);
                for licznik:=1 to 5-dokl do write(' ');

                textcolor(7);
                textbackground(0);
                if ocenay < 3 then gotoxy(ruchomex,ruchomey)
                else gotoxy(17,28);

                znak:=readkey;
                gotoxy(21,28);
                writeln('                              ');
                if znak=#13 then  // po enterze
                        begin
                                if ocenay <3 then
                                        begin                                        // zaznaczenie i przypisanie warto�ci do tabeli
                                                zaznaczenie(ruchomex,ruchomey);
                                                readln(liczba);
                                                if (((liczba > 6) or (liczba < 1)) and (ocenay = 1)) or (((liczba > 12) or (liczba < 0)) and (ocenay = 2)) then
                                                        begin   //komunikat o b��dnej liczbie
                                                                gotoxy(21,28);
                                                                typowyk;
                                                                writeln(godzina,' - Z�a liczba !');
                                                                goto pocz_tabeli;
                                                        end
                                                else tabela[ocenax,ocenay]:=liczba;
                                        end
                                else
                                        begin
                                                assign(t1,'logi\logi_srednia.txt');
                                                append(t1);
                                                write(t1, godzina,' - ');
                                                writeln(t1, 'Zadeklarowano zapis zmiennych: ');
                                                for licznik:=1 to ilosco do writeln(t1,'           ','Ocena nr ',licznik,': ',tabela[licznik,1], ', waga: ',tabela[licznik,2]);
                                                writeln(t1, '           Srednia: ',srocen:2:dokl);
                                                writeln(t1);
                                                close(t1);
                                                gotoxy(21,28);
                                                writeln(godzina,' - Zapisano do pliku !');
                                        end;

                        end

                else
                        begin
                                if znak=chr(0) then znak:=readkey; //obsluga zmiany polorzenia
                                case znak of
                                        'H':      // strza�ka w g�r�
                                                begin
                                                        case ocenay of
                                                        1:
                                                                begin
                                                                        odswietlenie(ruchomex,ruchomey,tabela[ocenax,ocenay],ilosco,ocenax);
                                                                        if (ruchomex=13) or (ruchomex=17) then
                                                                                begin       //jezeli pierwsza lub druga kolumna
                                                                                          // to pole na samym dole
                                                                                        czbk;
                                                                                        gotoxy(3,28);
                                                                                        write('Zapisz do pliku');
                                                                                        typowyk;
                                                                                        ocenay:=3;
                                                                                end
                                                                        else            //pole drugie
                                                                                begin
                                                                                        odswietlenie(ruchomex,ruchomey,tabela[ocenax,ocenay],ilosco,ocenax);
                                                                                        ruchomey:=ruchomey+3;
                                                                                        ocenay:=2;
                                                                                 end;
                                                                end;
                                                        2:              // pole do g�ry
                                                                begin
                                                                        odswietlenie(ruchomex,ruchomey,tabela[ocenax,ocenay],ilosco,ocenax);
                                                                        ruchomey:=y;
                                                                        ocenay:=1;
                                                                end;
                                                        3:              // pole do g�ry
                                                                begin
                                                                        gotoxy(3,28);
                                                                        write('Zapisz do pliku');
                                                                        ruchomey:=y+3;
                                                                        ocenay:=2;
                                                                end;
                                                        end;
                                                end;
                                        'P':               //strza�ka w d��
                                                begin
                                                        case ocenay of
                                                        1:            //pole w d��
                                                                begin
                                                                        odswietlenie(ruchomex,ruchomey,tabela[ocenax,ocenay],ilosco,ocenax);
                                                                        ruchomey:=ruchomey+3;
                                                                        ocenay:=2;
                                                                 end;
                                                        2:
                                                                begin
                                                                        odswietlenie(ruchomex,ruchomey,tabela[ocenax,ocenay],ilosco,ocenax);

                                                                        if (ruchomex=13) or (ruchomex=17) then  //jezeli druga lub pierwsz kolumna
                                                                                begin               //na koniec
                                                                                        czbk;
                                                                                        gotoxy(3,28);
                                                                                        write('Zapisz do pliku');
                                                                                        typowyk;
                                                                                        ocenay:=3;
                                                                                end
                                                                        else            //na pocz�tek
                                                                                begin
                                                                                        ruchomey:=y;
                                                                                        ocenay:=1;
                                                                                end;
                                                                end;
                                                        3:              //na poczatek
                                                                begin
                                                                        gotoxy(3,28);
                                                                        write('Zapisz do pliku');
                                                                        ruchomey:=y;
                                                                        ocenay:=1;
                                                                end;
                                                        end;
                                                end;
                                        'M':       //strza�ka w prawo
                                                begin
                                                        if ocenay <> 3 then
                                                        begin
                                                                if ocenax=ilosco then //jezeli koniec to przejdz na poczatek
                                                                        begin
                                                                                odswietlenie(ruchomex,ruchomey,tabela[ocenax,ocenay],ilosco,ocenax);
                                                                                ruchomex:=x;
                                                                                ocenax:=1;
                                                                        end
                                                                else            //jezeli srodek to komorka w prawo
                                                                        begin
                                                                                odswietlenie(ruchomex,ruchomey,tabela[ocenax,ocenay],ilosco,ocenax);
                                                                                ruchomex:=ruchomex+4;
                                                                                ocenax:=ocenax+1;
                                                                        end;
                                                        end;
                                                end;
                                        'K':      //strza�ka w lewo
                                                begin
                                                        if ocenay <> 3 then
                                                        begin
                                                                if ocenax=1 then  //jezeli poczatek to przejdz na koniec
                                                                        begin
                                                                                odswietlenie(ruchomex,ruchomey,tabela[ocenax,ocenay],ilosco,ocenax);
                                                                                ruchomex:=ruchomex+(ilosco*4)-4;
                                                                                ocenax:=ilosco;
                                                                        end
                                                                else            //jezeli srodek to komorka w prawo
                                                                        begin
                                                                                odswietlenie(ruchomex,ruchomey,tabela[ocenax,ocenay],ilosco,ocenax);
                                                                                ruchomex:=ruchomex-4;
                                                                                ocenax:=ocenax-1;
                                                                        end;
                                                        end;
                                                end;
                                        end;
                        end;
                until znak=#27; //az wcisniesz escape
                typowyk;


                odp:=pkoncowen_tlo(1,32,0);
                assign(t1,'logi\logi_srednia.txt');
                append(t1);
                odp:=upcase(odp);
                if (odp = 'J') then
                        begin
                                wymazywanie4(27,32);
                                przel_modulu(36,34,20);
                                writeln(t1,godzina, ' - Uruchomienie ponowne modulu');
                                writeln(t1);
                                close(t1);

                                goto poczatek;
                        end;

                if (odp = 'M') then
                        begin
                                wymazywanie4(27,32);
                                zam_modulu(36,34,30);
                                writeln(t1,godzina, ' - Zamkniecie modulu');
                                close(t1);
                                goto koniec;
                        end;

                writeln(t1,godzina,' - Powrot do edycji tabeli');
                close(t1);

                for licznik:=1 to 7 do       //czyszczenie okna pytania
                        begin
                                gotoxy(1,32+licznik);
                                writeln('                                 ');
                        end;

                goto pocz_tabeli;
                koniec:
        end;

        procedure punkty;
        type
                dane=record
                nazw:string;  //imie i nazwisko
                klasa:string;
                nr:integer;   //nr dziennika
                end;
        label
                poczatek,
                kotwica0,
                kotwica1,
                kotwica2,
                kotwica3,
                pocz_tabeli,
                koniec,
                koniec2;

        var
                tabela:array[1..20,1..4] of integer;
                daneu:array[1..1] of dane;
                t1:text;
                odp,znak:char;
                poprawnosc:boolean;
                x,ruchomex,y,ruchomey,kopiary:integer;
                ilosczad,waga,licznik,tabelax,tabelay,liczba,polozenie:integer;
                nrd,ktorynapis:integer;
                ocena,slowo:string;
                pmax,pzdobyte,dokl:integer;
                procent:real;

        begin

                poczatek:
                clrscr;

                writeln('浜様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様融 ');
                writeln('� ______            _    _           _                               � ');
                writeln('� | ___ \          | |  | |         (_)                              � ');
                writeln('� | |_/ /   _ _ __ | | _| |_ _   _   _    ___   ___ ___ _ __   __ _  � ');
                writeln('� |  __/ | | | `_ \| |/ / __| | | | | |  / _ \ / __/ _ \ `_ \ / _` | � ');
                writeln('� | |  | |_| | | | |   <| |_| |_| | | | | (_) | (_|  __/ | | | (_| | � ');
                writeln('� \_|   \__,_|_| |_|_|\_\\__|\__, | |_|  \___/ \___\___|_| |_|\__,_| � ');
                writeln('�                             __/ |                                  � ');
                writeln('�                            |___/                                   � ');
                writeln('�                                                                    � ');
                writeln('藩様様様様様様様�   Miko�aj Stankowiak, 09.08.2012r   浜様様様様様様夕');
                writeln('                �                                     �                     ');
                writeln('    v. 2.03     藩様様様様様様様様様様様様様様様様様様�                      ');

                cznieb;
                gotoxy(5,13);
                write('v. 2.03');
                gotoxy(19,11);
                write(#01);
                gotoxy(53,11);
                write(#01);
                typowyk;
                gotoxy(1,15);

                if fsearch('logi\logi_punkty.txt','') = '' then //sprawdza czy istnieje plik z logami
                        begin                       //jezeli nie to go tworzy
                                gotoxy(26,25);    //komunikat
                                writeln(godzina,' - Brakuje pliku raportowego,');
                                gotoxy(26,26);

                                write('w�a�nie go wygenerowa�em.');
                                assign(t1, 'logi\logi_punkty.txt');
                                rewrite(t1);
                                writeln(t1, 'Ten plik przechowuje logi modulu Punkty i Ocena');
                                writeln(t1,'Data i czas wygenerowania tego pliku: ',data,', ',godzina );
                                writeln(t1,'Autor programu: Mikolaj Stankowiak');
                                close(t1);
                        end;



                assign(t1,'logi\logi_punkty.txt');         //wpis uruchomienia programu
                append(t1);
                writeln(t1);
                writeln(t1);
                writeln(t1);
                writeln(t1,'Uruchomienie modulu Punkty i Ocena');
                writeln(t1,'Aktualna data i czas ',data,', ',godzina );
                writeln(t1,'Brak mozliwosci wyswietlenia polskich znakow !');
                writeln(t1,'Dane moga byc nieczytelne.');
                writeln(t1);
                writeln(t1);
                close(t1);

                nrd:=1;

                kotwica0:
                y:=17;                              //domy�lne warto�ci zmiennych
                x:=1;
                ruchomey:=y;
                ruchomex:=x;
                tabelax:=1;
                tabelay:=1;
                polozenie:=1;
                pmax:=0;
                pzdobyte:=0;
                ilosczad:=0;

                daneu[1].nazw:='';
                daneu[1].klasa:='';
                daneu[1].nr:=0;

                niebbial;                                  //wypisywanie potrzebnych danych tabeli
                gotoxy(x,y-2);
                writeln('Dane ucznia nr ',nrd,' (uzupe�nij):');
                typowyk;
                gotoxy(x,y);
                writeln('Imi� i nazwisko:');
                gotoxy(x,y+2);
                writeln('Klasa:');
                gotoxy(x,y+4);
                writeln('Nr dziennika:     0');
                gotoxy(x,y+6);
                writeln('Ilo�� zada�:      0');

                instrukcja(x,y+11,'okre�lone pole','pola');
                gotoxy(x,y+21);
                write('Je�eli wpisa�e� wszystkie dane to wci�nij k aby');
                gotoxy(x,y+22);
                write('kontynuowa�...');
                x:=x+18;

                kotwica1:
                repeat

                kopiary:=ruchomey;
                poprawnosc:=false;
                if ruchomey=y then podswietlenie_slowa(x,ruchomey,daneu[1].nazw);    //podswietlenie
                if ruchomey=y+2 then  podswietlenie_slowa(x,ruchomey,daneu[1].klasa);
                str(daneu[1].nr,slowo);
                if ruchomey=y+4 then  podswietlenie_slowa(x,ruchomey,slowo);
                str(ilosczad,slowo);
                if ruchomey=y+6 then  podswietlenie_slowa(x,ruchomey,slowo);

                gotoxy(x,ruchomey);
                znak:=readkey;
                typowyk;
                gotoxy(26,25);                       //czyszczenie pola komunikatu
                write('                                      ');
                gotoxy(26,26);
                write('                                      ');

                if znak=#13 then
                        begin
                                zaznaczenie_slowa(x,ruchomey,0);
                                readln(slowo);
                                typowyk;
                                kotwica2:

                                if ruchomey=y then
                                        begin
                                                if poprawnosc=true then slowo:=daneu[1].nazw;
                                                if length(slowo) < 6 then
                                                        begin
                                                                gotoxy(x,ruchomey);
                                                                write('      ');
                                                                gotoxy(26,25);  //komunikat
                                                                write(godzina,' - Wpisane zosta�y');
                                                                gotoxy(26,26);
                                                                write('niepoprawne dane');
                                                                daneu[1].nazw:='';
                                                                ruchomey:=kopiary;
                                                                goto kotwica1;
                                                        end;
                                                daneu[1].nazw:=slowo;
                                                if poprawnosc=true then ruchomey:=ruchomey+2;
                                        end;

                                if ruchomey=y+2 then
                                        begin
                                                if poprawnosc=true then slowo:=daneu[1].klasa;
                                                if (length(slowo) < 3) or (length(slowo) > 6)  then
                                                        begin
                                                                gotoxy(x,ruchomey);
                                                                write('            ');
                                                                gotoxy(26,25);  //komunikat
                                                                write(godzina,' - Wpisane zosta�y');
                                                                gotoxy(26,26);
                                                                write('niepoprawne dane');
                                                                daneu[1].klasa:='';
                                                                ruchomey:=kopiary;
                                                                goto kotwica1;
                                                        end;
                                                daneu[1].klasa:=slowo;
                                                if poprawnosc=true then ruchomey:=ruchomey+2;
                                        end;
                                if ruchomey=y+4 then
                                        begin
                                                if poprawnosc=true then str(daneu[1].nr,slowo);
                                                val(slowo,daneu[1].nr);
                                                if (daneu[1].nr < 1) or (daneu[1].nr > 40) then
                                                        begin
                                                                gotoxy(26,25);  //komunikat
                                                                write(godzina,' - Wpisane zosta�y');
                                                                gotoxy(26,26);
                                                                write('niepoprawne dane');
                                                                daneu[1].nr:=0;
                                                                ruchomey:=kopiary;
                                                                goto kotwica1;
                                                        end;
                                                if poprawnosc=true then ruchomey:=ruchomey+2;
                                        end;
                                if ruchomey=y+6 then
                                        begin
                                                if poprawnosc=true then str(ilosczad,slowo);
                                                val(slowo,ilosczad);
                                                if (ilosczad < 4) or (ilosczad > 20) then
                                                        begin
                                                                gotoxy(26,25);  //komunikat
                                                                write(godzina,' - Wpisane zosta�y');
                                                                gotoxy(26,26);
                                                                write('niepoprawne dane');
                                                                ilosczad:=0;
                                                                if poprawnosc=true then ruchomey:=kopiary;
                                                                goto kotwica1;
                                                        end;
                                        end;
                                if poprawnosc=true then goto kotwica3;
                        end


                else
                begin
                        if znak=chr(0) then znak:=readkey; //je�eli strza�ki

                        case znak of
                                'H':            //strza�ka w g�r�
                                        begin
                                                if ruchomey=y then odswietlenie_slowa(x,ruchomey,daneu[1].nazw);    //odswietlenie
                                                if ruchomey=y+2 then  odswietlenie_slowa(x,ruchomey,daneu[1].klasa);
                                                str(daneu[1].nr,slowo);
                                                if ruchomey=y+4 then  odswietlenie_slowa(x,ruchomey,slowo);
                                                str(ilosczad,slowo);
                                                if ruchomey=y+6 then  odswietlenie_slowa(x,ruchomey,slowo);

                                                if y=ruchomey then ruchomey:=ruchomey+6
                                                else ruchomey:=ruchomey-2;
                                                gotoxy(x,ruchomey);
                                        end;
                                'P':            //strza�ka w d��
                                        begin
                                                if ruchomey=y then odswietlenie_slowa(x,ruchomey,daneu[1].nazw);    //odswietlenie
                                                if ruchomey=y+2 then  odswietlenie_slowa(x,ruchomey,daneu[1].klasa);
                                                str(daneu[1].nr,slowo);
                                                if ruchomey=y+4 then  odswietlenie_slowa(x,ruchomey,slowo);
                                                str(ilosczad,slowo);
                                                if ruchomey=y+6 then  odswietlenie_slowa(x,ruchomey,slowo);

                                                if ruchomey=y+6 then ruchomey:=y
                                                else ruchomey:=ruchomey+2;
                                                gotoxy(x,ruchomey);
                                        end;
                        end;
                end;


                until (znak=#27) or (znak='k');


                if (znak=#27) then                   //je�eli escape to zamknij program
                        begin
                                gotoxy(26,25);
                                write(godzina,' - Czy zako�czy�');
                                gotoxy(26,26);
                                write('(');  //wzbogacenie kolorystyczne pytania
                                cznieb;
                                write('t');
                                typowyk;
                                write('/');
                                cznieb;
                                write('n');
                                typowyk;
                                write(') ?');
                                znak:=readkey;
                                gotoxy(26,25);
                                write('                            ');
                                gotoxy(26,26);
                                write('       ');
                                if znak<>'t' then goto kotwica1;

                                assign(t1,'logi\logi_punkty.txt');
                                append(t1);
                                wymazywanie4(27,34);
                                zam_modulu(36,36,30);
                                writeln(t1,godzina, ' - Zamkniecie modulu');
                                close(t1);
                                goto koniec2;
                        end;
                poprawnosc:=true;
                kopiary:=ruchomey;
                ruchomey:=y;

                if ruchomey=y then odswietlenie_slowa(x,ruchomey,daneu[1].nazw);    //odswietlenie
                if ruchomey=y+2 then  odswietlenie_slowa(x,ruchomey,daneu[1].klasa);
                str(daneu[1].nr,slowo);
                if ruchomey=y+4 then  odswietlenie_slowa(x,ruchomey,slowo);
                str(ilosczad,slowo);
                if ruchomey=y+6 then  odswietlenie_slowa(x,ruchomey,slowo);

                goto kotwica2;
                kotwica3:

                typowyk;
                assign(t1,'logi\logi_punkty.txt');
                append(t1);
                write(t1, godzina,' - ');                   //zapis wprowadzonych zmiennych do pliku
                writeln(t1, 'Wprowadzono zmienne:');
                writeln(t1, '           Dane ucznia nr ',nrd);
                writeln(t1, '           Imie i nazwisko: ',daneu[1].nazw);
                writeln(t1, '           Klasa: ',daneu[1].klasa);
                writeln(t1, '           Nr dziennika: ',daneu[1].nr);
                writeln(t1, '           Ilosc zadan: ',ilosczad);
                writeln(t1);
                close(t1);

                x:=14;
                ruchomex:=x;
                y:=21;
                ruchomey:=y;

                for licznik:=1 to 30 do                      //wymazywanie przed rysowaniem tabelki
                        begin
                                gotoxy(1,13+licznik);
                                write('                                                                           ');
                        end;

                instrukcja(x-13,y+14,'okre�lon� kom�rk� tabeli','kom�rki');
                                                                   //przypisywanie domy�lnych warto�ci tabeli
                for licznik:=1 to ilosczad do tabela[licznik,2]:=1;       //ilosc punktow maksymalnie

                for licznik:=1 to ilosczad do tabela[licznik,1]:=1;      //ilosc punktow zdobytych

                tabelka_punkty(x-13,y-4,ilosczad);

                                           //dane aktualnego ucznia
                gotoxy(x+46,y+14);
                niebbial;
                write('Dane ucznia nr ',nrd,':');

                gotoxy(x+46,y+16);
                typowyk;
                write('Imie i nazwisko: ', daneu[1].nazw);

                gotoxy(x+46,y+17);
                write('Klasa: ',daneu[1].klasa);

                gotoxy(x+46,y+18);
                write('Nr dziennika: ',daneu[1].nr);

                gotoxy(x+46,y+19);
                write('Ilo�� zada�: ',ilosczad);

                pocz_tabeli:


                repeat
                pmax:=0;
                pzdobyte:=0;



                if (ktorynapis = 1) and (tabelay = 4) then  //zaznaczenie po powrocie do tabeli
                        begin
                                czbk;
                                gotoxy(x-11,y+9);
                                write('Zako�cz');
                        end;
                if tabelay < 3 then podswietlenie(ruchomex,ruchomey,tabela[tabelax,tabelay],ilosczad,tabelax);


                                        //obliczanie i wpisywanie % dla kazdego zadania

                for licznik:=1 to ilosczad do
                        begin
                                niebbial;
                                tabela[licznik,3]:=tabela[licznik,2] * 100 div tabela[licznik,1];
                                gotoxy(x-5+(licznik*4),y+6);
                                write('   ');
                                if tabela[licznik,3] = 100 then gotoxy(x-5+(licznik*4),y+6)
                                else gotoxy(x-4+(licznik*4),y+6);
                                write(tabela[licznik,3]);

                        end;                    // obliczanie g�ownego wyniku
                for licznik:=1 to ilosczad do
                        begin
                                pmax:=pmax+tabela[licznik,1];
                                pzdobyte:=pzdobyte+tabela[licznik,2];
                end;
                procent:=pzdobyte*100 / pmax;
                                          //wy�wietlenia punkt�w i wyniku
                gotoxy(x+12,y+9);
                typowyk;
                write('                      ');
                gotoxy(x+12,y+9);
                cznieb;
                if procent = zaokraglij(procent,0) then dokl:= 0
                else if procent = zaokraglij(procent,1) then dokl:=1
                else dokl:=2;
                write(pzdobyte,'/',pmax);
                typowyk;
                write(', ');
                cznieb;
                write(procent:1:dokl,' %');
                typowyk;
                write(' - ');
                ocena:='';
                                                                //ocena s�owna i jej kolor
                if (procent < 41) then
                        begin
                                textcolor(15);
                                textbackground(12);
                                ocena:='ndst';
                        end;
                if (procent >= 41) and (procent < 56) then
                        begin
                                textcolor(15);
                                textbackground(5);
                                ocena:='dop';
                        end;
                if (procent >= 56) and (procent < 76) then
                        begin
                                textcolor(15);
                                textbackground(9);
                                ocena:='dst';
                        end;
                if (procent >= 76) and (procent < 90) then
                        begin
                                textcolor(15);
                                textbackground(2);
                                ocena:='db';
                        end;
                if (procent >= 90) and (procent < 100) then
                        begin
                                textcolor(15);
                                textbackground(3);
                                ocena:='bdb';
                        end;
                if (procent = 100) then
                        begin
                                textcolor(15);
                                textbackground(14);
                                ocena:='cel';
                        end;
                write(ocena);
                typowyk;
                write(' ');

                textcolor(7);
                textbackground(11);
                typowyk;
                if tabelay < 3 then gotoxy(ruchomex,ruchomey);  // ustaw kursor po wci�ni�ciu strza�ki
                if tabelay = 4 then
                        begin
                                case ktorynapis of
                                1: gotoxy(x-11,y+9);
                                2: gotoxy(x,y+9);
                                end;
                        end;

                znak:=readkey;

                gotoxy(x+12,y+11);
                write('                                ');
                gotoxy(x+12,y+12);
                write('                                ');

                if znak=#13 then  // po enterze
                        begin                                          // zaznaczenie i przypisanie warto�ci do tabeli
                                case tabelay of       //test poprawno�ci liczby
                                1:
                                        begin
                                                zaznaczenie(ruchomex,ruchomey);
                                                readln(liczba);
                                                if (liczba > 30) or (liczba < 1) then
                                                begin                                   //komunikat o b��dnej liczbie
                                                        gotoxy(x+12,y+11);
                                                        typowyk;
                                                        writeln(godzina,' - Z�a liczba !');
                                                        goto pocz_tabeli;
                                                end;
                                                if (tabela[tabelax,2] * 100 div liczba > 100) then
                                                begin                                    //komunikat o b��dnej liczbie
                                                        gotoxy(x+12,y+11);
                                                        typowyk;
                                                        writeln(godzina,' - Z�a liczba !');
                                                        goto pocz_tabeli;
                                                end;
                                                tabela[tabelax,tabelay]:=liczba;
                                        end;
                                2:
                                        begin
                                                zaznaczenie(ruchomex,ruchomey);
                                                readln(liczba);
                                                if (liczba > 30) or (liczba < 0) then
                                                begin                                   //komunikat o b��dnej liczbie
                                                        gotoxy(x+12,y+11);
                                                        typowyk;
                                                        writeln(godzina,' - Z�a liczba !');
                                                        goto pocz_tabeli;
                                                end;
                                                if (liczba * 100 div tabela[tabelax,1] > 100) and (tabelay=2)  then
                                                begin                                   //komunikat o b��dnej liczbie
                                                        gotoxy(x+12,y+11);
                                                        typowyk;
                                                        writeln(godzina,' - Z�a liczba !');
                                                        goto pocz_tabeli;
                                                end;
                                                tabela[tabelax,tabelay]:=liczba;
                                        end;
                                4:
                                        begin
                                                if ktorynapis=1 then goto koniec;

                                                if ktorynapis=2 then
                                                begin                           // zapis do pliku tekstowego
                                                        typowyk;
                                                        gotoxy(x+12,y+11);
                                                        write(godzina,' - Czy kontynuowa� (');
                                                        cznieb;
                                                        write('t');
                                                        typowyk;
                                                        write('/');
                                                        cznieb;
                                                        write('n');
                                                        typowyk;
                                                        write(') ?');
                                                        znak:=readkey;
                                                        gotoxy(x+12,y+11); //czyszczenie pola komunikatu
                                                        writeln('                                  ');
                                                        gotoxy(x+12,y+12);
                                                        writeln('                                  ');
                                                        if znak='t' then
                                                        begin
                                                                assign(t1,'logi\logi_punkty.txt');
                                                                append(t1);
                                                                write(t1, godzina,' - ');
                                                                writeln(t1, 'Zapisano zmienne: ');
                                                                for licznik:=1 to ilosczad do writeln(t1,'           ','Zadanie nr ',licznik,', ',tabela[licznik,2],'/',tabela[licznik,1],', ',tabela[licznik,3],'%');

                                                                writeln(t1, '           Ocena: ',procent:1:dokl,'% - ',ocena);
                                                                writeln(t1, '           Kontynuacja sprawdzania...');
                                                                writeln(t1);
                                                                close(t1);
                                                                for licznik:=1 to 30 do                                     //wymazywanie przed rysowaniem tabelki
                                                                begin
                                                                        gotoxy(1,13+licznik);
                                                                        write('                                                                                                               ');
                                                                end;
                                                                nrd:=nrd+1;
                                                                gotoxy(1,15);
                                                                goto kotwica0;
                                                        end;
                                                end;
                                        end;
                                end;

                        end

                else
                begin
                        if znak=chr(0) then znak:=readkey; //obsluga zmiany polorzenia
                        case znak of
                                'H':      // strza�ka w g�r�
                                        begin
                                                case tabelay of
                                                1:
                                                        begin
                                                        odswietlenie(ruchomex,ruchomey,tabela[tabelax,tabelay],ilosczad,tabelax);
                                                                if (ruchomex=14) or (ruchomex=18) or (ruchomex=22)  then
                                                                        begin       //jezeli pierwsza lub druga kolumna
                                                                                czbk;  // to pole na samym dole
                                                                                gotoxy(x,y+9);
                                                                                write('Kontynuuj');
                                                                                typowyk;
                                                                                tabelay:=4;
                                                                                ktorynapis:=2;
                                                                        end
                                                                else            //pole drugie
                                                                        begin
                                                                                ruchomey:=ruchomey+3;
                                                                                tabelay:=2;
                                                                        end;
                                                        end;
                                                2:              // pole do g�ry
                                                        begin
                                                                odswietlenie(ruchomex,ruchomey,tabela[tabelax,tabelay],ilosczad,tabelax);
                                                                ruchomey:=y;
                                                                tabelay:=1;
                                                        end;
                                                4:              // pole do g�ry
                                                        begin
                                                                gotoxy(x,y+9);
                                                                write('Kontynuuj');
                                                                gotoxy(x-11,y+9);
                                                                write('Zako�cz');
                                                                ktorynapis:=0;
                                                                ruchomey:=y+3;
                                                                tabelay:=2;
                                                        end;
                                                end;
                                        end;
                                'P':               //strza�ka w d��
                                        begin
                                                case tabelay of
                                                1:            //pole w d��
                                                        begin
                                                                odswietlenie(ruchomex,ruchomey,tabela[tabelax,tabelay],ilosczad,tabelax);
                                                                ruchomey:=ruchomey+3;
                                                                tabelay:=2;
                                                        end;
                                                2:
                                                        begin
                                                        odswietlenie(ruchomex,ruchomey,tabela[tabelax,tabelay],ilosczad,tabelax);

                                                                if (tabelax=1) or (tabelax=2) or (tabelax=3)  then  //jezeli druga lub pierwsz kolumna
                                                                        begin               //na koniec
                                                                                czbk;
                                                                                gotoxy(x,y+9);
                                                                                write('Kontynuuj');
                                                                                typowyk;
                                                                                ktorynapis:=2;
                                                                                tabelay:=4;
                                                                        end
                                                                else            //na pocz�tek
                                                                        begin
                                                                                ruchomey:=y;
                                                                                tabelay:=1;
                                                                        end;
                                                        end;
                                                4:              //na poczatek
                                                        begin
                                                                case ktorynapis of
                                                                2:
                                                                        begin
                                                                                gotoxy(x,y+9);
                                                                                write('Kontynuuj');
                                                                                ktorynapis:=0;
                                                                                ruchomey:=y;
                                                                                tabelay:=1;
                                                                        end;
                                                                1:
                                                                         begin
                                                                                gotoxy(x-11,y+9);
                                                                                write('Zako�cz');
                                                                                ktorynapis:=0;
                                                                                ruchomey:=y;
                                                                                tabelay:=1;
                                                                        end;
                                                                end;
                                                        end;
                                                end;
                                        end;
                                'M':       //strza�ka w prawo
                                        begin
                                                if (tabelax<>ilosczad) and ((tabelay = 1) or (tabelay = 2)) then  //jezeli srodek to komorka w prawo
                                                        begin
                                                                odswietlenie(ruchomex,ruchomey,tabela[tabelax,tabelay],ilosczad,tabelax);
                                                                ruchomex:=ruchomex+4;
                                                                tabelax:=tabelax+1;
                                                        end
                                                else
                                                begin
                                                if (tabelax=ilosczad) and ((tabelay = 1) or (tabelay = 2)) then //jezeli koniec to przejdz na poczatek
                                                        begin
                                                                odswietlenie(ruchomex,ruchomey,tabela[tabelax,tabelay],ilosczad,tabelax);
                                                                ruchomex:=x;
                                                                tabelax:=1;
                                                        end;
                                                end;
                                                if (ktorynapis = 2) and (tabelay = 4) then  //jezeli pozycja y = 4 i koniec to przejd� na pocz�tek
                                                        begin
                                                                typowyk;
                                                                gotoxy(x,y+9);
                                                                write('Kontynuuj');
                                                                czbk;
                                                                gotoxy(x-11,y+9);
                                                                write('Zako�cz');
                                                                ktorynapis:=1;
                                                                tabelay:=4;

                                                        end
                                                 else
                                                 begin
                                                 if (ktorynapis = 1) and (tabelay = 4) then
                                                        begin
                                                                typowyk;          //jezeli pozycja y = 4 to przejd� w prawo
                                                                gotoxy(x-11,y+9);
                                                                write('Zako�cz');
                                                                czbk;
                                                                gotoxy(x,y+9);
                                                                write('Kontynuuj');
                                                                ktorynapis:=2;
                                                                tabelay:=4;

                                                        end;
                                                end;
                                        end;
                                'K':      //strza�ka w lewo
                                        begin
                                                if (tabelax=1) and ((tabelay = 1) or (tabelay = 2)) then  //jezeli poczatek to przejdz na koniec
                                                        begin
                                                                odswietlenie(ruchomex,ruchomey,tabela[tabelax,tabelay],ilosczad,tabelax);
                                                                ruchomex:=ruchomex+(ilosczad*4)-4;
                                                                tabelax:=ilosczad;
                                                        end
                                                else
                                                begin
                                                if (tabelax<>1) and ((tabelay = 1) or (tabelay = 2)) then //jezeli srodek to komorka w prawo
                                                        begin
                                                                odswietlenie(ruchomex,ruchomey,tabela[tabelax,tabelay],ilosczad,tabelax);
                                                                ruchomex:=ruchomex-4;
                                                                tabelax:=tabelax-1;

                                                        end;
                                                end;
                                                if (ktorynapis = 2) and (tabelay = 4) then
                                                        begin
                                                                typowyk;          //jezeli pozycja y = 4 to przejd� w lewo
                                                                gotoxy(x,y+9);
                                                                write('Kontynuuj');
                                                                czbk;
                                                                gotoxy(x-11,y+9);
                                                                write('Zako�cz');

                                                                ktorynapis:=1;

                                                        end
                                                else
                                                begin
                                                if (ktorynapis = 1) and (tabelay = 4) then
                                                        begin                        //jezeli pozycja y = 4 i koniec to przejd� w prawo
                                                                typowyk;
                                                                gotoxy(x-11,y+9);
                                                                write('Zako�cz');
                                                                czbk;
                                                                gotoxy(x,y+9);
                                                                write('Kontynuuj');
                                                                ktorynapis:=2;

                                                        end;
                                                end;
                                        end;
                        end;
                end;
                until znak=#27; //az wcisniesz escape
                typowyk;
                koniec:


                odp:=pkoncowen_tlo(1,35,1);
                assign(t1,'logi\logi_punkty.txt');
                append(t1);
                odp:=upcase(odp);
                if (odp = 'J') or (odp = 'M') then
                begin
                        // zapis do pliku tekstowego

                        write(t1, godzina,' - ');
                        writeln(t1, 'Zapisano zmienne: ');
                        for licznik:=1 to ilosczad do writeln(t1,'           ','Zadanie nr ',licznik,', ',tabela[licznik,2],'/',tabela[licznik,1],', ',tabela[licznik,3],'%');

                        writeln(t1, '           Ocena: ',procent:1:dokl,'% - ',ocena);
                        writeln(t1);
                        gotoxy(x-11,y+9);
                        write('Zako�cz');

                        gotoxy(x+12,y+11);                        //czyszczenie pola komunikatu
                        writeln('                                ');
                        for licznik:=1 to 7 do
                                begin
                                        gotoxy(1,35+licznik);
                                        write('                                                       ');
                                end;
                        end;
                if (odp = 'J') then
                        begin
                                wymazywanie4(27,34);
                                przel_modulu(36,36,20);

                                writeln(t1,godzina,' - Uruchomienie ponowne modulu');
                                close(t1);

                                daneu[1].nazw:='';
                                daneu[1].klasa:='';
                                daneu[1].nr:=0;
                                goto poczatek;
                        end;

                if (odp = 'M') then
                        begin
                                wymazywanie4(27,34);
                                zam_modulu(36,36,30);
                                writeln(t1,godzina, ' - Zamkniecie modulu');
                                close(t1);
                                goto koniec2;
                        end;

                writeln(t1,godzina,' - Powrot do edycji tabeli');
                close(t1);
                for licznik:=1 to 7 do
                        begin
                                gotoxy(1,35+licznik);
                                writeln('                                                     ');
                        end;
                instrukcja(1,35,'okre�lone pole','pola');
                goto pocz_tabeli;
                koniec2:
        end;
        procedure przeglad;
        var
                t1,t2,t3:text;
                a,x,y,licznik,lista,polozenie:integer;
                klawisz,znak:char;
                rozszerzony:boolean;
                linia,kod,wzoropen,wzordel:string;
        label
                poczatek,
                kotwica1,
                dzialania,
                kotwica2,
                pocz_petli,
                kopia,
                usuwanie,
                koniec;

        procedure czyszczenie;
        begin
                typowyk;
                gotoxy(31,36); //czyszczenie okna komunikatu
                write('                                                  ');
                gotoxy(31,37);
                write('                                                  ');
                gotoxy(31,38);
                write('                                                  ');
        end;

        procedure kopia_pocz;
        begin
                writeln(t3);
                writeln(t3);
                writeln(t3);
                writeln(t3);
                writeln(t3);
                writeln(t3);
                writeln(t3,'<<<  Kopia zapasowa z dnia ',data,' wykonana o godzinie ',godzina,'  >>>');
                writeln(t3);
                writeln(t3);
        end;

        procedure kopia_kon;
        begin
                writeln(t3);
                writeln(t3);
                writeln(t3,'>>>  Zakonczenie materialu kopii z dnia ',data,', godziny ',godzina,'  <<<');
        end;

        procedure brakpliku;
        begin
                gotoxy(39,36);
                write(godzina,' - Brak pliku !');
        end;


        begin
        poczatek:
        clrscr;
        writeln('浜様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様融');
        writeln('�  ___                              _               _     _                                      �');
        writeln('� (  _`\                           (_ )            ( )   ( )                     //              �');
        writeln('� | |_) ) _ __  ____    __     __   | |    _ _    _| |   | |       _      __     _    _   _   _  �');
        writeln('� | ,__/`( `__)(_  ,) /`__`\ /`_ `\ | |  /`_` ) /`_` |   | |  _  /`_`\  /`_ `\ /`_`\ ( ) ( ) ( ) �');
        writeln('� | |    | |    /`/_ (  ___/( (_) | | | ( (_| |( (_| |   | |_( )( (_) )( (_) |( (_) )| \_/ \_/ | �');
        writeln('� (_)    (_)   (____)`\____)`\__  |(___)`\__,_)`\__,_)   (____/``\___/``\__  |`\___/``\___x___/` �');
        writeln('�                            ___) |                                     ___) |                   �');
        writeln('�                            \___/`                                     \___/`                   �');
        writeln('�                                                                                                �');
        writeln('藩様様様様様様様様様様様様様融   Miko�aj Stankowiak, 09.08.2012r   浜様様様様様様様様様様様様様様�');
        writeln('                             藩融                               浜夕                              ');
        writeln('                                麺様様様様様様様様様様様様様様様�                                 ');
        writeln('                                �                               �                                 ');
        writeln('                                �    Wybierz plik z logami:     �                                 ');
        writeln('                                �                               �                                 ');
        writeln('                                麺様様様様様様様様様様様様様様様�                                 ');
        writeln('       Wci�nij Enter aby        �                               �         Wpisz openbackup        ');
        writeln('          otworzy� log          �                               �        aby otworzy� kopi�       ');
        writeln('                                �                               �          zapasow� logu          ');
        writeln('                                麺様様様様様様様様様様様様様様様�                                 ');
        writeln('        Wci�nij DEL aby         �                               �        Wpisz deletebackup       ');
        writeln('          usun�� log            �                               �         aby usun�� kopi�        ');
        writeln('                                �                               �          zapasow� logu          ');
        writeln('                                麺様様様様様様様様様様様様様様様�                                 ');
        writeln('        Wci�nij ESC aby         �                               �                                 ');
        writeln('             wyj��              �                               �                                 ');
        writeln('                                �                               �                                 ');
        writeln('                                麺様様様様様様様様様様様様様様様�                                 ');
        writeln('                                �                               �                                 ');
        writeln('                                �                               �                                 ');
        writeln('                                �                               �                                 ');
        writeln('                                藩様様様様様様様様様様様様様様様�                                 ');

        cznieb;
        gotoxy(12,13);
        write('v. 2.03');
        gotoxy(16,18);
        write('ENTER');
        gotoxy(17,22);
        write('DEL');
        gotoxy(17,26);
        write('ESC');
        gotoxy(81,18);
        write('openbackup');
        gotoxy(80,22);
        write('deletebackup');
        gotoxy(32,11);
        write(#01);
        gotoxy(66,11);
        write(#01);
        typowyk;


        //jezeli nie ma pliku to go utworz
        if fsearch('logi\logi_przeglad.txt','') = '' then
                begin
                        assign(t1, 'logi\logi_przeglad.txt');
                        rewrite(t1);
                        gotoxy(31,36);
                        writeln(godzina,' - Brakuje pliku raportowego,');
                        gotoxy(37,37);
                        writeln('w�a�nie go wygenerowa�em.');

                        writeln(t1, 'Ten plik przechowuje logi modulu Przeglad Logow');
                        writeln(t1,'Data i czas wygenerowania tego pliku: ',data,', ',godzina );
                        writeln(t1,'Autor programu: Mikolaj Stankowiak');
                        close(t1);
                end;

        assign(t1, 'logi\logi_przeglad.txt');    //wpis poczatkowy
        append(t1);

        writeln(t1);
        writeln(t1);
        writeln(t1);
        writeln(t1,'Uruchomienie podprogramu Pzeglad Logow');
        writeln(t1,'Aktualna data i czas ',data,', ',godzina);
        writeln(t1,'Brak mozliwosci wyswietlenia polskich znakow !');
        writeln(t1,'Dane moga byc nieczytelne.');
        writeln(t1);
        close(t1);

        polozenie:=1;
        lista:=1;
        x:=34;
        y:=18;

        kotwica1:
        a:=0;
        kod:='';
        znak:=' ';
        klawisz:=' ';
        wzoropen:='penbackup';
        wzordel:='eletebackup';
        repeat
                begin
                        pocz_petli:
                        poziom_listyn(32,17,lista,polozenie);
                        poziom_listyn(66,17,lista,polozenie);
                        if lista = 1 then                              //wyswietlanie menu
                        begin
                                menu_podswietlenie(x,y,'Pascal MS',0);
                                menu_podswietlenie(x,y+4,'Kalkulator',0);
                                menu_podswietlenie(x,y+8,'Przelicznik Jednostek',0);
                                menu_podswietlenie(x,y+12,'Operacje na Bitach',0);

                                if polozenie = 1 then menu_podswietlenie(x,y,'Pascal MS',1);
                                if polozenie = 2 then menu_podswietlenie(x,y+4,'Kalkulator',1);
                                if polozenie = 3 then menu_podswietlenie(x,y+8,'Przelicznik Jednostek',1);
                                if polozenie = 4 then menu_podswietlenie(x,y+12,'Operacje na Bitach',1);
                        end;
                        if lista = 2 then
                        begin
                                menu_podswietlenie(x,y,'Kalkulator',0);
                                menu_podswietlenie(x,y+4,'Przelicznik Jednostek',0);
                                menu_podswietlenie(x,y+8,'Operacje na Bitach',0);
                                menu_podswietlenie(x,y+12,'Koder / Dekoder',0);

                                if polozenie = 1 then menu_podswietlenie(x,y,'Kalkulator',1);
                                if polozenie = 2 then menu_podswietlenie(x,y+4,'Przelicznik Jednostek',1);
                                if polozenie = 3 then menu_podswietlenie(x,y+8,'Operacje na Bitach',1);
                                if polozenie = 4 then menu_podswietlenie(x,y+12,'Koder / Dekoder',1);
                        end;

                        if lista = 3 then
                        begin
                                menu_podswietlenie(x,y,'Przelicznik Jednostek',0);
                                menu_podswietlenie(x,y+4,'Operacje na Bitach',0);
                                menu_podswietlenie(x,y+8,'Koder / Dekoder',0);
                                menu_podswietlenie(x,y+12,'�rednia Ocen',0);

                                if polozenie = 1 then menu_podswietlenie(x,y,'Przelicznik Jednostek',1);
                                if polozenie = 2 then menu_podswietlenie(x,y+4,'Operacje na Bitach',1);
                                if polozenie = 3 then menu_podswietlenie(x,y+8,'Koder / Dekoder',1);
                                if polozenie = 4 then menu_podswietlenie(x,y+12,'�rednia Ocen',1);
                        end;
                        if lista = 4 then
                        begin
                                menu_podswietlenie(x,y,'Operacje na Bitach',0);
                                menu_podswietlenie(x,y+4,'Koder / Dekoder',0);
                                menu_podswietlenie(x,y+8,'�rednia Ocen',0);
                                menu_podswietlenie(x,y+12,'Punkty i Ocena',0);

                                if polozenie = 1 then menu_podswietlenie(x,y,'Operacje na Bitach',1);
                                if polozenie = 2 then menu_podswietlenie(x,y+4,'Koder / Dekoder',1);
                                if polozenie = 3 then menu_podswietlenie(x,y+8,'�rednia Ocen',1);
                                if polozenie = 4 then menu_podswietlenie(x,y+12,'Punkty i Ocena',1);
                        end;
                        if lista = 5 then
                        begin
                                menu_podswietlenie(x,y,'Koder / Dekoder',0);
                                menu_podswietlenie(x,y+4,'�rednia Ocen',0);
                                menu_podswietlenie(x,y+8,'Punkty i Ocena',0);
                                menu_podswietlenie(x,y+12,'Przegl�d Log�w',0);

                                if polozenie = 1 then menu_podswietlenie(x,y,'Koder / Dekoder',1);
                                if polozenie = 2 then menu_podswietlenie(x,y+4,'�rednia Ocen',1);
                                if polozenie = 3 then menu_podswietlenie(x,y+8,'Punkty i Ocena',1);
                                if polozenie = 4 then menu_podswietlenie(x,y+12,'Przegl�d Log�w',1);
                        end;
                        if klawisz = 'o' then goto kopia;
                        if klawisz = 'd' then goto usuwanie;

                        kotwica2:
                        klawisz:=readkey;
                        czyszczenie;
                        if klawisz = chr(0) then
                                begin
                                        klawisz:=readkey;
                                        rozszerzony:=true;
                                end;

                        if klawisz = 'o' then           //otwieranie kopii zapasowej
                                begin
                                        goto pocz_petli; //powrot pozycji kursora, cofni�cie
                                        kopia:
                                        repeat
                                                begin
                                                        znak:=readkey;
                                                        kod:=kod+znak;
                                                end;
                                        until (kod ='penbackup') or (length(kod) > 9) or (kod[length(kod)] <> wzoropen[length(kod)]);
                                        if kod <> 'penbackup' then
                                        begin
                                                znak:='a';
                                                klawisz:=znak;
                                                kod:='';
                                                goto kotwica2;
                                        end;

                                        if lista = 1 then
                                        begin
                                                 if polozenie = 1 then
                                                begin
                                                        menu_podswietlenie(x,y,'Pascal MS',2);
                                                        a:=21;
                                                end;
                                                if polozenie = 2 then
                                                begin
                                                        menu_podswietlenie(x,y+4,'Kalkulator',2);
                                                        a:=22;
                                                end;
                                                if polozenie = 3 then
                                                begin
                                                        menu_podswietlenie(x,y+8,'Przelicznik Jednostek',2);
                                                        a:=23;
                                                end;
                                                if polozenie = 4 then
                                                begin
                                                        menu_podswietlenie(x,y+12,'Operacje na Bitach',2);
                                                        a:=24;
                                                end;

                                        end;
                                        if lista = 2 then
                                        begin
                                                if polozenie = 1 then
                                                begin
                                                        menu_podswietlenie(x,y,'Kalkulator',2);
                                                        a:=22;
                                                end;
                                                if polozenie = 2 then
                                                begin
                                                        menu_podswietlenie(x,y+4,'Przelicznik Jednostek',2);
                                                        a:=23;
                                                end;
                                                if polozenie = 3 then
                                                begin
                                                        menu_podswietlenie(x,y+8,'Operacje na Bitach',2);
                                                        a:=24;
                                                end;
                                                if polozenie = 4 then
                                                begin
                                                        menu_podswietlenie(x,y+12,'Koder / Dekoder',2);
                                                        a:=25;
                                                end;

                                        end;
                                        if lista = 3 then
                                        begin
                                                if polozenie = 1 then
                                                begin
                                                        menu_podswietlenie(x,y,'Przelicznik Jednostek',2);
                                                        a:=23;
                                                end;
                                                if polozenie = 2 then
                                                begin
                                                        menu_podswietlenie(x,y+4,'Operacje na Bitach',2);
                                                        a:=24;
                                                end;
                                                if polozenie = 3 then
                                                begin
                                                        menu_podswietlenie(x,y+8,'Koder / Dekoder',2);
                                                        a:=25;
                                                end;
                                                if polozenie = 4 then
                                                begin
                                                        menu_podswietlenie(x,y+12,'�rednia Ocen',2);
                                                        a:=26;
                                                end;
                                        end;
                                        if lista = 4 then
                                        begin
                                                if polozenie = 1 then
                                                begin
                                                        menu_podswietlenie(x,y,'Operacje na Bitach',2);
                                                        a:=24;
                                                end;
                                                if polozenie = 2 then
                                                begin
                                                        menu_podswietlenie(x,y+4,'Koder / Dekoder',2);
                                                        a:=25;
                                                end;
                                                if polozenie = 3 then
                                                begin
                                                        menu_podswietlenie(x,y+8,'�rednia Ocen',2);
                                                        a:=26;
                                                end;
                                                if polozenie = 4 then
                                                begin
                                                        menu_podswietlenie(x,y+12,'Punkty i Ocena',2);
                                                        a:=27;
                                                end;
                                        end;
                                        if lista = 5 then
                                        begin
                                                if polozenie = 1 then
                                                begin
                                                        menu_podswietlenie(x,y,'Koder / Dekoder',2);
                                                        a:=25;
                                                end;
                                                if polozenie = 2 then
                                                begin
                                                        menu_podswietlenie(x,y+4,'�rednia Ocen',2);
                                                        a:=26;
                                                end;
                                                if polozenie = 3 then
                                                begin
                                                        menu_podswietlenie(x,y+8,'Punkty i Ocena',2);
                                                        a:=27;
                                                end;
                                                if polozenie = 4 then
                                                begin
                                                        menu_podswietlenie(x,y+12,'Przegl�d Log�w',2);
                                                        a:=28;
                                                end;
                                        end;

                                end;
                                if klawisz = 'd' then           //otwieranie kopii zapasowej
                                begin
                                        goto pocz_petli; //powrot pozycji kursora, cofni�cie
                                        usuwanie:
                                        repeat
                                                begin
                                                        znak:=readkey;
                                                        kod:=kod+znak;
                                                end;
                                        until (kod ='eletebackup') or (length(kod) > 11) or (kod[length(kod)] <> wzordel[length(kod)]);
                                        if kod <> 'eletebackup' then
                                        begin
                                                znak:='a';
                                                klawisz:=znak;
                                                kod:='';
                                                goto kotwica2;
                                        end;

                                        if lista = 1 then
                                        begin
                                                 if polozenie = 1 then
                                                begin
                                                        menu_podswietlenie(x,y,'Pascal MS',2);
                                                        a:=31;
                                                end;
                                                if polozenie = 2 then
                                                begin
                                                        menu_podswietlenie(x,y+4,'Kalkulator',2);
                                                        a:=32;
                                                end;
                                                if polozenie = 3 then
                                                begin
                                                        menu_podswietlenie(x,y+8,'Przelicznik Jednostek',2);
                                                        a:=33;
                                                end;
                                                if polozenie = 4 then
                                                begin
                                                        menu_podswietlenie(x,y+12,'Operacje na Bitach',2);
                                                        a:=34;
                                                end;

                                        end;
                                        if lista = 2 then
                                        begin
                                                if polozenie = 1 then
                                                begin
                                                        menu_podswietlenie(x,y,'Kalkulator',2);
                                                        a:=32;
                                                end;
                                                if polozenie = 2 then
                                                begin
                                                        menu_podswietlenie(x,y+4,'Przelicznik Jednostek',2);
                                                        a:=33;
                                                end;
                                                if polozenie = 3 then
                                                begin
                                                        menu_podswietlenie(x,y+8,'Operacje na Bitach',2);
                                                        a:=34;
                                                end;
                                                if polozenie = 4 then
                                                begin
                                                        menu_podswietlenie(x,y+12,'Koder / Dekoder',2);
                                                        a:=35;
                                                end;

                                        end;
                                        if lista = 3 then
                                        begin
                                                if polozenie = 1 then
                                                begin
                                                        menu_podswietlenie(x,y,'Przelicznik Jednostek',2);
                                                        a:=33;
                                                end;
                                                if polozenie = 2 then
                                                begin
                                                        menu_podswietlenie(x,y+4,'Operacje na Bitach',2);
                                                        a:=34;
                                                end;
                                                if polozenie = 3 then
                                                begin
                                                        menu_podswietlenie(x,y+8,'Koder / Dekoder',2);
                                                        a:=35;
                                                end;
                                                if polozenie = 4 then
                                                begin
                                                        menu_podswietlenie(x,y+12,'�rednia Ocen',2);
                                                        a:=36;
                                                end;
                                        end;
                                        if lista = 4 then
                                        begin
                                                if polozenie = 1 then
                                                begin
                                                        menu_podswietlenie(x,y,'Operacje na Bitach',2);
                                                        a:=34;
                                                end;
                                                if polozenie = 2 then
                                                begin
                                                        menu_podswietlenie(x,y+4,'Koder / Dekoder',2);
                                                        a:=35;
                                                end;
                                                if polozenie = 3 then
                                                begin
                                                        menu_podswietlenie(x,y+8,'�rednia Ocen',2);
                                                        a:=36;
                                                end;
                                                if polozenie = 4 then
                                                begin
                                                        menu_podswietlenie(x,y+12,'Punkty i Ocena',2);
                                                        a:=37;
                                                end;
                                        end;
                                        if lista = 5 then
                                        begin
                                                if polozenie = 1 then
                                                begin
                                                        menu_podswietlenie(x,y,'Koder / Dekoder',2);
                                                        a:=35;
                                                end;
                                                if polozenie = 2 then
                                                begin
                                                        menu_podswietlenie(x,y+4,'�rednia Ocen',2);
                                                        a:=36;
                                                end;
                                                if polozenie = 3 then
                                                begin
                                                        menu_podswietlenie(x,y+8,'Punkty i Ocena',2);
                                                        a:=37;
                                                end;
                                                if polozenie = 4 then
                                                begin
                                                        menu_podswietlenie(x,y+12,'Przegl�d Log�w',2);
                                                        a:=38;
                                                end;
                                        end;

                                end;

                        if klawisz = #13 then
                                begin
                                        if lista = 1 then
                                        begin
                                                if polozenie = 1 then
                                                begin
                                                        menu_podswietlenie(x,y,'Mascal MS',2);
                                                        a:=1;
                                                end;
                                                if polozenie = 2 then
                                                begin
                                                        menu_podswietlenie(x,y+4,'Kalkulator',2);
                                                        a:=2;
                                                end;
                                                if polozenie = 3 then
                                                begin
                                                        menu_podswietlenie(x,y+8,'Przelicznik Jednostek',2);
                                                        a:=3;
                                                end;
                                                if polozenie = 4 then
                                                begin
                                                        menu_podswietlenie(x,y+12,'Operacje na Bitach',2);
                                                        a:=4;
                                                end;
                                        end;

                                        if lista = 2 then
                                        begin
                                                if polozenie = 1 then
                                                begin
                                                        menu_podswietlenie(x,y,'Kalkulator',2);
                                                        a:=2;
                                                end;
                                                if polozenie = 2 then
                                                begin
                                                        menu_podswietlenie(x,y+4,'Przelicznik Jednostek',2);
                                                        a:=3;
                                                end;
                                                if polozenie = 3 then
                                                begin
                                                        menu_podswietlenie(x,y+8,'Operacje na Bitach',2);
                                                        a:=4;
                                                end;
                                                if polozenie = 4 then
                                                begin
                                                        menu_podswietlenie(x,y+12,'Koder / Dekoder',2);
                                                        a:=5;
                                                end;
                                        end;
                                        if lista = 3 then
                                        begin
                                                if polozenie = 1 then
                                                begin
                                                        menu_podswietlenie(x,y,'Przelicznik Jednostek',2);
                                                        a:=3;
                                                end;
                                                if polozenie = 2 then
                                                begin
                                                        menu_podswietlenie(x,y+4,'Operacje na Bitach',2);
                                                        a:=4;
                                                end;
                                                if polozenie = 3 then
                                                begin
                                                        menu_podswietlenie(x,y+8,'Koder / Dekoder',2);
                                                        a:=5;
                                                end;
                                                if polozenie = 4 then
                                                begin
                                                        menu_podswietlenie(x,y+12,'�rednia Ocen',2);
                                                        a:=6;
                                                end;
                                        end;
                                        if lista = 4 then
                                        begin
                                                if polozenie = 1 then
                                                begin
                                                        menu_podswietlenie(x,y,'Operacje na Bitach',2);
                                                        a:=4;
                                                end;
                                                if polozenie = 2 then
                                                begin
                                                        menu_podswietlenie(x,y+4,'Koder / Dekoder',2);
                                                        a:=5;
                                                end;
                                                if polozenie = 3 then
                                                begin
                                                        menu_podswietlenie(x,y+8,'�rednia Ocen',2);
                                                        a:=6;
                                                end;
                                                if polozenie = 4 then
                                                begin
                                                        menu_podswietlenie(x,y+12,'Punkty i Ocena',2);
                                                        a:=7;
                                                end;
                                        end;
                                        if lista = 5 then
                                        begin
                                                if polozenie = 1 then
                                                begin
                                                        menu_podswietlenie(x,y,'Koder / Dekoder',2);
                                                        a:=5;
                                                end;
                                                if polozenie = 2 then
                                                begin
                                                        menu_podswietlenie(x,y+4,'�rednia Ocen',2);
                                                        a:=6;
                                                end;
                                                if polozenie = 3 then
                                                begin
                                                        menu_podswietlenie(x,y+8,'Punkty i Ocena',2);
                                                        a:=7;
                                                end;
                                                if polozenie = 4 then
                                                begin
                                                        menu_podswietlenie(x,y+12,'Przegl�d Log�w',2);
                                                        a:=8;
                                                end;
                                        end;
                                end;


                        if (klawisz = 'S') and (rozszerzony = true) then
                                begin
                                        if lista = 1 then
                                        begin
                                                 if polozenie = 1 then
                                                begin
                                                        menu_podswietlenie(x,y,'Pascal MS',2);
                                                        a:=11;
                                                end;
                                                if polozenie = 2 then
                                                begin
                                                        menu_podswietlenie(x,y,'Kalkulator',2);
                                                        a:=12;
                                                end;
                                                if polozenie = 3 then
                                                begin
                                                        menu_podswietlenie(x,y+4,'Przelicznik Jednostek',2);
                                                        a:=13;
                                                end;
                                                if polozenie = 4 then
                                                begin
                                                        menu_podswietlenie(x,y+8,'Operacje na Bitach',2);
                                                        a:=14;
                                                end;

                                        end;
                                        if lista = 2 then
                                        begin
                                                if polozenie = 1 then
                                                begin
                                                        menu_podswietlenie(x,y,'Kalkulator',2);
                                                        a:=12;
                                                end;
                                                if polozenie = 2 then
                                                begin
                                                        menu_podswietlenie(x,y+4,'Przelicznik Jednostek',2);
                                                        a:=13;
                                                end;
                                                if polozenie = 3 then
                                                begin
                                                        menu_podswietlenie(x,y+8,'Operacje na Bitach',2);
                                                        a:=14;
                                                end;
                                                if polozenie = 4 then
                                                begin
                                                        menu_podswietlenie(x,y+12,'Koder / Dekoder',2);
                                                        a:=15;
                                                end;

                                        end;
                                        if lista = 3 then
                                        begin
                                                if polozenie = 1 then
                                                begin
                                                        menu_podswietlenie(x,y,'Przelicznik Jednostek',2);
                                                        a:=13;
                                                end;
                                                if polozenie = 2 then
                                                begin
                                                        menu_podswietlenie(x,y+4,'Operacje na Bitach',2);
                                                        a:=14;
                                                end;
                                                if polozenie = 3 then
                                                begin
                                                        menu_podswietlenie(x,y+8,'Koder / Dekoder',2);
                                                        a:=15;
                                                end;
                                                if polozenie = 4 then
                                                begin
                                                        menu_podswietlenie(x,y+12,'�rednia Ocen',2);
                                                        a:=16;
                                                end;
                                        end;
                                        if lista = 4 then
                                        begin
                                                if polozenie = 1 then
                                                begin
                                                        menu_podswietlenie(x,y,'Operacje na Bitach',2);
                                                        a:=14;
                                                end;
                                                if polozenie = 2 then
                                                begin
                                                        menu_podswietlenie(x,y+4,'Koder / Dekoder',2);
                                                        a:=15;
                                                end;
                                                if polozenie = 3 then
                                                begin
                                                        menu_podswietlenie(x,y+8,'�rednia Ocen',2);
                                                        a:=16;
                                                end;
                                                if polozenie = 4 then
                                                begin
                                                        menu_podswietlenie(x,y+12,'Punkty i Ocena',2);
                                                        a:=17;
                                                end;
                                        end;
                                        if lista = 5 then
                                        begin
                                                if polozenie = 1 then
                                                begin
                                                        menu_podswietlenie(x,y,'Koder / Dekoder',2);
                                                        a:=15;
                                                end;
                                                if polozenie = 2 then
                                                begin
                                                        menu_podswietlenie(x,y+4,'�rednia Ocen',2);
                                                        a:=16;
                                                end;
                                                if polozenie = 3 then
                                                begin
                                                        menu_podswietlenie(x,y+8,'Punkty i Ocena',2);
                                                        a:=17;
                                                end;
                                                if polozenie = 4 then
                                                begin
                                                        menu_podswietlenie(x,y+12,'Przegl�d Log�w',2);
                                                        a:=18;
                                                end;
                                        end;

                                end;

                        if (klawisz <> #13) and (klawisz <> 'S') then
                        begin

                                case klawisz of
                                        'H':       //strza�ka w g�r�
                                                 begin
                                                        if polozenie = 1 then
                                                        begin
                                                                if lista > 1 then lista:=lista-1;
                                                        end
                                                        else polozenie:=polozenie-1;
                                                 end;
                                        'P':       //strza�ka w d��
                                                begin
                                                        if polozenie = 4 then
                                                        begin
                                                                if lista < 5 then lista:=lista+1;
                                                        end
                                                        else polozenie:=polozenie+1;
                                                end;
                                        end;
                        end;


                end;
        until (klawisz = #27) or (klawisz = #13) or ((klawisz = 'S') and (rozszerzony = true)) or (klawisz = 'o') or (klawisz = 'd');

        assign(t1,'logi\logi_przeglad.txt');
        append(t1);

        if a = 0 then goto dzialania;
        if (a = 1) or (a = 11) then        //sprawdzanie czy potrzebny plik istnieje
                begin
                if fsearch('logi\logi_pas_ms.txt','') = '' then
                        begin
                                writeln(t1,godzina,' - Brak pliku logow aplikacji Pascal MS');
                                close(t1);
                                brakpliku;
                                goto kotwica1;
                        end;
                end;
        if (a = 2) or (a = 12) then        //sprawdzanie czy potrzebny plik istnieje
                begin
                if fsearch('logi\logi_kalk.txt','') = '' then
                        begin
                                writeln(t1,godzina,' - Brak pliku logow modulu Kalkulator');
                                close(t1);
                                brakpliku;
                                goto kotwica1;
                        end;
                end;

        if (a = 3) or (a = 13) then        //sprawdzanie czy potrzebny plik istnieje
                begin
                if fsearch('logi\logi_pj.txt','') = '' then
                        begin
                                writeln(t1,godzina,' - Brak pliku logow modulu Przelicznik Jednostek');
                                close(t1);
                                brakpliku;
                                goto kotwica1;
                        end;
                end;

         if (a = 4) or (a = 14) then        //sprawdzanie czy potrzebny plik istnieje
                begin
                if fsearch('logi\logi_opbit.txt','') = '' then
                        begin
                                writeln(t1,godzina,' - Brak pliku logow modulu Operacje na Bitach');
                                close(t1);
                                brakpliku;
                                goto kotwica1;
                        end;
                end;

         if (a = 5) or (a = 15) then        //sprawdzanie czy potrzebny plik istnieje
                begin
                if fsearch('logi\logi_kd.txt','') = '' then
                        begin
                                writeln(t1,godzina,' - Brak pliku logow modulu Koder / Dekoder');
                                close(t1);
                                brakpliku;
                                goto kotwica1;
                        end;
                end;

         if (a = 6) or (a = 16) then        //sprawdzanie czy potrzebny plik istnieje
                begin
                if fsearch('logi\logi_srednia.txt','') = '' then
                        begin
                                writeln(t1,godzina,' - Brak pliku logow modulu Srednia Ocen');
                                close(t1);
                                brakpliku;
                                goto kotwica1;
                        end;
                end;
         if (a = 7) or (a = 17) then        //sprawdzanie czy potrzebny plik istnieje
                begin
                if fsearch('logi\logi_punkty.txt','') = '' then
                        begin
                                writeln(t1,godzina,' - Brak pliku logow modulu Punkty i Ocena');
                                close(t1);
                                brakpliku;
                                goto kotwica1;
                        end;
                end;
        if (a = 21) or (a = 31) then        //sprawdzanie czy potrzebny plik istnieje
                begin
                if fsearch('logi\kopie_z\kopia_z_pas_ms.txt','') = '' then
                        begin
                                writeln(t1,godzina,' - Brak pliku kopii zapasowej logow aplikacji');
                                writeln(t1,'           Pascal MS');
                                close(t1);
                                brakpliku;
                                goto kotwica1;
                        end;
                end;
        if (a = 22) or (a = 32) then        //sprawdzanie czy potrzebny plik istnieje
                begin
                if fsearch('logi\kopie_z\kopia_z_kalk.txt','') = '' then
                        begin
                                writeln(t1,godzina,' - Brak pliku kopii zapasowej logow modulu');
                                writeln(t1,'           Kalkulator');
                                close(t1);
                                brakpliku;
                                goto kotwica1;
                        end;
                end;

        if (a = 23) or (a = 33)  then        //sprawdzanie czy potrzebny plik istnieje
                begin
                if fsearch('logi\kopie_z\kopia_z_pj.txt','') = '' then
                        begin
                                writeln(t1,godzina,' - Brak pliku kopii zapasowej logow modulu');
                                writeln(t1,'           Przelicznik Jednostek');
                                close(t1);
                                brakpliku;
                                goto kotwica1;
                        end;
                end;

         if (a = 24) or (a = 34) then        //sprawdzanie czy potrzebny plik istnieje
                begin
                if fsearch('logi\kopie_z\kopia_z_opbit.txt','') = '' then
                        begin
                                writeln(t1,godzina,' - Brak pliku kopii zapasowej logow modulu');
                                writeln(t1,'           Operacje na Bitach');
                                close(t1);
                                brakpliku;
                                goto kotwica1;
                        end;
                end;

         if (a = 25) or (a = 35) then        //sprawdzanie czy potrzebny plik istnieje
                begin
                if fsearch('logi\kopie_z\kopia_z_kd.txt','') = '' then
                        begin
                                writeln(t1,godzina,' - Brak pliku kopii zapasowej logow modulu');
                                writeln(t1,'           Koder / Dekoder');
                                close(t1);
                                brakpliku;
                                goto kotwica1;
                        end;
                end;

         if (a = 26) or (a = 36) then        //sprawdzanie czy potrzebny plik istnieje
                begin
                if fsearch('logi\kopie_z\kopia_z_srednia.txt','') = '' then
                        begin
                                writeln(t1,godzina,' - Brak pliku kopii zapasowej logow modulu');
                                writeln(t1,'           Srednia Ocen');
                                close(t1);
                                brakpliku;
                                goto kotwica1;
                        end;
                end;
         if (a = 27) or (a = 37) then        //sprawdzanie czy potrzebny plik istnieje
                begin
                if fsearch('logi\kopie_z\kopia_z_punkty.txt','') = '' then
                        begin
                                writeln(t1,godzina,' - Brak pliku kopii zapasowej logow modulu');
                                writeln(t1,'           Srednia Ocen');
                                close(t1);
                                brakpliku;
                                goto kotwica1;
                        end;
                end;
         if (a = 28) or (a = 38) then        //sprawdzanie czy potrzebny plik istnieje
                begin
                if fsearch('logi\kopie_z\kopia_z_punkty.txt','') = '' then
                        begin
                                writeln(t1,godzina,' - Brak pliku kopii zapasowej logow modulu');
                                writeln(t1,'           Przeglad Logow');
                                close(t1);
                                brakpliku;
                                goto kotwica1;
                        end;
                end;
        if klawisz = 'S' then        //klawisz rozszerzony Del
                begin
                        gotoxy(37,36);
                        write(godzina,' - Czy usun�� logi');
                        gotoxy(38,37);
                        write('wybranego pliku (');
                        cznieb;
                        write('t');
                        typowyk;
                        write('/');
                        cznieb;
                        write('n');
                        typowyk;
                        write(') ?');
                        znak:=readkey;
                        czyszczenie;
                         if znak <>'t' then
                                begin
                                        close(t1);
                                        goto kotwica1;
                                end;
                        gotoxy(34,36);
                        write(godzina,' - Pomy�lnie usuni�to !');
                end;
        if klawisz = 'd' then
                begin
                        gotoxy(37,36);
                        write(godzina,' - Czy usun�� logi');
                        gotoxy(38,37);
                        write('wybranej kopii zapasowej ');
                        gotoxy(44,38);
                        write('pliku (');
                        cznieb;
                        write('t');
                        typowyk;
                        write('/');
                        cznieb;
                        write('n');
                        typowyk;
                        write(') ?');
                        znak:=readkey;
                        czyszczenie;
                        if znak <>'t' then
                                begin
                                        close(t1);
                                        goto kotwica1;
                                end;
                        gotoxy(34,36);
                        write(godzina,' - Pomy�lnie usuni�to !');
                end;

        dzialania:                                  //wszystkie dzialania
        case a of
                0:
                  begin
                        gotoxy(33,36);
                        write(godzina,' - Czy zako�czy� (');
                        cznieb;
                        write('t');
                        typowyk;
                        write('/');
                        cznieb;
                        write('n');
                        typowyk;
                        write(') ?');
                        znak:=readkey;
                        czyszczenie;
                        if znak<>'t' then
                                begin
                                        close(t1);
                                        goto kotwica1;
                                end;

                        writeln(t1,godzina,' - Zamkniecie  Przegladu Logow');
                        close(t1);
                        wymazywanie4(27,35);
                        zam_modulu(39,36,30);
                        goto koniec;
                  end;
                  1:                               //otwieranie plik�w
                  begin
                        writeln(t1,godzina,' - Otwarcie logow aplikacji Pascal MS');
                        close(t1);
                        exec('C:\Windows\System32\notepad.exe','logi\logi_pas_ms.txt');
                        goto kotwica1;
                  end;
                 2:
                  begin
                        writeln(t1,godzina,' - Otwarcie logow modulu Kalkulator');
                        close(t1);
                        exec('C:\Windows\System32\notepad.exe','logi\logi_kalk.txt');
                        goto kotwica1;
                  end;
                 3:
                  begin
                        writeln(t1,godzina,' - Otwarcie logow modulu Przelicznik Jednostek');
                        close(t1);
                        exec('C:\Windows\System32\notepad.exe','logi\logi_pj.txt');
                        goto kotwica1;
                  end;
                 4:
                  begin
                        writeln(t1,godzina,' - Otwarcie logow modulu Operacje na Bitach');
                        close(t1);
                        exec('C:\Windows\System32\notepad.exe','logi\logi_opbit.txt');
                        goto kotwica1;
                  end;
                 5:
                  begin
                        writeln(t1,godzina,' - Otwarcie logow modulu Koder/Dekoder');
                        close(t1);
                        exec('C:\Windows\System32\notepad.exe','logi\logi_kd.txt');
                        goto kotwica1;
                  end;
                 6:
                  begin
                        writeln(t1,godzina,' - Otwarcie logow modulu Srednia Ocen');
                        close(t1);
                        exec('C:\Windows\System32\notepad.exe','logi\logi_srednia.txt');
                        goto kotwica1;
                  end;
                 7:
                  begin
                        writeln(t1,godzina,' - Otwarcie logow modulu Punkty i Ocena');
                        close(t1);
                        exec('C:\Windows\System32\notepad.exe','logi\logi_punkty.txt');
                        goto kotwica1;
                  end;
                 8:
                  begin
                        writeln(t1,godzina,' - Otwarcie logow modulu Przeglad logow');
                        close(t1);
                        exec('C:\Windows\System32\notepad.exe','logi\logi_przeglad.txt');
                        goto kotwica1;
                  end;
                 11:                                 //usuwanie i kopia bezpiecze�stwa
                  begin
                        writeln(t1,godzina,' - Tworzenie kopii zapasowej logow aplikacji');
                        writeln(t1,'           Pascal MS i usuwanie pliku');
                        close(t1);

                        assign(t2,'logi\logi_pas_ms.txt');
                        reset(t2);

                        if fsearch('logi\kopie_z\kopia_z_pas_ms.txt','') = '' then
                        begin
                                assign(t3, 'logi\kopie_z\kopia_z_pas_ms.txt');
                                rewrite(t3);

                                writeln(t3, 'Ten plik przechowuje kopie zapasowe logow aplikacji Pascal MS');
                                writeln(t3,'Data i czas wygenerowania tego pliku: ',data,', ',godzina );
                                writeln(t3,'Autor programu: Mikolaj Stankowiak');
                                close(t3);
                        end;
                        assign(t3,'logi\kopie_z\kopia_z_pas_ms.txt');
                        append(t3);
                        kopia_pocz;

                        repeat
                                begin
                                        readln(t2,linia);
                                        writeln(t3,linia);
                                end;
                        until eof(t2);

                        kopia_kon;
                        close(t3);
                        close(t2);
                        exec('C:\Windows\System32\cmd.exe','/C del logi\logi_pas_ms.txt');

                        assign(t1, 'logi\logi_pas_ms.txt');
                        rewrite(t1);

                        writeln(t1, 'Ten plik przechowuje logi aplikacji Pascal MS');
                        writeln(t1,'Data i czas wygenerowania tego pliku: ',data,', ',godzina );
                        writeln(t1,'Autor programu: Mikolaj Stankowiak');
                        writeln(t1);
                        writeln(t1);
                        writeln(t1);
                        writeln(t1,godzina,' - Oczyszczenie wczesniejszych wpisow');
                        close(t1);
                        goto kotwica1;
                  end;
                 12:
                  begin
                        writeln(t1,godzina,' - Tworzenie kopii zapasowej logow modulu');
                        writeln(t1,'           Kalkulator i usuwanie pliku');
                        close(t1);

                        assign(t2,'logi\logi_kalk.txt');
                        reset(t2);

                        if fsearch('logi\kopie_z\kopia_z_kalk.txt','') = '' then
                        begin
                                assign(t3, 'logi\kopie_z\kopia_z_kalk.txt');
                                rewrite(t3);

                                writeln(t3, 'Ten plik przechowuje kopie zapasowe logow modulu Kalkulator');
                                writeln(t3,'Data i czas wygenerowania tego pliku: ',data,', ',godzina );
                                writeln(t3,'Autor programu: Mikolaj Stankowiak');
                                close(t3);
                        end;
                        assign(t3,'logi\kopie_z\kopia_z_kalk.txt');
                        append(t3);
                        kopia_pocz;

                        repeat
                                begin
                                        readln(t2,linia);
                                        writeln(t3,linia);
                                end;
                        until eof(t2);

                        kopia_kon;
                        close(t3);
                        close(t2);
                        exec('C:\Windows\System32\cmd.exe','/C del logi\logi_kalk.txt');
                        goto kotwica1;
                  end;
                 13:
                  begin
                        writeln(t1,godzina,' - Tworzenie kopii zapasowej logow modulu');
                        writeln(t1,'           Przelicznik Jednostek i usuwanie pliku');
                        close(t1);

                        assign(t2,'logi\logi_pj.txt');
                        reset(t2);

                        if fsearch('logi\kopie_z\kopia_z_pj.txt','') = '' then
                        begin
                                assign(t3, 'logi\kopie_z\kopia_z_pj.txt');
                                rewrite(t3);

                                writeln(t3,'Ten plik przechowuje kopie zapasowe logow modulu Przelicznik Jednostek');
                                writeln(t3,'Data i czas wygenerowania tego pliku: ',data,', ',godzina );
                                writeln(t3,'Autor programu: Mikolaj Stankowiak');
                                close(t3);
                        end;
                        assign(t3,'logi\kopie_z\kopia_z_pj.txt');
                        append(t3);
                        kopia_pocz;

                        repeat
                                begin
                                        readln(t2,linia);
                                        writeln(t3,linia);
                                end;
                        until eof(t2);

                        kopia_kon;
                        close(t3);
                        close(t2);
                        exec('C:\Windows\System32\cmd.exe','/C del logi\logi_pj.txt');
                        goto kotwica1;
                  end;
                 14:
                  begin
                        writeln(t1,godzina,' - Tworzenie kopii zapasowej logow modulu');
                        writeln(t1,'           Operacje na Bitach i usuwanie pliku');
                        close(t1);

                        assign(t2,'logi\logi_opbit.txt');
                        reset(t2);

                        if fsearch('logi\kopie_z\kopia_z_opbit.txt','') = '' then
                        begin
                                assign(t3, 'logi\kopie_z\kopia_z_opbit.txt');
                                rewrite(t3);

                                writeln(t3,'Ten plik przechowuje kopie zapasowe logow modulu Operacje na Bitach');
                                writeln(t3,'Data i czas wygenerowania tego pliku: ',data,', ',godzina );
                                writeln(t3,'Autor programu: Mikolaj Stankowiak');
                                close(t3);
                        end;
                        assign(t3,'logi\kopie_z\kopia_z_opbit.txt');
                        append(t3);
                        kopia_pocz;

                        repeat
                                begin
                                        readln(t2,linia);
                                        writeln(t3,linia);
                                end;
                        until eof(t2);

                        kopia_kon;
                        close(t3);
                        close(t2);
                        exec('C:\Windows\System32\cmd.exe','/C del logi\logi_opbit.txt');
                        goto kotwica1;
                  end;
                 15:
                  begin
                        writeln(t1,godzina,' - Tworzenie kopii zapasowej logow modulu');
                        writeln(t1,'           Koder / Dekoder i usuwanie pliku');
                        close(t1);

                        assign(t2,'logi\logi_kd.txt');
                        reset(t2);

                        if fsearch('logi\kopie_z\kopia_z_kd.txt','') = '' then
                        begin
                                assign(t3, 'logi\kopie_z\kopia_z_kd.txt');
                                rewrite(t3);

                                writeln(t3,'Ten plik przechowuje kopie zapasowe logow modulu Koder / Dekoder');
                                writeln(t3,'Data i czas wygenerowania tego pliku: ',data,', ',godzina );
                                writeln(t3,'Autor programu: Mikolaj Stankowiak');
                                close(t3);
                        end;
                        assign(t3,'logi\kopie_z\kopia_z_kd.txt');
                        append(t3);
                        kopia_pocz;

                        repeat
                                begin
                                        readln(t2,linia);
                                        writeln(t3,linia);
                                end;
                        until eof(t2);

                        kopia_kon;
                        close(t3);
                        close(t2);
                        exec('C:\Windows\System32\cmd.exe','/C del logi\logi_kd.txt');
                        goto kotwica1;
                  end;
                 16:
                  begin
                        writeln(t1,godzina,' - Tworzenie kopii zapasowej logow modulu');
                        writeln(t1,'           Srednia Ocen i usuwanie pliku');
                        close(t1);

                        assign(t2,'logi\logi_srednia.txt');
                        reset(t2);

                        if fsearch('logi\kopie_z\kopia_z_srednia.txt','') = '' then
                        begin
                                assign(t3, 'logi\kopie_z\kopia_z_srednia.txt');
                                rewrite(t3);

                                writeln(t3,'Ten plik przechowuje kopie zapasowe logow modulu Srednia Ocen');
                                writeln(t3,'Data i czas wygenerowania tego pliku: ',data,', ',godzina );
                                writeln(t3,'Autor programu: Mikolaj Stankowiak');
                                close(t3);
                        end;
                        assign(t3,'logi\kopie_z\kopia_z_srednia.txt');
                        append(t3);
                        kopia_pocz;

                        repeat
                                begin
                                        readln(t2,linia);
                                        writeln(t3,linia);
                                end;
                        until eof(t2);

                        kopia_kon;
                        close(t3);
                        close(t2);
                        exec('C:\Windows\System32\cmd.exe','/C del logi\logi_srednia.txt');
                        goto kotwica1;
                  end;
                 17:
                  begin
                        writeln(t1,godzina,' - Tworzenie kopii zapasowej logow modulu');
                        writeln(t1,'           Punkty i Ocena i usuwanie pliku');
                        close(t1);

                        assign(t2,'logi\logi_punkty.txt');
                        reset(t2);

                        if fsearch('logi\kopie_z\kopia_z_punkty.txt','') = '' then
                        begin
                                assign(t3, 'logi\kopie_z\kopia_z_punkty.txt');
                                rewrite(t3);

                                writeln(t3,'Ten plik przechowuje kopie zapasowe logow modulu Pubkty i Ocena');
                                writeln(t3,'Data i czas wygenerowania tego pliku: ',data,', ',godzina );
                                writeln(t3,'Autor programu: Mikolaj Stankowiak');
                                close(t3);
                        end;
                        assign(t3,'logi\kopie_z\kopia_z_punkty.txt');
                        append(t3);
                        kopia_pocz;

                        repeat
                                begin
                                        readln(t2,linia);
                                        writeln(t3,linia);
                                end;
                        until eof(t2);

                        kopia_kon;
                        close(t3);
                        close(t2);
                        exec('C:\Windows\System32\cmd.exe','/C del logi\logi_punkty.txt');
                        goto kotwica1;
                  end;
                 18:                                 //usuwanie i kopia bezpiecze�stwa
                  begin

                        close(t1);

                        assign(t2,'logi\logi_przeglad.txt');
                        reset(t2);

                        if fsearch('logi\kopie_z\kopia_z_przeglad.txt','') = '' then
                        begin
                                assign(t3, 'logi\kopie_z\kopia_z_przeglad.txt');
                                rewrite(t3);

                                writeln(t3,'Ten plik przechowuje kopie zapasowe logow modulu Przeglad Logow');
                                writeln(t3,'Data i czas wygenerowania tego pliku: ',data,', ',godzina );
                                writeln(t3,'Autor programu: Mikolaj Stankowiak');
                                close(t3);
                        end;
                        assign(t3,'logi\kopie_z\kopia_z_przeglad.txt');
                        append(t3);
                        kopia_pocz;

                        repeat
                                begin
                                        readln(t2,linia);
                                        writeln(t3,linia);
                                end;
                        until eof(t2);

                        kopia_kon;
                        close(t3);
                        close(t2);
                        exec('C:\Windows\System32\cmd.exe','/C del logi\logi_przeglad.txt');

                        assign(t1, 'logi\logi_przeglad.txt');
                        rewrite(t1);
                        writeln(t1, 'Ten plik przechowuje logi modulu Przeglad Logow');
                        writeln(t1,'Data i czas wygenerowania tego pliku: ',data,', ',godzina );
                        writeln(t1,'Autor programu: Mikolaj Stankowiak');
                        writeln(t1);
                        writeln(t1);
                        writeln(t1);
                        writeln(t1,godzina,' - Oczyszczenie wczesniejszych wpisow');
                        close(t1);
                        goto kotwica1;
                  end;
                 21:                  //otwarciue plik�w kopii zapasowej
                  begin
                        writeln(t1,godzina,' - Otwarcie logow kopii zapasowej aplikacji');
                        writeln(t1,'           Pascal MS');
                        close(t1);
                        exec('C:\Windows\System32\notepad.exe','logi\kopie_z\kopia_z_pas_ms.txt');
                        goto kotwica1;
                  end;
                 22:
                  begin
                        writeln(t1,godzina,' - Otwarcie logow kopii zapasowej modulu');
                        writeln(t1,'           Kalkulator');
                        close(t1);
                        exec('C:\Windows\System32\notepad.exe','logi\kopie_z\kopia_z_kalk.txt');
                        goto kotwica1;
                  end;
                 23:
                  begin
                        writeln(t1,godzina,' - Otwarcie logow kopii zapasowej modulu');
                        writeln(t1,'           Przelicznik Jednostek');
                        close(t1);
                        exec('C:\Windows\System32\notepad.exe','logi\kopie_z\kopia_z_pj.txt');
                        goto kotwica1;
                  end;
                 24:
                  begin
                        writeln(t1,godzina,' - Otwarcie logow kopii zapasowej modulu');
                        writeln(t1,'           Operacje na bitach');
                        close(t1);
                        exec('C:\Windows\System32\notepad.exe','logi\kopie_z\kopia_z_opbit.txt');
                        goto kotwica1;
                  end;
                 25:
                  begin
                        writeln(t1,godzina,' - Otwarcie logow kopii zapasowej modulu');
                        writeln(t1,'           Koder / Dekoder');
                        close(t1);
                        exec('C:\Windows\System32\notepad.exe','logi\kopie_z\kopia_z_kd.txt');
                        goto kotwica1;
                  end;
                 26:
                  begin
                        writeln(t1,godzina,' - Otwarcie logow kopii zapasowej modulu');
                        writeln(t1,'           Srednia Ocen');
                        close(t1);
                        exec('C:\Windows\System32\notepad.exe','logi\kopie_z\kopia_z_srednia.txt');
                        goto kotwica1;
                  end;
                 27:
                  begin
                        writeln(t1,godzina,' - Otwarcie logow kopii zapasowej modulu');
                        writeln(t1,'           Punkty i Ocena');
                        close(t1);
                        exec('C:\Windows\System32\notepad.exe','logi\kopie_z\kopia_z_punkty.txt');
                        goto kotwica1;
                  end;
                 28:
                  begin
                        writeln(t1,godzina,' - Otwarcie logow kopii zapasowej modulu');
                        writeln(t1,'           Przeglad Logow');
                        close(t1);
                        exec('C:\Windows\System32\notepad.exe','logi\kopie_z\kopia_z_punkty.txt');
                        goto kotwica1;
                  end;
                  31:
                   begin
                        writeln(t1,godzina,' - Usuniecie logow kopii zapasowej aplikacji');
                        writeln(t1,'           Pascal MS');
                        close(t1);
                        exec('C:\Windows\System32\cmd.exe','/C del logi\kopie_z\kopia_z_pas_ms.txt');
                        goto kotwica1;
                   end;
                  32:                    //usuwanie kopii zapasowej log�w
                   begin
                        writeln(t1,godzina,' - Usuniecie logow kopii zapasowej modulu');
                        writeln(t1,'           Kalkulator');
                        close(t1);
                        exec('C:\Windows\System32\cmd.exe','/C del logi\kopie_z\kopia_z_kalk.txt');
                        goto kotwica1;
                   end;
                  33:
                   begin
                        writeln(t1,godzina,' - Usuniecie logow kopii zapasowej modulu');
                        writeln(t1,'           Przelicznik Jednostek');
                        close(t1);
                        exec('C:\Windows\System32\cmd.exe','/C del logi\kopie_z\kopia_z_pj.txt');
                        goto kotwica1;
                   end;
                  34:
                   begin
                        writeln(t1,godzina,' - Usuniecie logow kopii zapasowej modulu');
                        writeln(t1,'           Operacje na Bitach');
                        close(t1);
                        exec('C:\Windows\System32\cmd.exe','/C del logi\kopie_z\kopia_z_opbit.txt');
                        goto kotwica1;
                   end;
                  35:
                   begin
                        writeln(t1,godzina,' - Usuniecie logow kopii zapasowej modulu');
                        writeln(t1,'           Koder / Dekoder');
                        close(t1);
                        exec('C:\Windows\System32\cmd.exe','/C del logi\kopie_z\kopia_z_kd.txt');
                        goto kotwica1;
                   end;
                  36:
                   begin
                        writeln(t1,godzina,' - Usuniecie logow kopii zapasowej modulu');
                        writeln(t1,'           �rednia Ocen');
                        close(t1);
                        exec('C:\Windows\System32\cmd.exe','/C del logi\kopie_z\kopia_z_srednia.txt');
                        goto kotwica1;
                   end;
                  37:
                   begin
                        writeln(t1,godzina,' - Usuniecie logow kopii zapasowej modulu');
                        writeln(t1,'           Punkty i Ocena');
                        close(t1);
                        exec('C:\Windows\System32\cmd.exe','/C del logi\kopie_z\kopia_z_punkty.txt');
                        goto kotwica1;
                   end;
                  38:
                   begin
                        writeln(t1,godzina,' - Usuniecie logow kopii zapasowej modulu');
                        writeln(t1,'           Przeglad Logow');
                        close(t1);
                        exec('C:\Windows\System32\cmd.exe','/C del logi\kopie_z\kopia_z_przeglad.txt');
                        goto kotwica1;
                   end;

                end;
                koniec:
        end;

begin
end.

