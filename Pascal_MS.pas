program Pascal_MS;
uses
        pas_ms,
        crt,
        moduly,
        wewnetrzny,
        dos,
        prze_jedn;

function nagwiazdki(fraza:string):string;
        var
                licznik:integer;
        begin
                nagwiazdki:='';
                for licznik:=0 to length(fraza)-1 do nagwiazdki:=nagwiazdki+'*';
        end;

procedure zmiana_hasla(haslo_popr:string);
        label
                whasla,
                poczpetli,
                koniec;
        var
                haslo1,haslo2,nhaslo,test1:string;
                licznik1,phasla1,polozenie1:integer;
                litera1:char;
                testusuwanie1:array[1..20] of string;
                dane1:array[0..20] of char;
                t,tt:text;
                udanazm:boolean;
        begin
                clrscr;
                napis_haslo;
                instrukcja(6,38,'fraz�','wiersza');
                polozenie1:=0;
                udanazm:=false;
                haslo1:='';
                haslo2:='';
                nhaslo:='';


                repeat

                        poczpetli:
                        if polozenie1 <> 3 then gotoxy(50,19+(polozenie1*4));

                        phasla1:=0;
                        test1:='';

                        if polozenie1 = 0 then podswietlenie_slowa(50,19+(polozenie1*4),nagwiazdki(haslo1));    //podswietlenie
                        if polozenie1 = 1 then podswietlenie_slowa(50,19+(polozenie1*4),nagwiazdki(haslo2));
                        if polozenie1 = 2 then podswietlenie_slowa(50,19+(polozenie1*4),nagwiazdki(nhaslo));
                        typowyk;

                        litera1:=readkey;

                        gotoxy(30,36);
                        write('                             ');

                        menu_podswietlenie(31,30,'Zmie�',0);
                        if polozenie1 <> 3 then gotoxy(50,19+(polozenie1*4));
                        if (litera1 = #13) and (polozenie1<>3) then
                                begin
                                        zaznaczenie_slowa(50,19+(polozenie1*4),1);
                                        typowyk;
                                        repeat      // p�tla odpowiedzialna za ka�dy klawisz
                                                whasla:
                                                litera1:=readkey;
                                                if (litera1 = #08) and (phasla1 > 0) then      //kasowanie danej frazy
                                                begin
                                                        test1:=testusuwanie1[phasla1];
                                                        gotoxy(50+phasla1-1,19+(polozenie1*4));
                                                        write(' ');
                                                        gotoxy(50+phasla1-1,19+(polozenie1*4));
                                                        phasla1:=phasla1-1;
                                                        goto whasla;
                                                end;

                                                if (litera1<>#13) and (litera1<>#08) and (litera1<>chr(0)) then  //wypisywanie gwiazdki
                                                begin
                                                        phasla1:=phasla1+1;
                                                        testusuwanie1[phasla1]:=test1;
                                                        test1:=test1+litera1;
                                                        write('*');
                                                end;

                                        until (litera1 = #13) or (phasla1=10);


                                        litera1:=#1;
                                        if length(test1) = 0 then
                                                begin
                                                        write(' ');
                                                        gotoxy(50,19+(polozenie1*4));
                                                end;
                                        if length(test1) = 10 then      //je�eli has�o ma 10 liter to b��d
                                                begin
                                                        gotoxy(50,19+(polozenie1*4));
                                                        write('          ');
                                                        gotoxy(36,36);
                                                        write('Zbyt d�ugie has�o...');
                                                        assign(tt, 'logi\logi_pas_ms.txt');
                                                        append(tt);
                                                        writeln(tt,godzina,' - Zbyt dluga propozycja nowego hasla');
                                                        close(tt);
                                                        test1:='';
                                                end
                                                else
                                                begin
                                                        if polozenie1 = 0 then haslo1:=test1;
                                                        if polozenie1 = 1 then haslo2:=test1;
                                                        if polozenie1 = 2 then nhaslo:=test1;
                                                end;
                                        gotoxy(50,19+(polozenie1*4));
                                end;
                        if polozenie1 = 0 then odswietlenie_slowa(50,19+(polozenie1*4),nagwiazdki(haslo1));    //podswietlenie
                        if polozenie1 = 1 then odswietlenie_slowa(50,19+(polozenie1*4),nagwiazdki(haslo2));
                        if polozenie1 = 2 then odswietlenie_slowa(50,19+(polozenie1*4),nagwiazdki(nhaslo));
                        typowyk;
                        if litera1 = chr(0) then litera1:=readkey;
                        case litera1 of
                                'H':       //strza�ka w g�r�
                                        begin
                                                if polozenie1 <> 0 then polozenie1:=polozenie1-1
                                                else polozenie1:=3;
                                        end;
                                'P':       //strza�ka w d��
                                        begin
                                                if polozenie1 <> 3 then polozenie1:=polozenie1+1
                                                else polozenie1:=0;
                                        end;
                                end;
                        if polozenie1 = 3 then menu_podswietlenie(31,30,'Zmie�',1); //okienko
                                                                                      // zatwierdzenia zmian
                until (litera1 = #13) and (polozenie1 = 3) or (litera1 = #27);

                if litera1 = #13 then
                        begin
                                if  (haslo_popr = haslo1) and (haslo_popr = haslo2) then
                                        begin
                                                udanazm:=true;
                                                haslo2:='';
                                                for licznik1:=1 to length(nhaslo) do dane1[licznik1]:=nhaslo[licznik1];
                                                for licznik1:=1 to length(nhaslo) do haslo2:=haslo2 + koder(dane1[licznik1]);
                                                nhaslo:=haslo2;

                                                haslo2:='';
                                                for licznik1:=1 to length(nhaslo) do dane1[licznik1]:=nhaslo[licznik1];
                                                for licznik1:=1 to length(nhaslo) do haslo2:=haslo2 + koder3(dane1[licznik1]);
                                                nhaslo:=haslo2;

                                                haslo2:='';
                                                for licznik1:=1 to length(nhaslo) do dane1[licznik1]:=nhaslo[licznik1];
                                                for licznik1:=1 to length(nhaslo) do haslo2:=haslo2 + koder(dane1[licznik1]);
                                                nhaslo:=haslo2;

                                                haslo2:='';
                                                for licznik1:=1 to length(nhaslo) do dane1[licznik1]:=nhaslo[licznik1];
                                                for licznik1:=1 to length(nhaslo) do haslo2:=haslo2 + koder2(dane1[licznik1]);
                                                nhaslo:=haslo2;
                                                assign(t, 'logi\kopie_z\haslo.mss');
                                                rewrite(t);
                                                write(t,nhaslo);
                                                close(t);
                                        end;
                        end;
                if litera1 = #27 then
                begin
                        gotoxy(30,36);
                        write(godzina,' - Czy zako�czy� (');  //wzbogacenie kolorystyczne pytania
                        cznieb;
                        write('t');
                        typowyk;
                        write('/');
                        cznieb;
                        write('n');
                        typowyk;
                        write(') ?');

                        litera1:=readkey;
                        if litera1 <> 't' then
                                begin
                                        gotoxy(30,36);
                                        writeln('                                ');
                                        goto poczpetli;
                                end
                                else
                                begin
                                        assign(tt, 'logi\logi_pas_ms.txt');
                                        append(tt);
                                        writeln(tt,godzina,' - Wyjscie z menu zmiany hasla');
                                        close(tt);
                                        wymazywanie4(27,35);
                                        wczytywanie_sz(36,36,20);
                                        clrscr;
                                        napis_okrojony;
                                        goto koniec;
                                end;
                end;

                wymazywanie4(27,35);
                wczytywanie_sz(36,36,20);
                clrscr;
                napis_okrojony;
                assign(tt, 'logi\logi_pas_ms.txt');
                append(tt);
                if udanazm = true then
                        begin
                                gotoxy(36,22);
                                write('Zapisano nowe has�o...');
                                writeln(tt,godzina,' - Zapisanie nowego hasla');
                        end
                        else
                        begin
                                gotoxy(33,22);
                                write('Niepoprawne has�o aktualne !');
                                writeln(tt,godzina,' - Niepoprawne haslo aktualne');
                        end;
                writeln(tt,'           Zamykanie procedury zmiany hasla');
                close(tt);
                koniec:
        end;

var
        a,b,ostr,licznik,zablokowane:integer;
        haslo,haslo2,test:string;
        litera:char;
        ogranicz,ponowne,powtorzenie:boolean;
        t1,t2:text;
        dane:array[0..20] of char;
        testusuwanie:array[1..20] of string;

        lista,listan,polozenie,x,y,phasla:integer;
        klawisz,znak:char;

label
        kotwica0,
        kotwica1,
        kotwica2,
        wpisaniehasla,
        wpisaniehasla2,
        pocz_petli,
        nowehaslo;


begin
        kotwica0:
        typowyk;
        clrscr;
        napis_okrojony;
        licznik:=3;
        ostr:=0;
        ponowne:=false;
        ogranicz:=false;

        if fsearch('logi\logi_pas_ms.txt','') = '' then  //jezeli brak pliku raportowego tworzy go
                begin
                        assign(t1, 'logi\logi_pas_ms.txt');
                        rewrite(t1);
                        gotoxy(34,22);
                        write('Brakuje pliku raportowego,');
                        gotoxy(34,23);
                        write('w�a�nie go wygenerowa�em.');
                        gotoxy(50,19);
                        writeln(t1, 'Ten plik przechowuje logi aplikacji Pascal MS');
                        writeln(t1,'Data i czas wygenerowania tego pliku: ',data,', ',godzina );
                        writeln(t1,'Autor programu: Mikolaj Stankowiak');
                        close(t1);
                end;

        assign(t1, 'logi\logi_pas_ms.txt');      //wpis uruchomienia programu
        append(t1);

        writeln(t1);
        writeln(t1);
        writeln(t1);
        writeln(t1,'Uruchomienie aplikacji Pascal MS');
        writeln(t1,'Aktualna data i czas ',data,', ',godzina);
        writeln(t1,'Brak mozliwosci wyswietlenia polskich znakow !');
        writeln(t1,'Dane moga byc nieczytelne.');
        writeln(t1);
        close(t1);

        if fsearch('logi\kopie_z\haslo.mss','') = '' then   //gdy brak hasla pobierz je i zakoduj do pliku
                begin
                        haslo_brak(35,22,1000);
                        assign(t1, 'logi\logi_pas_ms.txt');
                        append(t1);
                        writeln(t1,godzina,'Brak pliku z haslem');
                        close(t1);
                        nowehaslo:
                        repeat
                                wpisaniehasla:
                                litera:=readkey;        //p�tla wpisania has�a
                                if (length(haslo) = 0) then
                                        begin
                                                gotoxy(21,22);
                                                writeln('                                                     ');
                                                gotoxy(50,19);
                                        end;
                                if (litera = #08) and (phasla > 0) then            //kasowanie danej frazy
                                        begin
                                                haslo:=testusuwanie[phasla];
                                                gotoxy(50+phasla-1,19);
                                                write(' ');
                                                gotoxy(50+phasla-1,19);
                                                phasla:=phasla-1;
                                                goto wpisaniehasla;
                                        end;

                                if (litera<>#13) and (litera<>#08) then       //wypisywanie znaku
                                        begin
                                                phasla:=phasla+1;
                                                testusuwanie[phasla]:=test;
                                                haslo:=haslo+litera;
                                                write(litera);
                                        end;
                        until (litera = #13) or (phasla=10);

                        if phasla = 10 then
                                begin
                                        assign(t1, 'logi\logi_pas_ms.txt');
                                        append(t1);
                                        writeln(t1,godzina,' - Zbyt dluga propozycja nowego hasla');
                                        close(t1);
                                        gotoxy(36,22);
                                        write('Zbyt d�ugie has�o !');
                                        gotoxy(50,19);
                                        write('          ');
                                        gotoxy(50,19);
                                        haslo:='';
                                        phasla:=0;
                                        goto nowehaslo;

                                end;

                        gotoxy(21,22);
                        writeln('                                                     ');
                        gotoxy(50,19);

                        haslo2:='';
                        for licznik:=1 to length(haslo) do dane[licznik]:=haslo[licznik];
                        for licznik:=1 to length(haslo) do haslo2:=haslo2 + koder(dane[licznik]);
                        haslo:=haslo2;

                        haslo2:='';
                        for licznik:=1 to length(haslo) do dane[licznik]:=haslo[licznik];
                        for licznik:=1 to length(haslo) do haslo2:=haslo2 + koder3(dane[licznik]);
                        haslo:=haslo2;

                        haslo2:='';
                        for licznik:=1 to length(haslo) do dane[licznik]:=haslo[licznik];
                        for licznik:=1 to length(haslo) do haslo2:=haslo2 + koder(dane[licznik]);
                        haslo:=haslo2;

                         haslo2:='';
                        for licznik:=1 to length(haslo) do dane[licznik]:=haslo[licznik];
                        for licznik:=1 to length(haslo) do haslo2:=haslo2 + koder2(dane[licznik]);
                        haslo:=haslo2;



                        gotoxy(50,19);
                        write('          ');
                        gotoxy(50,19);
                        gotoxy(31,15);
                        writeln('Masz 3 pr�by na wpisanie has�a.');
                        gotoxy(34,22);
                        write('Dla bezpiecze�stwa wpisz');
                        gotoxy(36,23);
                        write('has�o jeszcze raz...');
                        gotoxy(50,19);
                        assign(t2, 'logi\kopie_z\haslo.mss');
                        rewrite(t2);
                        write(t2,haslo);
                        close(t2);

                        assign(t1, 'logi\logi_pas_ms.txt');
                        append(t1);
                        writeln(t1,godzina,'  - Utworzenie nowego pliku z haslem ');
                        close(t1);
                        writeln;
                end;

        pocz_petli:
        assign(t2,'logi\kopie_z\haslo.mss'); //przeczytaj zakodowane haslo
        reset(t2);
        read(t2,haslo);
        close(t2);
                                                   //dekodowanie hasla
        haslo2:='';
        for licznik:=1 to length(haslo) do dane[licznik]:=haslo[licznik];
        for licznik:=1 to length(haslo) do haslo2:=haslo2 + dekoder2(dane[licznik]);
        haslo:=haslo2;

        haslo2:='';
        for licznik:=1 to length(haslo) do dane[licznik]:=haslo[licznik];
        for licznik:=1 to length(haslo) do haslo2:=haslo2 + dekoder(dane[licznik]);
        haslo:=haslo2;

        haslo2:='';
        for licznik:=1 to length(haslo) do dane[licznik]:=haslo[licznik];
        for licznik:=1 to length(haslo) do haslo2:=haslo2 + dekoder3(dane[licznik]);
        haslo:=haslo2;

        haslo2:='';
        for licznik:=1 to length(haslo) do dane[licznik]:=haslo[licznik];
        for licznik:=1 to length(haslo) do haslo2:=haslo2 + dekoder(dane[licznik]);
        haslo:=haslo2;
        licznik:=3;

        assign(t1, 'logi\logi_pas_ms.txt');
        append(t1);

        while licznik <> 0 do
                begin
                        gotoxy(36,15);
                        write(licznik);  //ilosc prob na wpisanie hasla
                        gotoxy(50,19);
                        phasla:=0;
                        repeat
                                wpisaniehasla2:
                                litera:=readkey;        //p�tla wpisania has�a
                                if (length(test) = 0) and (ostr = 0) then
                                        begin
                                                gotoxy(21,22);
                                                writeln('                                                     ');
                                                gotoxy(21,23);
                                                writeln('                                                     ');
                                                gotoxy(50,19);
                                        end;
                                if (litera = #08) and (phasla > 0) then            //kasowanie danej frazy
                                        begin
                                                test:=testusuwanie[phasla];
                                                gotoxy(50+phasla-1,19);
                                                write(' ');
                                                gotoxy(50+phasla-1,19);
                                                phasla:=phasla-1;
                                                goto wpisaniehasla2;
                                        end;
                                if litera = chr(0) then
                                        begin
                                                litera:=readkey;
                                                if litera = #60 then   //je�eli F2
                                                        begin
                                                                wczytywanie_sz(36,35,20);
                                                                writeln(t1,godzina,' - Uruchomienie procedury zmiany hasla');
                                                                close(t1);
                                                                zmiana_hasla(haslo);
                                                                goto pocz_petli;
                                                        end;
                                        end;
                                if (litera<>#13) and (litera<>#08) then       //wypisywanie gwiazdki
                                        begin
                                                phasla:=phasla+1;
                                                testusuwanie[phasla]:=test;
                                                test:=test+litera;
                                                write('*');
                                        end;
                        until (litera = #13) or (phasla=10);

                        if test=haslo then                     //gdy haslo jest dobrze wpisane
                                begin
                                        licznik:=licznik-1;
                                        write(t1, godzina,' - ');
                                        writeln(t1, 'Wpisano poprawne haslo. ');
                                        writeln(t1, '           Pozostale proby na wpisanie hasla: ',licznik);
                                        licznik:=0;

                                end
                        else                                  //gdy jest zle wpisane
                                begin
                                        haslo_niepop(34,22,ostr);
                                        licznik:=licznik-1;
                                        write(t1, godzina,' - ');
                                        writeln(t1,'Wpisano niepoprawne haslo: ',test);

                                        test:='';
                                        ostr:=ostr+1; //ilosc ostrze�e�
                                end;
                        gotoxy(50,19);
                        write('          ');
                        gotoxy(50,19);
                end;
        close(t1);

        x:=31;
        y:=18;                     //czyszczenie okienka wpisywania hasla

        menu_podswietlenie(x,y-4,'',0);
        menu_podswietlenie(x,y,'',0);

        if test = haslo then
                begin
                        if ostr=0 then haslo_pop(35,22,1000)  //haslo wpisane za pierwszym razem
                        else
                                begin                        //haslo wpisane za ktoryms razem
                                         gotoxy(35,22+ostr);
                                         write('Has�o jest poprawne...');
                                         wymazywanie2(34,22,500,ostr);
                                end;
                        wczytywanie_sz(36,35,50);
                 end;
        if test <> haslo then
        begin
                wymazywanie2(34,22,500,ostr);
                wczytywanie_sz(36,35,50);
                ogranicz:=true;
        end;

        kotwica1:

        if powtorzenie = false then
        begin
                assign(t1, 'logi\logi_pas_ms.txt');
                append(t1);
                write(t1,godzina,' - ');
                if ogranicz = false then writeln(t1,'Uruchomienie glownego modulu')
                else writeln(t1,'Uruchomienie glownego modulu w trybie ograniczonym');
                close(t1);
        end;

        clrscr;
        napis_glowny(ogranicz);

        b:=0;
        zablokowane:=3;
        if ogranicz=true then
                begin
                        gotoxy(31,23);
                        write('  Program jest w wersji demo.');
                        gotoxy(31,26);
                        write(' Skontaktuj si� z w�a�cicielem');
                        gotoxy(31,27);
                        write('  w celu zakupienia licencji.');
                        gotoxy(65,22);
                        writeln('                            ');
                        gotoxy(65,23);
                        writeln('                            ');
                        gotoxy(65,26);
                        writeln('                            ');
                        gotoxy(65,27);
                        writeln('                            ');
                        zablokowane:=1;
                        komentarz(68,18,7);
                end;
        polozenie:=1;
        lista:=0;
        listan:=1;
        kotwica2:

        gotoxy(57,31);
        if (b = 1) then wymazywanie(57,31,1500);
        a:=0;
        znak:=#0;

        repeat

                if (ogranicz = false) and (lista <> listan) then
                        begin
                                lista:=listan;
                                komentarz(68,18,lista);
                        end;
                if ogranicz = false then
                        begin
                                poziom_listy(63,17,lista,polozenie);
                                poziom_listy(29,17,lista,polozenie);
                        end;
                gotoxy(37,15);
                niebbial;
                write('Wybierz podprogram:');
                typowyk;
                        //rysowanie odpowiedniej cze�ci listy
                if ogranicz = false then
                begin
                        if lista = 1 then
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
                        if lista = 2 then
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
                        if lista = 3 then
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
                        if lista = 4 then
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
                        if lista = 5 then
                        begin
                                menu_podswietlenie(x,y,'�rednia Ocen',0);
                                menu_podswietlenie(x,y+4,'Punkty i Ocena',0);
                                menu_podswietlenie(x,y+8,'Przegl�d Log�w',0);
                                menu_podswietlenie(x,y+12,'O Autorze',0);

                                if polozenie = 1 then menu_podswietlenie(x,y,'�rednia Ocen',1);
                                if polozenie = 2 then menu_podswietlenie(x,y+4,'Punkty i Ocena',1);
                                if polozenie = 3 then menu_podswietlenie(x,y+8,'Przegl�d Log�w',1);
                                if polozenie = 4 then menu_podswietlenie(x,y+12,'O autorze',1);
                        end;
                        if lista = 6 then
                        begin
                                menu_podswietlenie(x,y,'Punkty i Ocena',0);
                                menu_podswietlenie(x,y+4,'Przegl�d Log�w',0);
                                menu_podswietlenie(x,y+8,'O Autorze',0);
                                menu_podswietlenie(x,y+12,'Kontakt',0);

                                if polozenie = 1 then menu_podswietlenie(x,y,'Punkty i Ocena',1);
                                if polozenie = 2 then menu_podswietlenie(x,y+4,'Przegl�d Log�w',1);
                                if polozenie = 3 then menu_podswietlenie(x,y+8,'O Autorze',1);
                                if polozenie = 4 then menu_podswietlenie(x,y+12,'Kontakt',1);
                        end;
                end
                else
                begin
                        menu_podswietlenie(x,y,'Kalkulator',0);
                        menu_podswietlenie(x,y+4,'Menu wpisania has�a',0);
                        menu_podswietlenie(x,y+8,'O Autorze',0);
                        menu_podswietlenie(x,y+12,'Kontakt',0);

                        if polozenie = 1 then menu_podswietlenie(x,y,'Kalkulator',1);
                        if polozenie = 2 then menu_podswietlenie(x,y+4,'Menu wpisania has�a',1);
                        if polozenie = 3 then menu_podswietlenie(x,y+8,'O Autorze',1);
                        if polozenie = 4 then menu_podswietlenie(x,y+12,'Kontakt',1);
                end;

                klawisz:=readkey;
                if klawisz = #13 then
                        begin
                                if ogranicz = false then
                                begin
                                        if lista = 1 then
                                        begin
                                                if polozenie = 1 then
                                                begin
                                                        menu_podswietlenie(x,y,'Kalkulator',2);
                                                        a:=1;
                                                end;
                                                if polozenie = 2 then
                                                begin
                                                        menu_podswietlenie(x,y+4,'Przelicznik Jednostek',2);
                                                        a:=2;
                                                end;
                                                if polozenie = 3 then
                                                begin
                                                        menu_podswietlenie(x,y+8,'Operacje na Bitach',2);
                                                        a:=3;
                                                end;
                                                if polozenie = 4 then
                                                begin
                                                        menu_podswietlenie(x,y+12,'Koder / Dekoder',2);
                                                        a:=4;
                                                end;
                                        end;
                                        if lista = 2 then
                                        begin
                                                if polozenie = 1 then
                                                begin
                                                        menu_podswietlenie(x,y,'Przelicznik Jednostek',2);
                                                        a:=2;
                                                end;
                                                if polozenie = 2 then
                                                begin
                                                        menu_podswietlenie(x,y+4,'Operacje na Bitach',2);
                                                        a:=3;
                                                end;
                                                if polozenie = 3 then
                                                begin
                                                        menu_podswietlenie(x,y+8,'Koder / Dekoder',2);
                                                        a:=4;
                                                end;
                                                if polozenie = 4 then
                                                begin
                                                        menu_podswietlenie(x,y+12,'�rednia Ocen',2);
                                                        a:=5;
                                                end;
                                                end;

                                        if lista = 3 then
                                        begin
                                                if polozenie = 1 then
                                                begin
                                                        menu_podswietlenie(x,y,'Operacje na Bitach',2);
                                                        a:=3;
                                                end;
                                                if polozenie = 2 then
                                                begin
                                                        menu_podswietlenie(x,y+4,'Koder / Dekoder',2);
                                                        a:=4;
                                                end;
                                                if polozenie = 3 then
                                                begin
                                                        menu_podswietlenie(x,y+8,'�rednia Ocen',2);
                                                        a:=5;
                                                end;
                                                if polozenie = 4 then
                                                begin
                                                        menu_podswietlenie(x,y+12,'Punkty i Ocena',2);
                                                        a:=6;
                                                end;
                                        end;
                                        if lista = 4 then
                                        begin
                                                if polozenie = 1 then
                                                begin
                                                        menu_podswietlenie(x,y,'Koder / Dekoder',2);
                                                        a:=4;
                                                end;
                                                if polozenie = 2 then
                                                begin
                                                        menu_podswietlenie(x,y+4,'�rednia Ocen',2);
                                                        a:=5;
                                                end;
                                                if polozenie = 3 then
                                                begin
                                                        menu_podswietlenie(x,y+8,'Punkty i Ocena',2);
                                                        a:=6;
                                                end;
                                                if polozenie = 4 then
                                                begin
                                                        menu_podswietlenie(x,y+12,'Przegl�d Log�w',2);
                                                        a:=7;
                                                end;
                                        end;
                                        if lista = 5 then
                                        begin
                                                if polozenie = 1 then
                                                begin
                                                        menu_podswietlenie(x,y,'�rednia Ocen',2);
                                                        a:=5;
                                                end;
                                                if polozenie = 2 then
                                                begin
                                                        menu_podswietlenie(x,y+4,'Punkty i Ocena',2);
                                                        a:=6;
                                                end;
                                                if polozenie = 3 then
                                                begin
                                                        menu_podswietlenie(x,y+8,'Przegl�d Log�w',2);
                                                        a:=7;
                                                end;
                                                if polozenie = 4 then
                                                begin
                                                        menu_podswietlenie(x,y+12,'O Autorze',2);
                                                        a:=8;
                                                end;
                                        end;
                                        if lista = 6 then
                                        begin
                                                if polozenie = 1 then
                                                begin
                                                        menu_podswietlenie(x,y,'Punkty i Ocena',2);
                                                        a:=6;
                                                end;
                                                if polozenie = 2 then
                                                begin
                                                        menu_podswietlenie(x,y+4,'Przegl�d Log�w',2);
                                                        a:=7;
                                                end;
                                                if polozenie = 3 then
                                                begin
                                                        menu_podswietlenie(x,y+8,'O Autorze',2);
                                                        a:=8;
                                                end;
                                                if polozenie = 4 then
                                                begin
                                                        menu_podswietlenie(x,y+12,'Kontakt',2);
                                                        a:=9;
                                                end;
                                        end;
                                end;
                                if ogranicz = true then
                                begin
                                        if polozenie = 1 then
                                                begin
                                                        menu_podswietlenie(x,y,'Kalkulator',1);
                                                        a:=1;
                                                end;
                                        if polozenie = 2 then
                                                begin
                                                        menu_podswietlenie(x,y+4,'Menu wpisania has�a',1);
                                                        a:=10;
                                                end;
                                        if polozenie = 3 then
                                                begin
                                                        menu_podswietlenie(x,y+8,'O Autorze',1);
                                                        a:=8;
                                                end;
                                        if polozenie = 4 then
                                                begin
                                                        menu_podswietlenie(x,y+12,'Kontakt',1);
                                                        a:=9;
                                                end;
                                end;
                        end;
                        if klawisz <> #13 then
                        begin
                                if klawisz = chr(0) then klawisz:=readkey;
                                case klawisz of
                                        'H':       //strza�ka w g�r�
                                                 begin
                                                        if ogranicz = false then
                                                        begin
                                                                if polozenie = 1 then
                                                                begin
                                                                        if lista > 1 then listan:=listan-1;
                                                                end
                                                                else polozenie:=polozenie-1;
                                                        end
                                                        else if polozenie <> 1 then polozenie:=polozenie-1;
                                                 end;
                                        'P':       //strza�ka w d��
                                                begin
                                                        if ogranicz = false then
                                                        begin
                                                                if polozenie = 4 then
                                                                begin
                                                                        if lista < 6 then listan:=listan+1;
                                                                end
                                                                else polozenie:=polozenie+1;
                                                        end
                                                        else if polozenie <> 4 then polozenie:=polozenie+1;
                                                end;
                                        end;
                        end;

        until (klawisz = #27) or (klawisz = #13);


        assign(t1, 'logi\logi_pas_ms.txt');
        append(t1);

        case a  of
                0:
                 begin
                        gotoxy(30,36);
                        write(godzina,' - Czy zako�czy� (');  //wzbogacenie kolorystyczne pytania
                        cznieb;
                        write('t');
                        typowyk;
                        write('/');
                        cznieb;
                        write('n');
                        typowyk;
                        write(') ?');

                        znak:=readkey;
                        gotoxy(30,36);
                        write('                                ');
                        if znak<>'t' then
                                begin
                                        close(t1);
                                        goto kotwica2;
                                end;
                        writeln(t1);
                        writeln(t1,godzina,' - Zamkniecie glownego modulu');
                        close(t1);
                        wymazywanie3(7,38);
                        zam_programu(36,36,80);
                        halt;
                 end;
                8:
                  begin
                        wymazywanie3(7,38);
                        autor(7,38);

                        write(t1,godzina,' - ');
                        writeln(t1,'Uruchomienie procedury Informacje o Autorze');
                        close(t1);
                        b:=0;
                        goto kotwica2;
                   end;
                9:
                   begin
                        wymazywanie3(7,38);
                        wizytowka(33,38);

                        write(t1,godzina,' - ');
                        writeln(t1,'Uruchomienie procedury Wizytowka');
                        close(t1);
                        b:=0;
                        goto kotwica2;
                   end;
                10:
                   begin
                        wymazywanie3(7,38);
                        wczytywanie_sz(36,35,20);

                        writeln(t1);
                        writeln(t1,godzina,' - Uruchomienie ponownego ladowania hasla');
                        close(t1);
                        goto kotwica0;
                   end;
                end;

        wymazywanie3(7,38);
        wczytywanie(36,36,50);
        writeln(t1);
        case a of
                1:
                  begin
                        writeln(t1,godzina,' - Uruchomienie podprogramu Kalkulator');
                        close(t1);
                        kalk;

                        assign(t1, 'logi\logi_pas_ms.txt');
                        append(t1);
                        writeln(t1,godzina,' - Zamkniece podprogramu Kalkulator');
                        close(t1);
                        powtorzenie:=true;
                        goto kotwica1;
                  end;
                2:
                  begin
                        writeln(t1,godzina,' - Uruchomienie podprogramu Przelicznik Jednostek');
                        close(t1);
                        przel;

                        assign(t1, 'logi\logi_pas_ms.txt');
                        append(t1);
                        writeln(t1,godzina,' - Zamkniece podprogramu Przelicznik Jednostek');
                        close(t1);
                        powtorzenie:=true;
                        goto kotwica1;
                  end;
                3:
                  begin
                        writeln(t1,godzina,' - Uruchomienie podprogramu Operacje na Bitach');
                        close(t1);
                        op_bit;

                        assign(t1, 'logi\logi_pas_ms.txt');
                        append(t1);
                        writeln(t1,godzina,' - Zamkniece podprogramu Operacje na Bitach');
                        close(t1);
                        powtorzenie:=true;
                        goto kotwica1;

                  end;
                4:
                  begin
                        writeln(t1,godzina,' - Uruchomienie podprogramu Koder/Dekoder');
                        close(t1);
                        kd;

                        assign(t1, 'logi\logi_pas_ms.txt');
                        append(t1);
                        writeln(t1,godzina,' - Zamkniece podprogramu Koder/Dekoder');
                        close(t1);
                        powtorzenie:=true;
                        goto kotwica1;
                  end;
                5:
                  begin
                        writeln(t1,godzina,' - Uruchomienie podprogramu Srednia Ocen');
                        close(t1);
                        srednia;

                        assign(t1, 'logi\logi_pas_ms.txt');
                        append(t1);
                        writeln(t1,godzina,' - Zamkniece podprogramu Srednia Ocen');
                        close(t1);
                        powtorzenie:=true;
                        goto kotwica1;
                  end;
                6:
                  begin
                        writeln(t1,godzina,' - Uruchomienie podprogramu Punkty i Ocena');
                        close(t1);
                        punkty;

                        assign(t1, 'logi\logi_pas_ms.txt');
                        append(t1);
                        writeln(t1,godzina,' - Zamkniece podprogramu Punkty i Ocena');
                        close(t1);
                        powtorzenie:=true;
                        goto kotwica1;
                  end;
                7:
                  begin
                        writeln(t1,godzina,' - Uruchomienie podprogramu Przeglad Logow');
                        close(t1);
                        przeglad;

                        assign(t1, 'logi\logi_pas_ms.txt');
                        append(t1);
                        writeln(t1,godzina,' - Zamkniece podprogramu Przeglad Logow');
                        close(t1);
                        powtorzenie:=true;
                        if fsearch('logi\logi_pas_ms.txt','') = '' then goto kotwica0;
                        goto kotwica1;
                  end;
                end;
end.



