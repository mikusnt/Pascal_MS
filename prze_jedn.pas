unit prze_jedn;

interface
        uses
                crt,
                pas_ms,
                wewnetrzny;
        procedure przel_dlugosc(x,y,p:integer);
        procedure przel_powierzchnia(x,y,p:integer);
        procedure przel_objetosc(x,y,p:integer);
        procedure przel_czas(x,y,p:integer);
        procedure przel_predkosc(x,y,p:integer);
        procedure przel_temperatura(x,y,p:integer);
        procedure przel_moc(x,y,p:integer);
        procedure przel_masa(x,y,p:integer);
        procedure przel_dane(x,y,p:integer);
        procedure przedrostki;
        function koder(znak:char):char;
        function koder2(znak:char):char;
        function koder3(znak:char):char;
        function dekoder(znak:char):char;
        function dekoder2(znak:char):char;
        function dekoder3(znak:char):char;
        function kalk_rozszerzony:boolean;

implementation
        procedure przel_dlugosc(x,y,p:integer);
        const
                mm=0.001;
                cm=0.01;
                cal=0.025395;
                dm=0.1;
                ft=0.3047940;
                m=1;
                km=1000;
                mi=1609.31232;

        var
                a,b:char;
                z,d,e:integer;
                c:real;
                t1:text;
        begin
                d:=y;
                e:=30;
                gotoxy(x,d);
                writeln('Milimetr [mm]: ');
                gotoxy(x,d+2);
                writeln('Centymetr [cm]: ');
                gotoxy(x,d+4);
                writeln('Cal [in]: ');
                gotoxy(x,d+6);
                writeln('Decymetr [dm]: ');
                gotoxy(x,d+8);
                writeln('Stopa [ft]: ');
                gotoxy(x,d+10);
                writeln('Metr [m]: ');
                gotoxy(x,d+12);
                writeln('Kilometr [km]: ');
                gotoxy(x,d+14);
                writeln('Mila [mi]: ');
                instrukcja(x,d+18,'jednostk©','wyboru jednostek');
                x:=x+19;
                y:=y+10;
                gotoxy(x,y);
                repeat

                typowyk;
                for z:=0 to 14 do
                        begin
                                gotoxy(x,z+d);
                                writeln('                            ');
                        end;

                 gotoxy(x,d);         //wyòwietlenie danych
                 write(c/mm:1:p);
                 gotoxy(x,d+2);
                 write(c/cm:1:p);
                 gotoxy(x,d+4);
                 write(c/cal:1:p);
                 gotoxy(x,d+6);
                 write(c/dm:1:p);
                 gotoxy(x,d+8);
                 write(c/ft:1:p);
                 gotoxy(x,d+10);
                 write(c/m:1:p);
                 gotoxy(x,d+12);
                 write(c/km:1:p);
                 gotoxy(x,d+14);
                 write(c/mi:1:p);
                 gotoxy(x,y);

                if y=d then podswietlenie_slowa(x,y,naslowo(c/mm,p));    //podswietlenie
                if y=d+2 then podswietlenie_slowa(x,y,naslowo(c/cm,p));
                if y=d+4 then podswietlenie_slowa(x,y,naslowo(c/cal,p));
                if y=d+6 then podswietlenie_slowa(x,y,naslowo(c/dm,p));
                if y=d+8 then podswietlenie_slowa(x,y,naslowo(c/ft,p));
                if y=d+10 then podswietlenie_slowa(x,y,naslowo(c,p));
                if y=d+12 then podswietlenie_slowa(x,y,naslowo(c/km,p));
                if y=d+14 then podswietlenie_slowa(x,y,naslowo(c/mi,p));

                a:=readkey;
                if a=#13 then
                        begin

                                zaznaczenie_slowa(x,y,0);
                                readln(c);
                                if y = d then c:=c*mm;
                                if y = d+2 then c:=c*cm;
                                if y = d+4 then c:=c*cal;
                                if y = d+6 then c:=c*dm;
                                if y = d+8 then c:=c*ft;
                                if y = d+12 then c:=c*km;
                                if y = d+14 then c:=c*mi;


                                assign(t1,'logi\logi_pj.txt');
                                append(t1);
                                writeln(t1,godzina,' - Wprowadzenie danych:');
                                writeln(t1,'           Milimetr [mm]:    ',c/mm:1:p);
                                writeln(t1,'           Centymetr [cm]:   ',c/cm:1:p);
                                writeln(t1,'           Cal [in]:         ',c/cal:1:p);
                                writeln(t1,'           Decymetr [dm]:    ',c/dm:1:p);
                                writeln(t1,'           Stopa [ft]:       ',c/ft:1:p);
                                writeln(t1,'           Metr [m]:         ',c/m:1:p);
                                writeln(t1,'           Kilometr [km]:    ',c/km:1:p);
                                writeln(t1,'           Mila [mi]:        ',c/mi:1:p);
                                writeln(t1);
                                close(t1);


                        end
                else
                begin
                        if y=d then odswietlenie_slowa(x,y,naslowo(c/mm,p));    //odswietlenie
                        if y=d+2 then odswietlenie_slowa(x,y,naslowo(c/cm,p));
                        if y=d+4 then odswietlenie_slowa(x,y,naslowo(c/cal,p));
                        if y=d+6 then odswietlenie_slowa(x,y,naslowo(c/dm,p));
                        if y=d+8 then odswietlenie_slowa(x,y,naslowo(c/ft,p));
                        if y=d+10 then odswietlenie_slowa(x,y,naslowo(c,p));
                        if y=d+12 then odswietlenie_slowa(x,y,naslowo(c/km,p));
                        if y=d+14 then odswietlenie_slowa(x,y,naslowo(c/mi,p));

                        if a=chr(0) then b:=readkey;
                        case b of
                                'H':
                                        begin
                                                if y=d then y:=y+14
                                                else y:=y-2;
                                                gotoxy(x,y);
                                        end;
                                'P':
                                        begin
                                                if y=d+14 then y:=d
                                                else y:=y+2;
                                                gotoxy(x,y);
                                        end;
                                end;
                        end;
                until a=#27;
                typowyk;
        end;

        procedure przel_powierzchnia(x,y,p:integer);
        const
                mm=0.000001;
                cm=0.0001;
                dm=0.01;
                m=1;
                ar=100;
                ha=10000;
                km=1000000;

        var
                a,b:char;
                z,d,e:integer;
                c:real;
                t1:text;
        begin
                d:=y;
                e:=30;
                gotoxy(x,d);
                writeln('Milimetr^2 [mm^2]: ');
                gotoxy(x,d+2);
                writeln('Centymetr^2 [cm^2]: ');
                gotoxy(x,d+4);
                writeln('Decymetr^2 [dm^2]: ');
                gotoxy(x,d+6);
                writeln('Metr [m^2]: ');
                gotoxy(x,d+8);
                writeln('Ar:');
                gotoxy(x,d+10);
                writeln('Hektar [ha]');
                gotoxy(x,d+12);
                writeln('Kilometr^2 [km^2]: ');
                instrukcja(x,d+18,'jednostk©','wyboru jednostek');
                x:=x+24;
                y:=y+6;
                gotoxy(x,y);
                repeat

                typowyk;
                for z:=0 to 12 do
                        begin
                                gotoxy(x,z+d);
                                writeln('                            ');
                        end;

                 gotoxy(x,d);         //wyòwietlenie danych
                 write(c/mm:1:p);
                 gotoxy(x,d+2);
                 write(c/cm:1:p);
                 gotoxy(x,d+4);
                 write(c/dm:1:p);
                 gotoxy(x,d+6);
                 write(c/m:1:p);
                 gotoxy(x,d+8);
                 write(c/ar:1:p);
                 gotoxy(x,d+10);
                 write(c/ha:1:p);
                 gotoxy(x,d+12);
                 write(c/km:1:p);
                 gotoxy(x,y);

                if y=d then podswietlenie_slowa(x,y,naslowo(c/mm,p));    //podswietlenie
                if y=d+2 then podswietlenie_slowa(x,y,naslowo(c/cm,p));
                if y=d+4 then podswietlenie_slowa(x,y,naslowo(c/dm,p));
                if y=d+6 then podswietlenie_slowa(x,y,naslowo(c/m,p));
                if y=d+8 then podswietlenie_slowa(x,y,naslowo(c/ar,p));
                if y=d+10 then podswietlenie_slowa(x,y,naslowo(c/ha,p));
                if y=d+12 then podswietlenie_slowa(x,y,naslowo(c/km,p));

                a:=readkey;
                if a=#13 then
                        begin
                                zaznaczenie_slowa(x,y,0);
                                readln(c);
                                if y = d then c:=c*mm;
                                if y = d+2 then c:=c*cm;
                                if y = d+4 then c:=c*dm;
                                if y = d+8 then c:=c*ar;
                                if y = d+10 then c:=c*ha;
                                if y = d+12 then c:=c*km;

                                assign(t1,'logi\logi_pj.txt');
                                append(t1);
                                writeln(t1,godzina,' - Wprowadzenie danych:');
                                writeln(t1,'           Milimetr^2 [mm^2]:    ',c/mm:1:p);
                                writeln(t1,'           Centymetr^2 [cm^2]:   ',c/cm:1:p);
                                writeln(t1,'           Decymetr^2 [dm^2]:    ',c/dm:1:p);
                                writeln(t1,'           Metr^2 [m^2]:         ',c/m:1:p);
                                writeln(t1,'           Ar:                   ',c/ar:1:p);
                                writeln(t1,'           Hektar [ha]:          ',c/ha:1:p);
                                writeln(t1,'           Kilometr^2 [km^2]:    ',c/km:1:p);
                                writeln(t1);
                                close(t1);
                        end
                else
                begin
                        if y=d then odswietlenie_slowa(x,y,naslowo(c/mm,p));    //odswietlenie
                        if y=d+2 then odswietlenie_slowa(x,y,naslowo(c/cm,p));
                        if y=d+4 then odswietlenie_slowa(x,y,naslowo(c/dm,p));
                        if y=d+6 then odswietlenie_slowa(x,y,naslowo(c/m,p));
                        if y=d+8 then odswietlenie_slowa(x,y,naslowo(c/ar,p));
                        if y=d+10 then odswietlenie_slowa(x,y,naslowo(c/ha,p));
                        if y=d+12 then odswietlenie_slowa(x,y,naslowo(c/km,p));

                        if a=chr(0) then b:=readkey;
                        case b of
                                'H':
                                        begin
                                                if y=d then y:=y+12
                                                else y:=y-2;
                                                gotoxy(x,y);
                                        end;
                                'P':
                                        begin
                                                if y=d+12 then y:=d
                                                else y:=y+2;
                                                gotoxy(x,y);
                                        end;
                                end;
                        end;
                until a=#27;
                typowyk;
                end;

        procedure przel_objetosc(x,y,p:integer);
        const
                ml=0.001;
                oz=0.0283495231;
                l=1;
                m=1000;
                bbl=158.987294928;
                gal=3.785411784;


        var
                a,b:char;
                z,d,e:integer;
                c:real;
                t1:text;
        begin
                d:=y;
                e:=30;
                gotoxy(x,d);
                writeln('Mililitr [ml]: ');
                gotoxy(x,d+2);
                writeln('Uncja [oz]: ');
                gotoxy(x,d+4);
                writeln('Litr [dm^3]: ');
                gotoxy(x,d+6);
                writeln('Galon USA [gal]: ');
                gotoxy(x,d+8);
                writeln('Baryàka [bo]: ');
                gotoxy(x,d+10);
                writeln('Metr^3 [m^3]:');
                instrukcja(x,d+18,'jednostk©','wyboru jednostek');
                x:=x+22;
                y:=y+4;
                gotoxy(x,y);
                repeat

                typowyk;
                for z:=0 to 8 do
                        begin
                                gotoxy(x,z+d);
                                writeln('                            ');
                        end;

                 gotoxy(x,d);         //wyòwietlenie danych
                 write(c/ml:1:p);
                 gotoxy(x,d+2);
                 write(c/oz:1:p);
                 gotoxy(x,d+4);
                 write(c/l:1:p);
                 gotoxy(x,d+6);
                 write(c/gal:1:p);
                 gotoxy(x,d+8);
                 write(c/bbl:1:p);
                 gotoxy(x,d+10);
                 write(c/m:1:p);
                 gotoxy(x,y);

                if y=d then podswietlenie_slowa(x,y,naslowo(c/ml,p));    //podswietlenie
                if y=d+2 then podswietlenie_slowa(x,y,naslowo(c/oz,p));
                if y=d+4 then podswietlenie_slowa(x,y,naslowo(c,p));
                if y=d+6 then podswietlenie_slowa(x,y,naslowo(c/gal,p));
                if y=d+8 then podswietlenie_slowa(x,y,naslowo(c/bbl,p));
                if y=d+10 then podswietlenie_slowa(x,y,naslowo(c/m,p));

                a:=readkey;
                if a=#13 then
                        begin
                                zaznaczenie_slowa(x,y,0);
                                readln(c);
                                if y = d then c:=c*ml;
                                if y = d+2 then c:=c*oz;
                                if y = d+6 then c:=c*gal;
                                if y = d+8 then c:=c*bbl;
                                if y = d+10 then c:=c*m;

                                assign(t1,'logi\logi_pj.txt');
                                append(t1);
                                writeln(t1,godzina,' - Wprowadzenie danych:');
                                writeln(t1,'           Mililitr [ml]:       ',c/ml:1:p);
                                writeln(t1,'           Uncja [oz]:          ',c/oz:1:p);
                                writeln(t1,'           Litr [dm^3]:         ',c/l:1:p);
                                writeln(t1,'           Galon USA [gal]:     ',c/gal:1:p);
                                writeln(t1,'           Barylka [bo]:        ',c/bbl:1:p);
                                writeln(t1,'           Metr^3 [m^3]:        ',c/m:1:p);
                                writeln(t1);
                                close(t1);
                        end
                else
                begin
                        if y=d then odswietlenie_slowa(x,y,naslowo(c/ml,p));    //odswietlenie
                        if y=d+2 then odswietlenie_slowa(x,y,naslowo(c/oz,p));
                        if y=d+4 then odswietlenie_slowa(x,y,naslowo(c,p));
                        if y=d+8 then odswietlenie_slowa(x,y,naslowo(c/gal,p));
                        if y=d+8 then odswietlenie_slowa(x,y,naslowo(c/bbl,p));
                        if y=d+10 then odswietlenie_slowa(x,y,naslowo(c/m,p));

                        if a=chr(0) then b:=readkey;
                        case b of
                                'H':
                                        begin
                                                if y=d then y:=y+10
                                                else y:=y-2;
                                                gotoxy(x,y);
                                        end;
                                'P':
                                        begin
                                                if y=d+10 then y:=d
                                                else y:=y+2;
                                                gotoxy(x,y);
                                        end;
                                end;
                        end;
                until a=#27;
                typowyk;
        end;

        procedure przel_czas(x,y,p:integer);
        const
                ns=0.000000001;
                us=0.000001;
                ms=0.001;
                s=1;
                min=60;
                kwadrans=900;
                h=3600;
                dzien=86400;
                tydzien=604800;
        var
                a,b:char;
                z,d,e:integer;
                c:real;
                t1:text;
        begin
                d:=y;
                e:=30;
                gotoxy(x,d);
                writeln('Nanosekunda [ns]: ');
                gotoxy(x,d+2);
                writeln('Mikrosekunda [us]: ');
                gotoxy(x,d+4);
                writeln('Milisekunda [ms]: ');
                gotoxy(x,d+6);
                writeln('Sekunda [s]: ');
                gotoxy(x,d+8);
                writeln('Minuta [min]: ');
                gotoxy(x,d+10);
                writeln('Kwadrans : ');
                gotoxy(x,d+12);
                writeln('Godzina [h]: ');
                gotoxy(x,d+14);
                writeln('Dzie‰ : ');
                gotoxy(x,d+16);
                writeln('Tydzien : ');
                instrukcja(x,d+22,'jednostk©','wyboru jednostek');
                x:=x+21;
                y:=y+6;
                gotoxy(x,y);
                repeat

                typowyk;
                for z:=0 to 16 do
                        begin
                                gotoxy(x,z+d);
                                writeln('                            ');
                        end;

                 gotoxy(x,d);         //wyòwietlenie danych
                 write(c/ns:1:p);
                 gotoxy(x,d+2);
                 write(c/us:1:p);
                 gotoxy(x,d+4);
                 write(c/ms:1:p);
                 gotoxy(x,d+6);
                 write(c/s:1:p);
                 gotoxy(x,d+8);
                 write(c/min:1:p);
                 gotoxy(x,d+10);
                 write(c/kwadrans:1:p);
                 gotoxy(x,d+12);
                 write(c/h:1:p);
                 gotoxy(x,d+14);
                 write(c/dzien:1:p);
                 gotoxy(x,d+16);
                 write(c/tydzien:1:p);
                 gotoxy(x,y);

                if y=d then podswietlenie_slowa(x,y,naslowo(c/ns,p));    //podswietlenie
                if y=d+2 then podswietlenie_slowa(x,y,naslowo(c/us,p));
                if y=d+4 then podswietlenie_slowa(x,y,naslowo(c/ms,p));
                if y=d+6 then podswietlenie_slowa(x,y,naslowo(c/s,p));
                if y=d+8 then podswietlenie_slowa(x,y,naslowo(c/min,p));
                if y=d+10 then podswietlenie_slowa(x,y,naslowo(c/kwadrans,p));
                if y=d+12 then podswietlenie_slowa(x,y,naslowo(c/h,p));
                if y=d+14 then podswietlenie_slowa(x,y,naslowo(c/dzien,p));
                if y=d+16 then podswietlenie_slowa(x,y,naslowo(c/tydzien,p));

                a:=readkey;
                if a=#13 then
                        begin
                                zaznaczenie_slowa(x,y,0);
                                readln(c);
                                if y = d then c:=c*ns;
                                if y = d+2 then c:=c*us;
                                if y = d+4 then c:=c*ms;
                                if y = d+8 then c:=c*min;
                                if y = d+10 then c:=c*kwadrans;
                                if y = d+12 then c:=c*h;
                                if y = d+14 then c:=c*dzien;
                                if y = d+16 then c:=c*tydzien;

                                assign(t1,'logi\logi_pj.txt');
                                append(t1);
                                writeln(t1,godzina,' - Wprowadzenie danych:');
                                writeln(t1,'           Nanosekunda [ns]:   ',c/ns:1:p);
                                writeln(t1,'           Mikrosekunda [us]:  ',c/us:1:p);
                                writeln(t1,'           Milisekunda [ms]:   ',c/ms:1:p);
                                writeln(t1,'           Sekunda [s]:        ',c/s:1:p);
                                writeln(t1,'           Minuta [min]:       ',c/min:1:p);
                                writeln(t1,'           Kwadrans:           ',c/kwadrans:1:p);
                                writeln(t1,'           Godzina [h]:        ',c/h:1:p);
                                writeln(t1,'           Dzien:              ',c/dzien:1:p);
                                writeln(t1,'           Tydzien:            ',c/tydzien:1:p);
                                writeln(t1);
                                close(t1);
                        end
                else
                begin
                        if y=d then odswietlenie_slowa(x,y,naslowo(c/ns,p));    //odswietlenie
                        if y=d+2 then odswietlenie_slowa(x,y,naslowo(c/us,p));
                        if y=d+4 then odswietlenie_slowa(x,y,naslowo(c/ms,p));
                        if y=d+6 then odswietlenie_slowa(x,y,naslowo(c/s,p));
                        if y=d+8 then odswietlenie_slowa(x,y,naslowo(c/min,p));
                        if y=d+10 then odswietlenie_slowa(x,y,naslowo(c/kwadrans,p));
                        if y=d+12 then odswietlenie_slowa(x,y,naslowo(c/h,p));
                        if y=d+14 then odswietlenie_slowa(x,y,naslowo(c/dzien,p));
                        if y=d+16 then odswietlenie_slowa(x,y,naslowo(c/tydzien,p));
                        if a=chr(0) then b:=readkey;
                        case b of
                                'H':
                                        begin
                                                if y=d then y:=y+16
                                                else y:=y-2;
                                                gotoxy(x,y);
                                        end;
                                'P':
                                        begin
                                                if y=d+16 then y:=d
                                                else y:=y+2;
                                                gotoxy(x,y);
                                        end;
                                end;
                        end;
                until a=#27;
                typowyk;
        end;

        procedure przel_predkosc(x,y,p:integer);
        const
                kmh=0.2777777778;
                mph=0.4470311111;
                kms=1000;
                mps=1609.344;
                ms=1;
                fps=0.3048;
                kn=0.5144444444;
                cs=299792458;

        var
                a,b:char;
                z,d,e:integer;
                c:real;
                t1:text;
        begin
                d:=y;
                e:=30;
                gotoxy(x,d);
                writeln('kilometr na h [km/h]: ');
                gotoxy(x,d+2);
                writeln('mila na h [mph]: ');
                gotoxy(x,d+4);
                writeln('w©zeà [kn]: ');
                gotoxy(x,d+6);
                writeln('stopa na s [fps]: ');
                gotoxy(x,d+8);
                writeln('metr na s [m/s]: ');
                gotoxy(x,d+10);
                writeln('kilometr na s [km/s]: ');
                gotoxy(x,d+12);
                writeln('mila na s [mps]: ');
                gotoxy(x,d+14);
                writeln('pr©dkoòÜ òwiatàa [c]: ');
                instrukcja(x,d+18,'jednostk©','wyboru jednostek');
                x:=x+25;
                y:=y+8;
                gotoxy(x,y);
                repeat

                typowyk;
                for z:=0 to 14 do
                        begin
                                gotoxy(x,z+d);
                                writeln('                            ');
                        end;

                 gotoxy(x,d);         //wyòwietlenie danych
                 write(c/kmh:1:p);
                 gotoxy(x,d+2);
                 write(c/mph:1:p);
                 gotoxy(x,d+4);
                 write(c/kn:1:p);
                 gotoxy(x,d+6);
                 write(c/fps:1:p);
                 gotoxy(x,d+8);
                 write(c/ms:1:p);
                 gotoxy(x,d+10);
                 write(c/kms:1:p);
                 gotoxy(x,d+12);
                 write(c/mps:1:p);
                 gotoxy(x,d+14);
                 write(c/cs:1:p);
                 gotoxy(x,y);

                if y=d then podswietlenie_slowa(x,y,naslowo(c/kmh,p));    //podswietlenie
                if y=d+2 then podswietlenie_slowa(x,y,naslowo(c/mph,p));
                if y=d+4 then podswietlenie_slowa(x,y,naslowo(c/kn,p));
                if y=d+6 then podswietlenie_slowa(x,y,naslowo(c/fps,p));
                if y=d+8 then podswietlenie_slowa(x,y,naslowo(c/ms,p));
                if y=d+10 then podswietlenie_slowa(x,y,naslowo(c/kms,p));
                if y=d+12 then podswietlenie_slowa(x,y,naslowo(c/mps,p));
                if y=d+14 then podswietlenie_slowa(x,y,naslowo(c/cs,p));

                a:=readkey;
                if a=#13 then
                        begin
                                zaznaczenie_slowa(x,y,0);
                                readln(c);
                                if y = d then c:=c*kmh;
                                if y = d+2 then c:=c*mph;
                                if y = d+4 then c:=c*kn;
                                if y = d+6 then c:=c*fps;
                                if y = d+10 then c:=c*kms;
                                if y = d+12 then c:=c*mps;
                                if y = d+14 then c:=c*cs;

                                assign(t1,'logi\logi_pj.txt');
                                append(t1);
                                writeln(t1,godzina,' - Wprowadzenie danych:');
                                writeln(t1,'           kilometr na h [km/h]:   ',c/kmh:1:p);
                                writeln(t1,'           mila na h [mph]:        ',c/mph:1:p);
                                writeln(t1,'           kilometr na s [km/s]:   ',c/kn:1:p);
                                writeln(t1,'           mila na s [mps]:        ',c/fps:1:p);
                                writeln(t1,'           metr na s [m/s]:        ',c/ms:1:p);
                                writeln(t1,'           stopa na s [fps]:       ',c/kms:1:p);
                                writeln(t1,'           wezel [kn]:             ',c/mps:1:p);
                                writeln(t1,'           predkosc swiatla [c]:   ',c/cs:1:p);
                                writeln(t1);
                                close(t1);
                        end
                else
                begin
                        if y=d then odswietlenie_slowa(x,y,naslowo(c/kmh,p));    //podswietlenie
                        if y=d+2 then odswietlenie_slowa(x,y,naslowo(c/mph,p));
                        if y=d+4 then odswietlenie_slowa(x,y,naslowo(c/kn,p));
                        if y=d+6 then odswietlenie_slowa(x,y,naslowo(c/fps,p));
                        if y=d+8 then odswietlenie_slowa(x,y,naslowo(c/ms,p));
                        if y=d+10 then odswietlenie_slowa(x,y,naslowo(c/kms,p));
                        if y=d+12 then odswietlenie_slowa(x,y,naslowo(c/mps,p));
                        if y=d+14 then odswietlenie_slowa(x,y,naslowo(c/cs,p));

                        if a=chr(0) then b:=readkey;
                        case b of
                                'H':
                                        begin
                                                if y=d then y:=y+14
                                                else y:=y-2;
                                                gotoxy(x,y);
                                        end;
                                'P':
                                        begin
                                                if y=d+14 then y:=d
                                                else y:=y+2;
                                                gotoxy(x,y);
                                        end;
                                end;
                        end;
                until a=#27;
                typowyk;
        end;

        procedure przel_temperatura(x,y,p:integer);
        var
                a,b:char;
                z,d,e,kopiax,kopiay,kopia2y:integer;
                C,F,K:real;
                t1:text;
                powtorzenie:boolean;
        label
                poczatek;
        begin
                powtorzenie:=false;
                poczatek:
                c:=0;
                d:=y;
                e:=30;
                kopiax:=x;
                kopiay:=y;

                K:=0;
                C:=K-273.15;
                F:=(C*1.8)+32;
                gotoxy(x,d);
                writeln('Celcjusz [C]: ');
                gotoxy(x,d+2);
                writeln('Fahrenheit [F]: ');
                gotoxy(x,d+4);
                writeln('Kelwin [K]: ');
                instrukcja(x,d+12,'jednostk©','wyboru jednostek');
                x:=x+20;
                gotoxy(x,y);
                repeat

                typowyk;
                for z:=0 to 4 do
                        begin
                                gotoxy(x,z+d);
                                writeln('                            ');
                        end;

                 gotoxy(x,d);         //wyòwietlenie danych
                 write(C:1:p);
                 gotoxy(x,d+2);
                 write(F:1:p);
                 gotoxy(x,d+4);
                 write(K:1:p);
                 gotoxy(x,y);

                 if powtorzenie = true then y:=kopia2y;

                if y=d then podswietlenie_slowa(x,y,naslowo(C,p));    //podswietlenie
                if y=d+2 then podswietlenie_slowa(x,y,naslowo(F,p));
                if y=d+4 then podswietlenie_slowa(x,y,naslowo(K,p));
                powtorzenie:=false;

                a:=readkey;
                typowyk;
                gotoxy(50,24);
                write('                                           ');
                if a=#13 then
                        begin
                                zaznaczenie_slowa(x,y,0);
                                readln(C);
                                if y = d+2 then C:=(C-32)/1.8;
                                if y = d+4 then C:=C-273.15;

                                F:=(C*1.8)+32;
                                K:=C+273.15;
                                if K < 0 then
                                        begin
                                                odswietlenie_slowa(x,y,naslowo(K,p));
                                                typowyk;
                                                gotoxy(50,24);
                                                write(godzina,' - Wpisana zostaàa bl©dna wartoòÜ');
                                                powtorzenie:=true;
                                                kopia2y:=y;
                                                x:=kopiax;
                                                y:=kopiay;
                                                goto poczatek;
                                        end;
                                TextColor(0);
                                TextBackGround(15);
                                gotoxy(x,d);
                                write(C:1:p);
                                gotoxy(x,d+2);
                                write(F:1:p);
                                gotoxy(x,d+4);
                                write(K:1:p);
                                gotoxy(x,y);

                                assign(t1,'logi\logi_pj.txt');
                                append(t1);
                                writeln(t1,godzina,' - Wprowadzenie danych:');
                                writeln(t1,'           Celcjusze [C]:     ',C:1:p);
                                writeln(t1,'           Fehrenheity [F]:   ',F:1:p);
                                writeln(t1,'           Kelwiny [K]:       ',K:1:p);
                                writeln(t1);
                                close(t1);
                        end
                else
                begin
                        if y=d then odswietlenie_slowa(x,y,naslowo(C,p));    //odswietlenie
                        if y=d+2 then odswietlenie_slowa(x,y,naslowo(F,p));
                        if y=d+4 then odswietlenie_slowa(x,y,naslowo(K,p));

                        if a=chr(0) then b:=readkey;
                        case b of
                                'H':
                                        begin
                                                if y=d then y:=y+4
                                                else y:=y-2;
                                                gotoxy(x,y);
                                        end;
                                'P':
                                        begin
                                                if y=d+4 then y:=d
                                                else y:=y+2;
                                                gotoxy(x,y);
                                        end;
                                end;
                        end;
                until a=#27;
                typowyk;
        end;

        procedure przel_moc(x,y,p:integer);
        const
                w=1;
                kw=1000;
                km=735.49875;
                hp=745.69987158227022;

        var
                a,b:char;
                z,d,e:integer;
                c:real;
                t1:text;
        begin
                d:=y;
                e:=30;
                gotoxy(x,d);
                writeln('Wat [W]: ');
                gotoxy(x,d+2);
                writeln('Kilowat [kW]: ');
                gotoxy(x,d+4);
                writeln('Ko‰ mechaniczny [KM]: ');
                gotoxy(x,d+6);
                writeln('Ko‰ parowy [HP]: ');
                instrukcja(x,d+12,'jednostk©','wyboru jednostek');
                x:=x+25;
                gotoxy(x,y);
                repeat

                typowyk;
                for z:=0 to 6 do
                        begin
                                gotoxy(x,z+d);
                                writeln('                            ');
                        end;

                 gotoxy(x,d);         //wyòwietlenie danych
                 write(c/w:1:p);
                 gotoxy(x,d+2);
                 write(c/kw:1:p);
                 gotoxy(x,d+4);
                 write(c/km:1:p);
                 gotoxy(x,d+6);
                 write(c/hp:1:p);
                 gotoxy(x,y);

                if y=d then podswietlenie_slowa(x,y,naslowo(c/w,p));    //podswietlenie
                if y=d+2 then podswietlenie_slowa(x,y,naslowo(c/kw,p));
                if y=d+4 then podswietlenie_slowa(x,y,naslowo(c/km,p));
                if y=d+6 then podswietlenie_slowa(x,y,naslowo(c/hp,p));
                a:=readkey;
                if a=#13 then
                        begin
                                typowyk;
                                gotoxy(x,y);
                                write('                            ');
                                gotoxy(x,y);
                                TextColor(0);
                                TextBackGround(15);
                                write(' ');
                                gotoxy(x,y);
                                typowyk;
                                readln(c);
                                if y = d+2 then c:=c*kw;
                                if y = d+4 then c:=c*km;
                                if y = d+6 then c:=c*hp;
                                for z:=0 to 6 do
                                        begin
                                                gotoxy(x,z+d);
                                                writeln('                            ');
                                        end;
                                TextColor(0);
                                TextBackGround(15);
                                gotoxy(x,d);
                                write(c/w:1:p);
                                gotoxy(x,d+2);
                                write(c/kw:1:p);
                                gotoxy(x,d+4);
                                write(c/hp:1:p);
                                gotoxy(x,d+6);
                                write(c/km:1:p);
                                gotoxy(x,y);

                                assign(t1,'logi\logi_pj.txt');
                                append(t1);
                                writeln(t1,godzina,' - Wprowadzenie danych:');
                                writeln(t1,'           Wat [W]:                ',c/w:1:p);
                                writeln(t1,'           Kilowat [kW]:           ',c/kw:1:p);
                                writeln(t1,'           Kon mechaniczny [KM]:   ',c/km:1:p);
                                writeln(t1,'           Kon parowy [HP]:        ',c/hp:1:p);
                                writeln(t1);
                                close(t1);


                        end
                else
                begin
                        if y=d then odswietlenie_slowa(x,y,naslowo(c/w,p));    //odswietlenie
                        if y=d+2 then odswietlenie_slowa(x,y,naslowo(c/kw,p));
                        if y=d+4 then odswietlenie_slowa(x,y,naslowo(c/km,p));
                        if y=d+6 then odswietlenie_slowa(x,y,naslowo(c/hp,p));

                        if a=chr(0) then b:=readkey;
                        case b of
                                'H':
                                        begin
                                                if y=d then y:=y+6
                                                else y:=y-2;
                                                gotoxy(x,y);
                                        end;
                                'P':
                                        begin
                                                if y=d+6 then y:=d
                                                else y:=y+2;
                                                gotoxy(x,y);
                                        end;
                                end;
                        end;
                until a=#27;
                typowyk;
        end;

        procedure przel_masa(x,y,p:integer);
        const
                mg=0.000001;
                g=0.001;
                ct=0.0002;
                oz=0.0283495231;
                dag=0.01;
                kg=1;
                ib=0.45359237;
                t=1000;
        var
                a,b:char;
                z,d,e:integer;
                c:real;
                t1:text;
        begin
                d:=y;
                e:=30;
                gotoxy(x,d);
                writeln('Miligram [mg]: ');
                gotoxy(x,d+2);
                writeln('Karat [ct]: ');
                gotoxy(x,d+4);
                writeln('Gram [g]: ');
                gotoxy(x,d+6);
                writeln('Dekagram [dag]: ');
                gotoxy(x,d+8);
                writeln('Uncja [oz]: ');
                gotoxy(x,d+10);
                writeln('Funt [ib]: ');
                gotoxy(x,d+12);
                writeln('Kilogram [kg]: ');
                gotoxy(x,d+14);
                writeln('Tona [t]: ');
                instrukcja(x,d+18,'jednostk©','wyboru jednostek');
                x:=x+19;
                y:=y+12;
                gotoxy(x,y);
                repeat

                typowyk;
                for z:=0 to 14 do
                        begin
                                gotoxy(x,z+d);
                                writeln('                            ');
                        end;

                 gotoxy(x,d);         //wyòwietlenie danych
                 write(c/mg:1:p);
                 gotoxy(x,d+2);
                 write(c/ct:1:p);
                 gotoxy(x,d+4);
                 write(c/g:1:p);
                 gotoxy(x,d+6);
                 write(c/dag:1:p);
                 gotoxy(x,d+8);
                 write(c/oz:1:p);
                 gotoxy(x,d+10);
                 write(c/ib:1:p);
                 gotoxy(x,d+12);
                 write(c/kg:1:p);
                 gotoxy(x,d+14);
                 write(c/t:1:p);
                 gotoxy(x,y);

                if y=d then podswietlenie_slowa(x,y,naslowo(c/mg,p));    //podswietlenie
                if y=d+2 then podswietlenie_slowa(x,y,naslowo(c/ct,p));
                if y=d+4 then podswietlenie_slowa(x,y,naslowo(c/g,p));
                if y=d+6 then podswietlenie_slowa(x,y,naslowo(c/dag,p));
                if y=d+8 then podswietlenie_slowa(x,y,naslowo(c/oz,p));
                if y=d+10 then podswietlenie_slowa(x,y,naslowo(c/ib,p));
                if y=d+12 then podswietlenie_slowa(x,y,naslowo(c/kg,p));
                if y=d+14 then podswietlenie_slowa(x,y,naslowo(c/t,p));

                a:=readkey;
                if a=#13 then
                        begin
                                zaznaczenie_slowa(x,y,0);
                                readln(c);
                                if y = d then c:=c*mg;
                                if y = d+2 then c:=c*ct;
                                if y = d+4 then c:=c*g;
                                if y = d+6 then c:=c*dag;
                                if y = d+8 then c:=c*oz;
                                if y = d+10 then c:=c*ib;
                                if y = d+14 then c:=c*t;

                                assign(t1,'logi\logi_pj.txt');
                                append(t1);
                                writeln(t1,godzina,' - Wprowadzenie danych:');
                                writeln(t1,'           Miligram [mg]:    ',c/mg:1:p);
                                writeln(t1,'           Gram [g]:         ',c/ct:1:p);
                                writeln(t1,'           Karat [ct]:       ',c/g:1:p);
                                writeln(t1,'           Uncja [oz]:       ',c/dag:1:p);
                                writeln(t1,'           Dekagram [dag]:   ',c/oz:1:p);
                                writeln(t1,'           Kilogram [kg]:    ',c/ib:1:p);
                                writeln(t1,'           Funt [ib]:        ',c/kg:1:p);
                                writeln(t1,'           Tona [t]:         ',c/t:1:p);
                                writeln(t1);
                                close(t1);
                        end
                else
                begin
                        if y=d then odswietlenie_slowa(x,y,naslowo(c/mg,p));    //odswietlenie
                        if y=d+2 then odswietlenie_slowa(x,y,naslowo(c/ct,p));
                        if y=d+4 then odswietlenie_slowa(x,y,naslowo(c/g,p));
                        if y=d+6 then odswietlenie_slowa(x,y,naslowo(c/dag,p));
                        if y=d+8 then odswietlenie_slowa(x,y,naslowo(c/oz,p));
                        if y=d+10 then odswietlenie_slowa(x,y,naslowo(c/ib,p));
                        if y=d+12 then odswietlenie_slowa(x,y,naslowo(c/kg,p));
                        if y=d+14 then odswietlenie_slowa(x,y,naslowo(c/t,p));

                        if a=chr(0) then b:=readkey;
                        case b of
                                'H':
                                        begin
                                                if y=d then y:=y+14
                                                else y:=y-2;
                                                gotoxy(x,y);
                                        end;
                                'P':
                                        begin
                                                if y=d+14 then y:=d
                                                else y:=y+2;
                                                gotoxy(x,y);
                                        end;
                                end;
                        end;
                until a=#27;
                typowyk;
        end;

        procedure przel_dane(x,y,p:integer);
        const
                bit=0.125;
                bajt=1;
                kbit=128;
                kB=1024;
                Mbit=131072;
                MB=1048576;
                Gbit=134217728;
                GB=1073741824;
                TB=1099511627776;
                PB=1125899906842624;
        var
                a,b:char;
                z,d,e:integer;
                c:real;
                t1:text;
        begin
                d:=y;
                e:=30;
                gotoxy(x,d);
                writeln('Bit [b]: ');
                gotoxy(x,d+2);
                writeln('Bajt [B]: ');
                gotoxy(x,d+4);
                writeln('Kilobit [kb]: ');
                gotoxy(x,d+6);
                writeln('Kilobajt [kB]: ');
                gotoxy(x,d+8);
                writeln('Megabit [Mb]: ');
                gotoxy(x,d+10);
                writeln('Megabajt [MB]: ');
                gotoxy(x,d+12);
                writeln('Gigabit [Gb]:  ');
                gotoxy(x,d+14);
                writeln('Gigabajt [GB]: ');
                gotoxy(x,d+16);
                writeln('Terabajt [TB]: ');
                gotoxy(x,d+18);
                writeln('Petabajt [PB]: ');
                instrukcja(x,d+22,'jednostk©','wyboru jednostek');
                x:=x+18;
                y:=y+10;
                gotoxy(x,y);
                repeat

                typowyk;
                for z:=0 to 18 do
                        begin
                                gotoxy(x,z+d);
                                writeln('                            ');
                        end;

                 gotoxy(x,d);         //wyòwietlenie danych
                 write(c/bit:1:p);
                 gotoxy(x,d+2);
                 write(c/bajt:1:p);
                 gotoxy(x,d+4);
                 write(c/kbit:1:p);
                 gotoxy(x,d+6);
                 write(c/kb:1:p);
                 gotoxy(x,d+8);
                 write(c/mbit:1:p);
                 gotoxy(x,d+10);
                 write(c/mb:1:p);
                 gotoxy(x,d+12);
                 write(c/gbit:1:p);
                 gotoxy(x,d+14);
                 write(c/gb:1:p);
                 gotoxy(x,d+16);
                 write(c/tb:1:p);
                 gotoxy(x,d+18);
                 write(c/pb:1:p);
                 gotoxy(x,y);

                if y=d then podswietlenie_slowa(x,y,naslowo(c/bit,p));    //podswietlenie
                if y=d+2 then podswietlenie_slowa(x,y,naslowo(c/bajt,p));
                if y=d+4 then podswietlenie_slowa(x,y,naslowo(c/kbit,p));
                if y=d+6 then podswietlenie_slowa(x,y,naslowo(c/kb,p));
                if y=d+8 then podswietlenie_slowa(x,y,naslowo(c/mbit,p));
                if y=d+10 then podswietlenie_slowa(x,y,naslowo(c/mb,p));
                if y=d+12 then podswietlenie_slowa(x,y,naslowo(c/gbit,p));
                if y=d+14 then podswietlenie_slowa(x,y,naslowo(c/gb,p));
                if y=d+16 then podswietlenie_slowa(x,y,naslowo(c/tb,p));
                if y=d+18 then podswietlenie_slowa(x,y,naslowo(c/pb,p));

                a:=readkey;
                if a=#13 then
                        begin
                                zaznaczenie_slowa(x,y,0);
                                readln(c);
                                if y = d then c:=c*bit;
                                if y = d+2 then c:=c*bajt;
                                if y = d+4 then c:=c*kbit;
                                if y = d+6 then c:=c*kB;
                                if y = d+8 then c:=c*Mbit;
                                if y = d+10 then c:=c*MB;
                                if y = d+12 then c:=c*Gbit;
                                if y = d+14 then c:=c*GB;
                                if y = d+16 then c:=c*TB;
                                if y = d+18 then c:=c*PB;

                                assign(t1,'logi\logi_pj.txt');
                                append(t1);
                                writeln(t1,godzina,' - Wprowadzenie danych:');
                                writeln(t1,'           Bit [b]:         ',c/bit:1:p);
                                writeln(t1,'           Bajt [B]:        ',c/bajt:1:p);
                                writeln(t1,'           Kilobit [kb]:    ',c/kbit:1:p);
                                writeln(t1,'           Kilobajt [kB]:   ',c/kB:1:p);
                                writeln(t1,'           Megabit [Mb]:    ',c/mbit:1:p);
                                writeln(t1,'           Megabajt [MB]:   ',c/MB:1:p);
                                writeln(t1,'           Gigabit [Gb]:    ',c/Gbit:1:p);
                                writeln(t1,'           Gigabajt [GB]:   ',c/GB:1:p);
                                writeln(t1,'           Terabajt [TB]:   ',c/TB:1:p);
                                writeln(t1,'           Petabajt [PB]:   ',c/PB:1:p);
                                writeln(t1);
                                close(t1);
                        end
                else
                begin
                        if y=d then odswietlenie_slowa(x,y,naslowo(c/bit,p));    //odswietlenie
                        if y=d+2 then odswietlenie_slowa(x,y,naslowo(c/bajt,p));
                        if y=d+4 then odswietlenie_slowa(x,y,naslowo(c/kbit,p));
                        if y=d+6 then odswietlenie_slowa(x,y,naslowo(c/kb,p));
                        if y=d+8 then odswietlenie_slowa(x,y,naslowo(c/mbit,p));
                        if y=d+10 then odswietlenie_slowa(x,y,naslowo(c/mb,p));
                        if y=d+12 then odswietlenie_slowa(x,y,naslowo(c/gbit,p));
                        if y=d+14 then odswietlenie_slowa(x,y,naslowo(c/gb,p));
                        if y=d+16 then odswietlenie_slowa(x,y,naslowo(c/tb,p));
                        if y=d+18 then odswietlenie_slowa(x,y,naslowo(c/pb,p));

                        if a=chr(0) then b:=readkey;
                        case b of
                                'H':
                                        begin
                                                if y=d then y:=y+18
                                                else y:=y-2;
                                                gotoxy(x,y);
                                        end;
                                'P':
                                        begin
                                                if y=d+18 then y:=d
                                                else y:=y+2;
                                                gotoxy(x,y);
                                        end;
                                end;
                        end;
                until a=#27;
                typowyk;
        end;

        procedure przedrostki;
        begin
                writeln('         Tabela przedrostk¢w SI             ');
                writeln;
                writeln('Nazwa  Symbol  Mnoænik  Nazwa mnoænika       ');
                writeln('                                             ');
                writeln('otta    Y      10^24    kwadrylion           ');
                writeln('zetta   Z      10^21    tryliard             ');
                writeln('eksa    E      10^18    trylion              ');
                writeln('peta    P      10^15    biliard              ');
                writeln('tera    T      10^12    bilion               ');
                writeln('gig     G      10^9     miliard              ');
                writeln('mega    M      10^6     milion               ');
                writeln('kilo    k      10^3     tysi•c               ');
                writeln('hekto   h      10^2     sto                  ');
                writeln('deka    da     10^1     dziesi©Ü             ');
                writeln('               10^0     jeden                ');
                writeln('decy    d      10^-1    jedna dziesi•ta      ');
                writeln('centy   c      10^-2    jedna setna          ');
                writeln('mili    m      10^-3    jedna tysi©czna      ');
                writeln('mikro   u      10^-6    jedna milionowa      ');
                writeln('nano    n      10^-9    jedna miliardowa     ');
                writeln('piko    p      10^-12   jedna bilionowa      ');
                writeln('femto   f      10^-15   jedna biliardowa     ');
                writeln('atto    a      10^-18   jedna trylionowa     ');
                writeln('zepto   z      10^-21   jedna tryliardowa    ');
                writeln('jokto   y      10^-24   jedna kwadrylionowa  ');
        end;

        function koder(znak:char):char;
        begin
                case znak of
                        ' ':koder:='&';
                        '!':koder:='#';
                        '"':koder:='!';
                        '#':koder:='(';
                        '$':koder:='#';
                        '%':koder:='+';
                        '&':koder:='$';
                        #39:koder:=' ';
                        '(':koder:=#39;
                        ')':koder:='-';
                        '*':koder:='"';
                        '+':koder:=',';
                        ',':koder:='.';
                        '-':koder:='*';
                        '.':koder:='/';
                        '/':koder:=')';
                        '0':koder:='5';
                        '1':koder:='4';
                        '2':koder:='8';
                        '3':koder:='1';
                        '4':koder:='6';
                        '5':koder:='0';
                        '6':koder:='9';
                        '7':koder:='3';
                        '8':koder:='7';
                        '9':koder:='2';
                        ':':koder:=';';
                        ';':koder:='>';
                        '<':koder:=':';
                        '=':koder:='@';
                        '>':koder:='<';
                        '?':koder:='=';
                        '@':koder:='?';
                        'A':koder:='E';
                        '§':koder:='ç';
                        'B':koder:='K';
                        'C':koder:='A';
                        'è':koder:='ó';
                        'D':koder:='Q';
                        'E':koder:='L';
                        '®':koder:='„';
                        'F':koder:='V';
                        'G':koder:='T';
                        'H':koder:='D';
                        'I':koder:='G';
                        'J':koder:='R';
                        'K':koder:='B';
                        'L':koder:='O';
                        'M':koder:='Z';
                        'N':koder:='C';
                        '„':koder:='‡';
                        'O':koder:='I';
                        '‡':koder:='®';
                        'P':koder:='S';
                        'Q':koder:='Y';
                        'R':koder:='X';
                        'S':koder:='U';
                        'ó':koder:='è';
                        'T':koder:='W';
                        'U':koder:='N';
                        'V':koder:='J';
                        'W':koder:='M';
                        'X':koder:='F';
                        'Y':koder:='H';
                        'Z':koder:='P';
                        'ç':koder:='Ω';
                        'Ω':koder:='§';
                        '[':koder:='[';
                        '\':koder:='_';
                        ']':koder:='\';
                        '^':koder:=']';
                        '_':koder:='^';
                        'a':koder:='p';
                        '•':koder:='‰';
                        'b':koder:='e';
                        'c':koder:='y';
                        'Ü':koder:='©';
                        'd':koder:='a';
                        'e':koder:='g';
                        '©':koder:='¢';
                        'f':koder:='w';
                        'g':koder:='j';
                        'h':koder:='q';
                        'i':koder:='d';
                        'j':koder:='f';
                        'k':koder:='r';
                        'l':koder:='z';
                        'à':koder:='Ü';
                        'm':koder:='o';
                        'n':koder:='h';
                        '‰':koder:='ò';
                        'o':koder:='v';
                        '¢':koder:='•';
                        'p':koder:='i';
                        'q':koder:='m';
                        'r':koder:='c';
                        's':koder:='x';
                        'ò':koder:='æ';
                        't':koder:='s';
                        'u':koder:='l';
                        'v':koder:='k';
                        'w':koder:='b';
                        'x':koder:='n';
                        'y':koder:='t';
                        'z':koder:='u';
                        '´':koder:='à';
                        'æ':koder:='´';
                        '{':koder:='|';
                        '|':koder:='}';
                        '}':koder:='{';
                        'ù':koder:='ù';
                        end;
        end;



        function koder2(znak:char):char;

        begin
                case znak of
                        ' ':koder2:='$';
                        '!':koder2:='(';
                        '"':koder2:='%';
                        '#':koder2:='&';
                        '$':koder2:='-';
                        '%':koder2:='.';
                        '&':koder2:='"';
                        #39:koder2:=')';
                        '(':koder2:=#39;
                        ')':koder2:='/';
                        '*':koder2:='!';
                        '+':koder2:='#';
                        ',':koder2:='+';
                        '-':koder2:=',';
                        '.':koder2:=' ';
                        '/':koder2:='*';
                        '0':koder2:='8';
                        '1':koder2:='7';
                        '2':koder2:='3';
                        '3':koder2:='0';
                        '4':koder2:='1';
                        '5':koder2:='2';
                        '6':koder2:='9';
                        '7':koder2:='4';
                        '8':koder2:='6';
                        '9':koder2:='5';
                        ':':koder2:='=';
                        ';':koder2:='<';
                        '<':koder2:=':';
                        '=':koder2:='>';
                        '>':koder2:='?';
                        '?':koder2:='@';
                        '@':koder2:=';';
                        'A':koder2:='M';
                        '§':koder2:='D';
                        'B':koder2:='Q';
                        'C':koder2:='K';
                        'è':koder2:='W';
                        'D':koder2:='G';
                        'E':koder2:='§';
                        '®':koder2:='N';
                        'F':koder2:='ó';
                        'G':koder2:='L';
                        'H':koder2:='P';
                        'I':koder2:='‡';
                        'J':koder2:='A';
                        'K':koder2:='®';
                        'L':koder2:='Y';
                        'M':koder2:='R';
                        'N':koder2:='ç';
                        '„':koder2:='O';
                        'O':koder2:='V';
                        '‡':koder2:='H';
                        'P':koder2:='J';
                        'Q':koder2:='X';
                        'R':koder2:='Z';
                        'S':koder2:='B';
                        'ó':koder2:='„';
                        'T':koder2:='è';
                        'U':koder2:='Ω';
                        'V':koder2:='F';
                        'W':koder2:='E';
                        'X':koder2:='T';
                        'Y':koder2:='I';
                        'Z':koder2:='S';
                        'ç':koder2:='C';
                        'Ω':koder2:='U';
                        '[':koder2:='_';
                        '\':koder2:='[';
                        ']':koder2:='^';
                        '^':koder2:='\';
                        '_':koder2:=']';
                        '`':koder2:='_';
                        'a':koder2:='f';
                        '•':koder2:='Ü';
                        'b':koder2:='i';
                        'c':koder2:='r';
                        'Ü':koder2:='o';
                        'd':koder2:='k';
                        'e':koder2:='n';
                        '©':koder2:='ò';
                        'f':koder2:='b';
                        'g':koder2:='l';
                        'h':koder2:='y';
                        'i':koder2:='m';
                        'j':koder2:='w';
                        'k':koder2:='¢';
                        'l':koder2:='d';
                        'à':koder2:='s';
                        'm':koder2:='a';
                        'n':koder2:='g';
                        '‰':koder2:='p';
                        'o':koder2:='´';
                        '¢':koder2:='t';
                        'p':koder2:='æ';
                        'q':koder2:='u';
                        'r':koder2:='h';
                        's':koder2:='q';
                        'ò':koder2:='v';
                        't':koder2:='x';
                        'u':koder2:='à';
                        'v':koder2:='•';
                        'w':koder2:='z';
                        'x':koder2:='©';
                        'y':koder2:='‰';
                        'z':koder2:='c';
                        '´':koder2:='j';
                        'æ':koder2:='e';
                        '{':koder2:='}';
                        '|':koder2:='{';
                        '}':koder2:='|';
                        'ù':koder2:='ù';
                        end;
        end;

        function koder3(znak:char):char;
        begin
                case znak of
                        ' ':koder3:='%';
                        '!':koder3:='$';
                        '"':koder3:='(';
                        '#':koder3:='-';
                        '$':koder3:='.';
                        '%':koder3:='&';
                        '&':koder3:='/';
                        #39:koder3:='+';
                        '(':koder3:='"';
                        ')':koder3:=')';
                        '*':koder3:=' ';
                        '+':koder3:=#39;
                        ',':koder3:='#';
                        '-':koder3:='!';
                        '.':koder3:='*';
                        '/':koder3:=',';
                        '0':koder3:='1';
                        '1':koder3:='7';
                        '2':koder3:='6';
                        '3':koder3:='8';
                        '4':koder3:='9';
                        '5':koder3:='3';
                        '6':koder3:='5';
                        '7':koder3:='0';
                        '8':koder3:='4';
                        '9':koder3:='2';
                        ':':koder3:='?';
                        ';':koder3:='=';
                        '<':koder3:='@';
                        '=':koder3:='<';
                        '>':koder3:=':';
                        '?':koder3:=';';
                        '@':koder3:='>';
                        'A':koder3:='W';
                        '§':koder3:='Y';
                        'B':koder3:='H';
                        'C':koder3:='K';
                        'è':koder3:='„';
                        'D':koder3:='ç';
                        'E':koder3:='T';
                        '®':koder3:='D';
                        'F':koder3:='C';
                        'G':koder3:='Z';
                        'H':koder3:='G';
                        'I':koder3:='Ω';
                        'J':koder3:='M';
                        'K':koder3:='J';
                        'L':koder3:='R';
                        'M':koder3:='U';
                        'N':koder3:='‡';
                        '„':koder3:='®';
                        'O':koder3:='Q';
                        '‡':koder3:='B';
                        'P':koder3:='L';
                        'Q':koder3:='è';
                        'R':koder3:='N';
                        'S':koder3:='F';
                        'ó':koder3:='O';
                        'T':koder3:='E';
                        'U':koder3:='§';
                        'V':koder3:='S';
                        'W':koder3:='P';
                        'X':koder3:='ó';
                        'Y':koder3:='A';
                        'Z':koder3:='V';
                        'ç':koder3:='X';
                        'Ω':koder3:='I';
                        '[':koder3:='^';
                        '\':koder3:=']';
                        ']':koder3:='_';
                        '^':koder3:='[';
                        '_':koder3:='\';
                        'a':koder3:='r';
                        '•':koder3:='l';
                        'b':koder3:='ò';
                        'c':koder3:='k';
                        'Ü':koder3:='d';
                        'd':koder3:='i';
                        'e':koder3:='Ü';
                        '©':koder3:='y';
                        'f':koder3:='¢';
                        'g':koder3:='w';
                        'h':koder3:='f';
                        'i':koder3:='à';
                        'j':koder3:='z';
                        'k':koder3:='b';
                        'l':koder3:='‰';
                        'à':koder3:='o';
                        'm':koder3:='æ';
                        'n':koder3:='v';
                        '‰':koder3:='ù';
                        'o':koder3:='•';
                        '¢':koder3:='m';
                        'p':koder3:='n';
                        'q':koder3:='j';
                        'r':koder3:='e';
                        's':koder3:='u';
                        'ò':koder3:='s';
                        't':koder3:='c';
                        'u':koder3:='x';
                        'v':koder3:='´';
                        'w':koder3:='g';
                        'x':koder3:='q';
                        'y':koder3:='h';
                        'z':koder3:='t';
                        '´':koder3:='a';
                        'æ':koder3:='p';
                        '{':koder3:='}';
                        '|':koder3:='|';
                        '}':koder3:='{';
                        'ù':koder3:='©';
                        end;
        end;


        function dekoder(znak:char):char;
        begin

                case znak of
                        ' ':dekoder:=#39;
                        '!':dekoder:='"';
                        '"':dekoder:='*';
                        '#':dekoder:='!';
                        '$':dekoder:='&';
                        '%':dekoder:='$';
                        '&':dekoder:=' ';
                        #39:dekoder:='(';
                        '(':dekoder:='#';
                        ')':dekoder:='/';
                        '*':dekoder:='-';
                        '+':dekoder:='%';
                        ',':dekoder:='+';
                        '-':dekoder:='*';
                        '.':dekoder:=',';
                        '/':dekoder:='.';
                        '0':dekoder:='5';
                        '1':dekoder:='3';
                        '2':dekoder:='9';
                        '3':dekoder:='7';
                        '4':dekoder:='1';
                        '5':dekoder:='0';
                        '6':dekoder:='4';
                        '7':dekoder:='8';
                        '8':dekoder:='2';
                        '9':dekoder:='6';
                        ':':dekoder:='<';
                        ';':dekoder:=':';
                        '<':dekoder:='>';
                        '=':dekoder:='?';
                        '>':dekoder:=';';
                        '?':dekoder:='@';
                        '@':dekoder:='=';
                        'A':dekoder:='C';
                        '§':dekoder:='Ω';
                        'B':dekoder:='K';
                        'C':dekoder:='N';
                        'è':dekoder:='ó';
                        'D':dekoder:='H';
                        'E':dekoder:='A';
                        '®':dekoder:='‡';
                        'F':dekoder:='X';
                        'G':dekoder:='I';
                        'H':dekoder:='Y';
                        'I':dekoder:='O';
                        'J':dekoder:='V';
                        'K':dekoder:='B';
                        'L':dekoder:='E';
                        'M':dekoder:='W';
                        'N':dekoder:='U';
                        '„':dekoder:='®';
                        'O':dekoder:='L';
                        '‡':dekoder:='„';
                        'P':dekoder:='Z';
                        'Q':dekoder:='D';
                        'R':dekoder:='J';
                        'S':dekoder:='P';
                        'ó':dekoder:='è';
                        'T':dekoder:='G';
                        'U':dekoder:='S';
                        'V':dekoder:='F';
                        'W':dekoder:='T';
                        'X':dekoder:='R';
                        'Y':dekoder:='Q';
                        'Z':dekoder:='M';
                        'ç':dekoder:='§';
                        'Ω':dekoder:='ç';
                        '[':dekoder:='[';
                        '\':dekoder:=']';
                        ']':dekoder:='^';
                        '^':dekoder:='_';
                        '_':dekoder:='\';
                        'a':dekoder:='d';
                        '•':dekoder:='¢';
                        'b':dekoder:='w';
                        'c':dekoder:='r';
                        'Ü':dekoder:='à';
                        'd':dekoder:='i';
                        'e':dekoder:='b';
                        '©':dekoder:='Ü';
                        'f':dekoder:='j';
                        'g':dekoder:='e';
                        'h':dekoder:='n';
                        'i':dekoder:='p';
                        'j':dekoder:='g';
                        'k':dekoder:='v';
                        'l':dekoder:='u';
                        'à':dekoder:='´';
                        'm':dekoder:='q';
                        'n':dekoder:='x';
                        '‰':dekoder:='•';
                        'o':dekoder:='m';
                        '¢':dekoder:='©';
                        'p':dekoder:='a';
                        'q':dekoder:='h';
                        'r':dekoder:='k';
                        's':dekoder:='t';
                        'ò':dekoder:='‰';
                        't':dekoder:='y';
                        'u':dekoder:='z';
                        'v':dekoder:='o';
                        'w':dekoder:='f';
                        'x':dekoder:='s';
                        'y':dekoder:='c';
                        'z':dekoder:='l';
                        '´':dekoder:='æ';
                        'æ':dekoder:='ò';
                        '{':dekoder:='}';
                        '|':dekoder:='{';
                        '}':dekoder:='|';
                        'ù':dekoder:='ù';
                        end;
        end;

        function dekoder2(znak:char):char;
        begin

                case znak of
                        ' ':dekoder2:='.';
                        '!':dekoder2:='*';
                        '"':dekoder2:='&';
                        '#':dekoder2:='+';
                        '$':dekoder2:=' ';
                        '%':dekoder2:='"';
                        '&':dekoder2:='#';
                        #39:dekoder2:='(';
                        '(':dekoder2:='!';
                        ')':dekoder2:=#39;
                        '*':dekoder2:='/';
                        '+':dekoder2:=',';
                        ',':dekoder2:='-';
                        '-':dekoder2:='$';
                        '.':dekoder2:='%';
                        '/':dekoder2:=')';
                        '0':dekoder2:='3';
                        '1':dekoder2:='4';
                        '2':dekoder2:='5';
                        '3':dekoder2:='2';
                        '4':dekoder2:='7';
                        '5':dekoder2:='9';
                        '6':dekoder2:='8';
                        '7':dekoder2:='1';
                        '8':dekoder2:='0';
                        '9':dekoder2:='6';
                        ':':dekoder2:='<';
                        ';':dekoder2:='@';
                        '<':dekoder2:=';';
                        '=':dekoder2:=':';
                        '>':dekoder2:='=';
                        '?':dekoder2:='>';
                        '@':dekoder2:='?';
                        'A':dekoder2:='J';
                        '§':dekoder2:='E';
                        'B':dekoder2:='S';
                        'C':dekoder2:='ç';
                        'è':dekoder2:='T';
                        'D':dekoder2:='§';
                        'E':dekoder2:='W';
                        '®':dekoder2:='K';
                        'F':dekoder2:='V';
                        'G':dekoder2:='D';
                        'H':dekoder2:='‡';
                        'I':dekoder2:='Y';
                        'J':dekoder2:='P';
                        'K':dekoder2:='C';
                        'L':dekoder2:='G';
                        'M':dekoder2:='A';
                        'N':dekoder2:='®';
                        '„':dekoder2:='ó';
                        'O':dekoder2:='„';
                        '‡':dekoder2:='I';
                        'P':dekoder2:='H';
                        'Q':dekoder2:='B';
                        'R':dekoder2:='M';
                        'S':dekoder2:='Z';
                        'ó':dekoder2:='F';
                        'T':dekoder2:='X';
                        'U':dekoder2:='Ω';
                        'V':dekoder2:='O';
                        'W':dekoder2:='è';
                        'X':dekoder2:='Q';
                        'Y':dekoder2:='L';
                        'Z':dekoder2:='R';
                        'ç':dekoder2:='N';
                        'Ω':dekoder2:='U';
                        '[':dekoder2:='\';
                        '\':dekoder2:='^';
                        ']':dekoder2:='_';
                        '^':dekoder2:=']';
                        '_':dekoder2:='[';
                        'a':dekoder2:='m';
                        '•':dekoder2:='v';
                        'b':dekoder2:='f';
                        'c':dekoder2:='z';
                        'Ü':dekoder2:='•';
                        'd':dekoder2:='l';
                        'e':dekoder2:='æ';
                        '©':dekoder2:='x';
                        'f':dekoder2:='a';
                        'g':dekoder2:='n';
                        'h':dekoder2:='r';
                        'i':dekoder2:='b';
                        'j':dekoder2:='´';
                        'k':dekoder2:='d';
                        'l':dekoder2:='g';
                        'à':dekoder2:='u';
                        'm':dekoder2:='i';
                        'n':dekoder2:='e';
                        '‰':dekoder2:='y';
                        'o':dekoder2:='Ü';
                        '¢':dekoder2:='k';
                        'p':dekoder2:='‰';
                        'q':dekoder2:='s';
                        'r':dekoder2:='c';
                        's':dekoder2:='à';
                        'ò':dekoder2:='©';
                        't':dekoder2:='¢';
                        'u':dekoder2:='q';
                        'v':dekoder2:='ò';
                        'w':dekoder2:='j';
                        'x':dekoder2:='t';
                        'y':dekoder2:='h';
                        'z':dekoder2:='w';
                        '´':dekoder2:='o';
                        'æ':dekoder2:='p';
                        '{':dekoder2:='|';
                        '|':dekoder2:='}';
                        '}':dekoder2:='{';
                        'ù':dekoder2:='ù';
                        end;
        end;

        function dekoder3(znak:char):char;
        begin

                case znak of
                        ' ':dekoder3:='*';
                        '!':dekoder3:='-';
                        '"':dekoder3:='(';
                        '#':dekoder3:=',';
                        '$':dekoder3:='!';
                        '%':dekoder3:=' ';
                        '&':dekoder3:='%';
                        #39:dekoder3:='+';
                        '(':dekoder3:='"';
                        ')':dekoder3:=')';
                        '*':dekoder3:='.';
                        '+':dekoder3:=#39;
                        ',':dekoder3:='/';
                        '-':dekoder3:='#';
                        '.':dekoder3:='$';
                        '/':dekoder3:='&';
                        '0':dekoder3:='7';
                        '1':dekoder3:='0';
                        '2':dekoder3:='9';
                        '3':dekoder3:='5';
                        '4':dekoder3:='8';
                        '5':dekoder3:='6';
                        '6':dekoder3:='2';
                        '7':dekoder3:='1';
                        '8':dekoder3:='3';
                        '9':dekoder3:='4';
                        ':':dekoder3:='>';
                        ';':dekoder3:='?';
                        '<':dekoder3:='=';
                        '=':dekoder3:=';';
                        '>':dekoder3:='@';
                        '?':dekoder3:=':';
                        '@':dekoder3:='<';
                        'A':dekoder3:='Y';
                        '§':dekoder3:='U';
                        'B':dekoder3:='‡';
                        'C':dekoder3:='F';
                        'è':dekoder3:='Q';
                        'D':dekoder3:='®';
                        'E':dekoder3:='T';
                        '®':dekoder3:='„';
                        'F':dekoder3:='S';
                        'G':dekoder3:='H';
                        'H':dekoder3:='B';
                        'I':dekoder3:='Ω';
                        'J':dekoder3:='K';
                        'K':dekoder3:='C';
                        'L':dekoder3:='P';
                        'M':dekoder3:='J';
                        'N':dekoder3:='R';
                        '„':dekoder3:='è';
                        'O':dekoder3:='ó';
                        '‡':dekoder3:='N';
                        'P':dekoder3:='W';
                        'Q':dekoder3:='O';
                        'R':dekoder3:='L';
                        'S':dekoder3:='V';
                        'ó':dekoder3:='X';
                        'T':dekoder3:='E';
                        'U':dekoder3:='M';
                        'V':dekoder3:='Z';
                        'W':dekoder3:='A';
                        'X':dekoder3:='ç';
                        'Y':dekoder3:='§';
                        'Z':dekoder3:='G';
                        'ç':dekoder3:='D';
                        'Ω':dekoder3:='I';
                        '[':dekoder3:='^';
                        '\':dekoder3:='_';
                        ']':dekoder3:='\';
                        '^':dekoder3:='[';
                        '_':dekoder3:=']';
                        'a':dekoder3:='´';
                        '•':dekoder3:='o';
                        'b':dekoder3:='k';
                        'c':dekoder3:='t';
                        'Ü':dekoder3:='e';
                        'd':dekoder3:='Ü';
                        'e':dekoder3:='r';
                        '©':dekoder3:='ù';
                        'f':dekoder3:='h';
                        'g':dekoder3:='w';
                        'h':dekoder3:='y';
                        'i':dekoder3:='d';
                        'j':dekoder3:='q';
                        'k':dekoder3:='c';
                        'l':dekoder3:='•';
                        'à':dekoder3:='i';
                        'm':dekoder3:='¢';
                        'n':dekoder3:='p';
                        '‰':dekoder3:='l';
                        'o':dekoder3:='à';
                        '¢':dekoder3:='f';
                        'p':dekoder3:='´';
                        'q':dekoder3:='x';
                        'r':dekoder3:='a';
                        's':dekoder3:='ò';
                        'ò':dekoder3:='b';
                        't':dekoder3:='z';
                        'u':dekoder3:='s';
                        'v':dekoder3:='n';
                        'w':dekoder3:='g';
                        'x':dekoder3:='u';
                        'y':dekoder3:='©';
                        'z':dekoder3:='j';
                        '´':dekoder3:='v';
                        'æ':dekoder3:='m';
                        '{':dekoder3:='}';
                        '|':dekoder3:='|';
                        '}':dekoder3:='{';
                        'ù':dekoder3:='‰';
                        end;


        end;

        function kalk_rozszerzony:boolean;
        type
                dane=record
                liczba1,liczba2,wynik:extended;
                znak:string;
        end;
        var
                slowo,slowol1,slowol2,slowow:string;
                t1:text;
                tdanych:array[1..10] of dane;
                znak,odp:char;
                wpisanie:boolean;
                ruchomey,staley,stalex,ruchomex,kolumna,wiersz,licznik,dokl,usunzero,niepuste,blad:shortint;
        label
                poczpetli,
                poczpetli2,
                koniec;
        begin
                clrscr;
                staley:=18;
                ruchomey:=18;
                stalex:=3;
                ruchomex:=3;
                kolumna:=1;
                wiersz:=1;
                dokl:=0;
                wpisanie:=true;

                writeln('…ÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕª');
                writeln('∫  ____  __        __   __          __          __                 ∫');
                writeln('∫ |    |/ _|____  |  | |  | ____ __|  | _____ _/  |_  ___________  ∫');
                writeln('∫ |      < \__  \ |  | |  |/ /  |  \  | \__  \\   __\/  _ \_  __ \ ∫');
                writeln('∫ |    |  \ / __ \|  |_|    <|  |  /  |__/ __ \|  | (  <_> )  | \/ ∫');
                writeln('∫ |____|__ (____  /____/__|_ \____/|____(____  /__|  \____/|__|    ∫');
                writeln('∫         \/    \/          \/               \/                    ∫');
                writeln('»ÕÕÕÕÕÕÕÕÕÕÕÕÕª   Mikoàaj Stankowiak, 09.08.2012r   …ÕÕÕÕÕÕÕÕÕÕÕÕÕÕº');
                writeln('              ∫                                     ∫               ');
                writeln('   v. 2.03    »ÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕº               ');
                writeln;
                writeln;
                writeln('                        Tryb rozszerzony:                           ');
                writeln('⁄ƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒø      Znaki do wykorzystania:');
                writeln('∫     Liczba 1      ∫ Znak ∫     Liczba 2      ∫       Wynik       ∫      ');
                writeln('∫                   ∫      ∫                   ∫                   ∫');
                writeln('ÃÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕ ÕÕÕÕÕÕ ÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕ ÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕπ        +   - dodawanie');
                writeln('∫                   ≥      ≥                   ∫                   ∫');
                writeln('∫ƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒ≈ƒƒƒƒƒƒ≈ƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒŒÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕπ        -   - odejmowanie');
                writeln('∫                   ≥      ≥                   ∫                   ∫');
                writeln('∫ƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒ≈ƒƒƒƒƒƒ≈ƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒŒÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕπ        *   - mnoæenie');
                writeln('∫                   ≥      ≥                   ∫                   ∫');
                writeln('∫ƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒ≈ƒƒƒƒƒƒ≈ƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒŒÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕπ        /   - dzielenie');
                writeln('∫                   ≥      ≥                   ∫                   ∫');
                writeln('∫ƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒ≈ƒƒƒƒƒƒ≈ƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒŒÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕπ        div - dzielenie caàkowite');
                writeln('∫                   ≥      ≥                   ∫                   ∫');
                writeln('∫ƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒ≈ƒƒƒƒƒƒ≈ƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒŒÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕπ        mod - reszta z dzielenia');
                writeln('∫                   ≥      ≥                   ∫                   ∫');
                writeln('∫ƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒ≈ƒƒƒƒƒƒ≈ƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒŒÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕπ        ^   - pot©ga');
                writeln('∫                   ≥      ≥                   ∫                   ∫');
                writeln('∫ƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒ≈ƒƒƒƒƒƒ≈ƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒŒÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕπ      Notka:');
                writeln('∫                   ≥      ≥                   ∫                   ∫');
                writeln('∫ƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒ≈ƒƒƒƒƒƒ≈ƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒŒÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕπ        Cz©òci uàamkowe zapisuj');
                writeln('∫                   ≥      ≥                   ∫                   ∫        po kropce.');
                writeln('∫ƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒ≈ƒƒƒƒƒƒ≈ƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒŒÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕπ');
                writeln('∫                   ≥      ≥                   ∫                   ∫        Mod i div tylko na liczbach');
                writeln('»ÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕ ÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕº        caàkowytich.');

                gotoxy(25,13);
                cznieb;
                write('Tryb rozszerzony:');
                gotoxy(77,17);
                write('+');
                gotoxy(77,19);
                write('-');
                gotoxy(77,21);
                write('*');
                gotoxy(77,23);
                write('/');
                gotoxy(77,25);
                write('div');
                gotoxy(77,27);
                write('mod');
                gotoxy(77,29);
                write('^');

                gotoxy(4,10);
                write('v. 2.03');
                gotoxy(17,8);
                write(#01);
                gotoxy(51,8);
                write(#01);

                niebcz;
                gotoxy(7,15);
                write('Liczba 1');
                gotoxy(23,15);
                write('Znak');
                gotoxy(34,15);
                write('Liczba 2');
                gotoxy(56,15);
                write('Wynik');
                typowyk;
                instrukcja(1,40,'kom¢rk©','kom¢rki');

                for licznik :=1 to 10 do
                begin
                        tdanych[licznik].liczba1:=0;
                        tdanych[licznik].liczba2:=0;
                        tdanych[licznik].wynik:=0;
                        tdanych[licznik].znak:='aaa';
                end;
                gotoxy(stalex,staley);
                repeat
                        poczpetli:
                        str(frac(tdanych[wiersz].liczba1):1:8,slowol1);
                        str(frac(tdanych[wiersz].liczba2):1:8,slowol2);
                        str(frac(tdanych[wiersz].wynik):1:8,slowow);
                            //zwi©kszanie dokàadnoòci liczby

                        if (tdanych[wiersz].liczba1 <> zaokraglij(tdanych[wiersz].liczba1,dokl)) then
                                begin
                                        if  (dokl < 4) and ((slowol1[3+dokl] <> '0') or (slowol1[4+dokl] <> '0') or
                                        (slowol1[5+dokl] <> '0') or (slowol1[6+dokl] <> '0')) then
                                        begin
                                                dokl:=dokl+1;
                                                goto poczpetli;

                                        end;
                                end;
                        if (tdanych[wiersz].liczba2 <> zaokraglij(tdanych[wiersz].liczba2,dokl)) then
                                begin
                                        if  (dokl < 4)  and ((slowol2[3+dokl] <> '0') or (slowol2[4+dokl] <> '0') or
                                        (slowol2[5+dokl] <> '0') or (slowol2[6+dokl] <> '0')) then
                                        begin
                                                dokl:=dokl+1;
                                                goto poczpetli;
                                        end;
                                end;
                                        //zwi©kszanie dokàadnoòÜi wyniku
                        if (tdanych[wiersz].wynik <> zaokraglij(tdanych[wiersz].wynik,dokl)) then
                                begin
                                        if  (dokl < 4) and ((slowow[3+dokl] <> '0') or (slowow[4+dokl] <> '0') or
                                        (slowow[5+dokl] <> '0') or (slowow[6+dokl] <> '0')) then
                                        begin
                                                dokl:=dokl+1;
                                                goto poczpetli;
                                        end;
                                end;

                        poczpetli2:
                        niepuste:=0;
                        usunzero:=0;
                        for licznik:=0 to 9 do                  //zmniejszanie dokàadnoòci wyniku
                        begin
                                if (tdanych[licznik+1].liczba1 <> 0) and (dokl > 0) then
                                begin
                                        niepuste:=niepuste+1;
                                        if tdanych[licznik+1].liczba1 = zaokraglij(tdanych[licznik+1].liczba1,dokl-1) then usunzero:=usunzero+1;
                                end;
                                if (tdanych[licznik+1].liczba2 <> 0) and (dokl > 0) then
                                begin
                                        niepuste:=niepuste+1;
                                        if tdanych[licznik+1].liczba2 = zaokraglij(tdanych[licznik+1].liczba2,dokl-1) then usunzero:=usunzero+1;
                                end;
                                if (tdanych[licznik+1].wynik <> 0) and (dokl > 0) then
                                begin
                                        niepuste:=niepuste+1;
                                        if tdanych[licznik+1].wynik = zaokraglij(tdanych[licznik+1].wynik,dokl-1) then usunzero:=usunzero+1;
                                end;
                        end;

                        if (usunzero = niepuste) and (niepuste > 0) then  //kontynuacja zmniejszania
                                begin
                                        dokl:=dokl-1;
                                        goto poczpetli2;
                                end;

                        if length(naslowo(tdanych[wiersz].wynik,dokl)) > 18 then  //jeæeli za duæa liczba to wyczyòÜ
                                begin
                                        tdanych[wiersz].liczba2:=0;
                                        tdanych[wiersz].wynik:=0;
                                        typowyk;
                                        gotoxy(48,40);
                                        write('   ',godzina,' - Brak');
                                        gotoxy(48,41);
                                        write(' miejsca na wynik... ');
                                        tdanych[wiersz].wynik:=0;
                                end;

                        for licznik:=0 to 9 do
                        begin
                                gotoxy(stalex,staley+(licznik*2));    //wypisywanie wartoòÜi
                                write('                  ');
                                gotoxy(stalex,staley+(licznik*2));
                                write(tdanych[licznik+1].liczba1:1:dokl);
                                gotoxy(stalex+27,staley+(licznik*2));
                                write('                  ');
                                gotoxy(stalex+27,staley+(licznik*2));
                                write(tdanych[licznik+1].liczba2:1:dokl);
                                typowyk;
                                gotoxy(stalex+47,staley+(licznik*2));    //wypisywanie wyniku
                                write('                  ');
                                if (tdanych[licznik+1].wynik <> zaokraglij(tdanych[licznik+1].wynik,dokl)) and
                                ((slowow[7] <> '0') or (slowow[8] <> '0') or (slowow[9] <> '0') or (slowow[10] <> '0'))  then
                                begin

                                        gotoxy(stalex+46,staley+(licznik*2));           //znak zaokr•glenia
                                        write('~');
                                        typowyk;
                                end
                                else
                                begin
                                        gotoxy(stalex+46,staley+(licznik*2));
                                        typowyk;
                                        write(' ');
                                        cznieb;
                                end;
                                cznieb;
                                gotoxy(stalex+47,staley+(licznik*2));
                                write(tdanych[licznik+1].wynik:1:dokl);
                                typowyk;
                        end;
                        if wpisanie = false then
                        begin
                        if tdanych[wiersz].znak = '+' then                          //wypisywanie log¢w
                        begin
                                if (tdanych[wiersz].liczba1 <> 0) and (tdanych[wiersz].liczba2 <> 0) then
                                        begin
                                                assign(t1,'logi\logi_kalk.txt');
                                                append(t1);
                                                writeln(t1,godzina,' - Obliczenie dzialania:');
                                                write(t1,'           ',tdanych[wiersz].liczba1:1:dokl,' + ');
                                                writeln(t1,tdanych[wiersz].liczba2:1:dokl,' = ',tdanych[wiersz].wynik:1:dokl);
                                                writeln(t1);
                                                close(t1);
                                        end;
                        end;

                        if tdanych[wiersz].znak = '-' then                          //wypisywanie log¢w
                        begin
                                if (tdanych[wiersz].liczba1 <> 0) and (tdanych[wiersz].liczba2 <> 0) then
                                        begin
                                                assign(t1,'logi\logi_kalk.txt');
                                                append(t1);
                                                writeln(t1,godzina,' - Obliczenie dzialania:');
                                                write(t1,'           ',tdanych[wiersz].liczba1:1:dokl,' - ');
                                                writeln(t1,tdanych[wiersz].liczba2:1:dokl,' = ',tdanych[wiersz].wynik:1:dokl);
                                                writeln(t1);
                                                close(t1);
                                        end;
                        end;

                        if tdanych[wiersz].znak = '*' then                          //wypisywanie log¢w
                        begin
                                if (tdanych[wiersz].liczba1 <> 0) and (tdanych[wiersz].liczba2 <> 0) then
                                        begin
                                                assign(t1,'logi\logi_kalk.txt');
                                                append(t1);
                                                writeln(t1,godzina,' - Obliczenie dzialania:');
                                                write(t1,'           ',tdanych[wiersz].liczba1:1:dokl,' * ');
                                                writeln(t1,tdanych[wiersz].liczba2:1:dokl,' = ',tdanych[wiersz].wynik:1:dokl);
                                                writeln(t1);
                                                close(t1);
                                        end;
                        end;

                        if tdanych[wiersz].znak = '/' then                          //wypisywanie log¢w
                        begin
                                if (tdanych[wiersz].liczba1 <> 0) and (tdanych[wiersz].liczba2 <> 0) then
                                        begin
                                                assign(t1,'logi\logi_kalk.txt');
                                                append(t1);
                                                writeln(t1,godzina,' - Obliczenie dzialania:');
                                                write(t1,'           ',tdanych[wiersz].liczba1:1:dokl,' / ');
                                                writeln(t1,tdanych[wiersz].liczba2:1:dokl,' = ',tdanych[wiersz].wynik:1:dokl);
                                                writeln(t1);
                                                close(t1);
                                        end;
                        end;
                        if tdanych[wiersz].znak = 'mod' then                          //wypisywanie log¢w
                        begin
                                if (tdanych[wiersz].liczba1 <> 0) and (tdanych[wiersz].liczba2 <> 0) then
                                        begin
                                                assign(t1,'logi\logi_kalk.txt');
                                                append(t1);
                                                writeln(t1,godzina,' - Obliczenie dzialania:');
                                                write(t1,'           ',tdanych[wiersz].liczba1:1:dokl,' mod ');
                                                writeln(t1,tdanych[wiersz].liczba2:1:dokl,' = ',tdanych[wiersz].wynik:1:dokl);
                                                writeln(t1);
                                                close(t1);
                                        end;
                        end;

                        if tdanych[wiersz].znak = 'div' then                          //wypisywanie log¢w
                        begin
                                if (tdanych[wiersz].liczba1 <> 0) and (tdanych[wiersz].liczba2 <> 0) then
                                        begin
                                                assign(t1,'logi\logi_kalk.txt');
                                                append(t1);
                                                writeln(t1,godzina,' - Obliczenie dzialania:');
                                                write(t1,'           ',tdanych[wiersz].liczba1:1:dokl,' div ');
                                                writeln(t1,tdanych[wiersz].liczba2:1:dokl,' = ',tdanych[wiersz].wynik:1:dokl);
                                                writeln(t1);
                                                close(t1);
                                        end;
                        end;
                        if tdanych[wiersz].znak = '^' then                          //wypisywanie log¢w
                        begin
                                if (tdanych[wiersz].liczba1 <> 0) and (tdanych[wiersz].liczba2 <> 0) then
                                        begin
                                                assign(t1,'logi\logi_kalk.txt');
                                                append(t1);
                                                writeln(t1,godzina,' - Obliczenie dzialania:');
                                                write(t1,'           ',tdanych[wiersz].liczba1:1:dokl,' ^ ');
                                                writeln(t1,tdanych[wiersz].liczba2:1:dokl,' = ',tdanych[wiersz].wynik:1:dokl);
                                                writeln(t1);
                                                close(t1);
                                        end;
                        end;
                        end;
                        wpisanie:=true;
                        gotoxy(ruchomex,ruchomey);

                                //podswietlenie
                                if kolumna = 1 then podswietlenie_slowa(ruchomex,ruchomey,naslowo(tdanych[wiersz].liczba1,dokl));
                                if kolumna = 2 then
                                begin
                                        czbk;
                                        gotoxy(ruchomex,ruchomey);
                                        if (tdanych[wiersz].znak <> '') and (tdanych[wiersz].znak <> 'aaa') then write(tdanych[wiersz].znak)
                                        else write(' ');
                                        gotoxy(ruchomex,ruchomey);
                                        typowyk;
                                end;
                        if kolumna = 3 then podswietlenie_slowa(ruchomex,ruchomey,naslowo(tdanych[wiersz].liczba2,dokl));

                        znak:=readkey;
                        gotoxy(48,40);
                        typowyk;                          //czyszczeniew pola komunikatu
                        write('                     ');
                        gotoxy(48,41);
                        write('                     ');
                        if znak = #13 then
                                begin            //zaznaczenie kom¢rki
                                        if (kolumna = 1) or (kolumna = 3) then zaznaczenie_slowa(ruchomex,ruchomey,2)
                                        else
                                        begin
                                                gotoxy(ruchomex,ruchomey);
                                                write('   ');
                                                gotoxy(ruchomex-1,ruchomey);
                                                niebbial;
                                                write(' ');
                                                czbk;
                                                write(' ');
                                                typowyk;
                                                gotoxy(ruchomex,ruchomey);
                                        end;
                                        slowo:='aaa';
                                        readln(slowo);
                                                      //czy liczba zbyt dàuga
                                        if length(slowo) > 13 then
                                                begin
                                                        slowo:='';
                                                        typowyk;
                                                        gotoxy(48,40);
                                                        write(godzina,' - Zbyt duæa');
                                                        gotoxy(48,41);
                                                        write('       liczba... ');
                                                end;
                                        if kolumna = 1 then //wprowadzenie zmiennej do tablic
                                                begin
                                                        val(slowo,tdanych[wiersz].liczba1);
                                                        wpisanie:=false;
                                                        if zaokraglij(tdanych[wiersz].liczba1,4) <> tdanych[wiersz].liczba1 then
                                                        begin
                                                                tdanych[wiersz].liczba1:=zaokraglij(tdanych[wiersz].liczba1,4);
                                                                typowyk;
                                                                gotoxy(48,40);
                                                                write(godzina,' - Zbyt duæa');
                                                                gotoxy(48,41);
                                                                write('dokàadnoòÜ liczby... ');
                                                                tdanych[wiersz].wynik:=0;
                                                        end;
                                                end;
                                        if kolumna = 2 then        //zabezpieczenie przez nieznanym znakiem
                                                begin
                                                        tdanych[wiersz].znak:=slowo[1];
                                                        if (slowo[1] = '+') or (slowo[1] = '-') or (slowo[1] = '*') or  (slowo[1] = '^')
                                                        or (slowo[1] = 'd') or (slowo[1] = 'm') or (slowo[1] = '/') then tdanych[wiersz].znak:=slowo[1]
                                                        else tdanych[wiersz].znak:='';
                                                        if (slowo[2] <> 'a') then
                                                        begin
                                                                if (((slowo[1] = 'd') and (slowo[2] = 'i')) or ((slowo[1] = 'm') and (slowo[2] = 'o'))) then
                                                                tdanych[wiersz].znak:=tdanych[wiersz].znak+slowo[2]
                                                                else
                                                                begin
                                                                        tdanych[wiersz].znak:='';
                                                                        typowyk;
                                                                        gotoxy(48,40);
                                                                        write(godzina,' - Zày znak !');
                                                                        tdanych[wiersz].wynik:=0;
                                                                end;
                                                        end;
                                                if (slowo[3] <> 'a') then
                                                        begin

                                                                if (((slowo[1] = 'd') and (slowo[2] = 'i') and (slowo[3] = 'v')) or ((slowo[1] = 'm')
                                                                and (slowo[2] = 'o') and (slowo[3] = 'd'))) then
                                                                begin
                                                                        wpisanie:=false;
                                                                        tdanych[wiersz].znak:=tdanych[wiersz].znak+slowo[3];
                                                                end
                                                                else
                                                                begin
                                                                        tdanych[wiersz].znak:='';
                                                                        typowyk;
                                                                        gotoxy(48,40);
                                                                        write(godzina,' - Zày znak !');
                                                                        tdanych[wiersz].wynik:=0;
                                                                end;
                                                        end;
                                                end;
                                        if kolumna = 3 then
                                                begin
                                                        val(slowo,tdanych[wiersz].liczba2);
                                                        wpisanie:=false;
                                                        if zaokraglij(tdanych[wiersz].liczba2,4) <> tdanych[wiersz].liczba2 then
                                                        begin
                                                                tdanych[wiersz].liczba2:=zaokraglij(tdanych[wiersz].liczba2,4);
                                                                typowyk;
                                                                gotoxy(48,40);
                                                                write(godzina,' - Zbyt duæa');
                                                                gotoxy(48,41);
                                                                write('dokàadnoòÜ liczby... ');
                                                                tdanych[wiersz].wynik:=0;
                                                        end;
                                                end;
                                             //obliczanie wyniku,logi
                                        if tdanych[wiersz].znak = '+' then
                                                begin
                                                        tdanych[wiersz].wynik:=tdanych[wiersz].liczba1 + tdanych[wiersz].liczba2;
                                                end;
                                        if tdanych[wiersz].znak = '-' then tdanych[wiersz].wynik:=tdanych[wiersz].liczba1 - tdanych[wiersz].liczba2;
                                        if tdanych[wiersz].znak = '*' then tdanych[wiersz].wynik:=tdanych[wiersz].liczba1 * tdanych[wiersz].liczba2;
                                        if tdanych[wiersz].znak = '^' then
                                                begin
                                                        if tdanych[wiersz].liczba2 <> round(tdanych[wiersz].liczba2) then
                                                                begin
                                                                        tdanych[wiersz].liczba2:=round(tdanych[wiersz].liczba2);
                                                                        gotoxy(48,40);
                                                                        typowyk;
                                                                        write(godzina,' - Zbyt duæa');
                                                                        gotoxy(48,41);
                                                                        write('dokàadnoòÜ liczby... ');
                                                                end;
                                                        if tdanych[wiersz].liczba2 >= 0 then
                                                                begin

                                                                        tdanych[wiersz].wynik:=1;
                                                                        for licznik:=1 to round(tdanych[wiersz].liczba2) do
                                                                        tdanych[wiersz].wynik:=(tdanych[wiersz].liczba1) * tdanych[wiersz].wynik;
                                                                end
                                                                else
                                                                begin
                                                                        tdanych[wiersz].wynik:=1;
                                                                        for licznik:=round(tdanych[wiersz].liczba2) to -1 do
                                                                        tdanych[wiersz].wynik:=tdanych[wiersz].liczba1 * tdanych[wiersz].wynik;
                                                                        tdanych[wiersz].wynik:=1/tdanych[wiersz].wynik;
                                                                end;
                                                end;
                                                                           //jeæeli dzelnik r¢wny zero
                                        if ((tdanych[wiersz].znak = '/') or (tdanych[wiersz].znak = 'div') or (tdanych[wiersz].znak = 'mod'))
                                        and (tdanych[wiersz].liczba2 = 0) then
                                                begin
                                                        typowyk;
                                                        gotoxy(48,40);
                                                        write(godzina,' - Nie dziel');
                                                        gotoxy(48,41);
                                                        write('     przez zero !');
                                                        tdanych[wiersz].wynik:=0;
                                                end;
                                        if tdanych[wiersz].liczba2 <> 0 then    //dalsze wypisywanie wynik¢w
                                                begin
                                                        if tdanych[wiersz].znak = '/' then tdanych[wiersz].wynik:=tdanych[wiersz].liczba1 / tdanych[wiersz].liczba2;

                                                                                  //zaokr•glenie liczb do stosownych dziaàa‰
                                                        if (tdanych[wiersz].liczba1 <> round(tdanych[wiersz].liczba1)) and ((tdanych[wiersz].znak = 'mod')
                                                        or (tdanych[wiersz].znak = 'div')) then
                                                                begin
                                                                        tdanych[wiersz].liczba1:=round(tdanych[wiersz].liczba1);
                                                                        typowyk;
                                                                        gotoxy(48,40);
                                                                        write(godzina,' - Zbyt duæa');
                                                                        gotoxy(48,41);
                                                                        write('dokàadnoòÜ liczby... ');
                                                                end;
                                                        if (tdanych[wiersz].liczba2 <> round(tdanych[wiersz].liczba2)) and ((tdanych[wiersz].znak = 'mod')
                                                        or (tdanych[wiersz].znak = 'div')) then
                                                                begin
                                                                        tdanych[wiersz].liczba2:=round(tdanych[wiersz].liczba2);
                                                                        typowyk;
                                                                        gotoxy(48,40);
                                                                        write(godzina,' - Zbyt duæa');
                                                                        gotoxy(48,41);
                                                                        write('dokàadnoòÜ liczby... ');
                                                                end;


                                                        if tdanych[wiersz].znak = 'mod' then
                                                        tdanych[wiersz].wynik:=round(tdanych[wiersz].liczba1) mod round(tdanych[wiersz].liczba2);

                                                        if tdanych[wiersz].znak = 'div' then
                                                        tdanych[wiersz].wynik:=round(tdanych[wiersz].liczba1) div round(tdanych[wiersz].liczba2);
                                                end;
                                end;                          //odswietlenie
                        if kolumna = 1 then odswietlenie_slowa(ruchomex,ruchomey,naslowo(tdanych[wiersz].liczba1,dokl));
                        if kolumna = 2 then
                                begin
                                        typowyk;
                                        gotoxy(ruchomex-1,ruchomey);
                                        write(' ');
                                        if (length(tdanych[wiersz].znak) > 0) and (tdanych[wiersz].znak <> 'aaa') then
                                                begin
                                                        cznieb;
                                                        write(tdanych[wiersz].znak);
                                                        write('  ');
                                                end
                                                else write('   ');
                                        gotoxy(ruchomex,ruchomey);
                                        typowyk;
                                end;
                        if kolumna = 3 then odswietlenie_slowa(ruchomex,ruchomey,naslowo(tdanych[wiersz].liczba2,dokl));

                        if znak= chr(0) then znak:=readkey; //poruszanie si©
                         case znak of
                                'H':  //strzalka w g¢r©
                                        begin
                                                if ruchomey = staley then
                                                        begin
                                                                ruchomey:=36;
                                                                wiersz:=10;
                                                        end
                                                        else
                                                        begin
                                                                ruchomey:=ruchomey-2;
                                                                wiersz:=wiersz-1;
                                                        end;
                                        end;
                                'P': //strzaàka w d¢à
                                        begin
                                                if ruchomey = staley+18 then
                                                        begin
                                                                ruchomey:=18;
                                                                wiersz:=1
                                                        end
                                                        else
                                                        begin
                                                                ruchomey:=ruchomey+2;
                                                                wiersz:=wiersz+1;
                                                        end;
                                        end;
                                'M':      //strzalka w prawo
                                        begin
                                                if (kolumna = 1) then
                                                        begin
                                                                ruchomex:=ruchomex+20;
                                                                kolumna:=kolumna+1;
                                                                goto poczpetli;
                                                        end;
                                                if kolumna = 2 then
                                                        begin
                                                                ruchomex:=ruchomex+7;
                                                                kolumna:=kolumna+1;
                                                                goto poczpetli;
                                                        end;
                                                if kolumna = 3 then
                                                        begin
                                                                ruchomex:=stalex;
                                                                kolumna:=1;
                                                                goto poczpetli;
                                                        end;
                                        end;
                                'K':      //strzalka w lewo
                                        begin
                                                if (kolumna = 1) then
                                                        begin
                                                                ruchomex:=ruchomex+27;
                                                                kolumna:=3;
                                                                goto poczpetli;
                                                        end;
                                                if (kolumna = 2) then
                                                        begin
                                                                ruchomex:=ruchomex-20;
                                                                kolumna:=kolumna-1;
                                                        goto poczpetli;
                                                                end;
                                                if kolumna = 3 then
                                                        begin
                                                                ruchomex:=ruchomex-7;
                                                                kolumna:=kolumna-1;
                                                                goto poczpetli;
                                                        end;
                                        end;
                                end;
                until znak = #27;

                gotoxy(48,40);                        //czyszczenie pola komunikatu
                write('                      ');
                gotoxy(48,41);
                write('                      ');

                odp:=pkoncowen_tlo(1,39,1);
                if (odp = 'J') or (odp = 'j') then
                        begin
                                kalk_rozszerzony:=true;
                                goto koniec;
                        end;

                if (odp = 'M') or (odp = 'm') then
                        begin
                                kalk_rozszerzony:=false;
                                goto koniec;
                        end;


                for licznik:=1 to 8 do
                        begin
                                gotoxy(1,41+licznik);
                                writeln('                                                            ');
                        end;
                instrukcja(1,40,'kom¢rk©','kom¢rki');
                assign(t1,'logi\logi_kalk.txt');
                append(t1);
                writeln(t1,godzina,' - Powrot do edycji tabeli');
                close(t1);
                goto poczpetli;
                koniec:

        end;
begin
end.
