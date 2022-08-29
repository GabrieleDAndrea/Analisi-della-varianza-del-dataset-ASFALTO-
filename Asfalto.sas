data opis;
input interesse giudizio frequenza;
cards;
1 1 32
1 2 20
1 3 46
1 4 14
2 1 11
2 2 47
2 3 125
2 4 31
3 1 9
3 2 97
3 3 695
3 4 288
4 1 12
4 2 38
4 3 403
4 4 1369
;
run;

proc freq data=opis order=data;
weight frequenza;
tables interesse*giudizio/ chisq expected nocol;
/*tables S*A/chisq;*/
run;

ods graphics on;
proc logistic data=opis plots(only)=oddsratio(range=clip) descending;
class interesse (ref=first) giudizio(ref='1')/param=ref;
freq frequenza;
model giudizio (order=data)= interesse /link=glogit;
/*output out=predict_gel predprobs=(i) resdev=dev reschi=chi;*/
oddsratio interesse;
effectplot/polybar;
run;
ods graphics off;


proc logistic data=opis plots(only)=oddsratio(range=clip) descending;
class interesse (ref=first) giudizio(ref='1')/param=ref;
freq frequenza;
model giudizio (order=data)= interesse/link=clogit;
oddsratio interesse;
effectplot/polybar;
run;
ods graphics off;











