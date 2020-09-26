/*****************************************************************************************	
Analizar la Sensibilidad y específicidad de las definiciones de casos sospechoso
******************************************************************************************/

use "movid_sintomas_2020-06-24_3.dta", clear //2,031 obs

*Colapsar la base a una observación individual
collapse (max) ex_confirmado sospechoso_old sospechoso_new cs_sw cs_actuald cs_OMS, by (id)

*criterio  --minsal1-- ROC -- C2
roctab ex_confirmado sospechoso_old, table
roctab ex_confirmado sospechoso_old, graph scheme(s1color) xsize(10) ysize(10)
diagt ex_confirmado sospechoso_old

*criterio --ca1 no decretado-- ROC --C3
roctab ex_confirmado sospechoso_new, table
roctab ex_confirmado sospechoso_new, graph scheme(s1color) xsize(10) ysize(10)
diagt ex_confirmado sospechoso_new

*criterio actual --minsal junto con ca2-- ROC --C4
roctab ex_confirmado cs_actuald, table
roctab ex_confirmado cs_actuald, graph scheme(s1color) xsize(10) ysize(10)
diagt ex_confirmado cs_actuald

*criterio OMS -- ROC -- C1
roctab ex_confirmado cs_OMS, table
roctab ex_confirmado cs_OMS, graph scheme(s1color) xsize(10) ysize(10)
diagt ex_confirmado cs_OMS

*criterio propuesto-- ROC -- C%
roctab ex_confirmado cs_sw, table
roctab ex_confirmado cs_sw, graph scheme(s1color) xsize(10) ysize(10)
diagt ex_confirmado cs_sw, prev
diagt ex_confirmado cs_sw, prev(30%)



*Comparación de curvas ROC
*1. Diferencias entre curvas por defecto, ver si las tres iguales y gráfico
roccomp ex_confirmado sospechoso_old sospechoso_new cs_actuald cs_sw cs_OMS, graph summary scheme(s1color) xsize(10) ysize(10) //pendiente poner edición acá

*2. Diferencias entre curvas contraste de test C con matriz especificada, para ver si Cs_sw se diferencia de alguno de los anteriores
matrix C=(-1,0,0,0,1 \ 0,-1,0,0,1\  0,0,-1,0,1\ 0,0,0,-1,1)
mat list C
roccomp ex_confirmado sospechoso_old sospechoso_new cs_actuald cs_OMS cs_sw, test(C)

*Gráfico editado
roccomp ex_confirmado sospechoso_old sospechoso_new cs_actuald cs_OMS cs_sw, graph summary ///
  ytitle("Sensibilidad")  xtitle("1-Especificidad") scheme(s1color) xsize(10) ysize(10) legend(ring(0) position(4) rows(5) /// 
label(1 "C1: ROC 0.6647") label(2 "C2: ROC 0.6823") label(3 "C3: ROC 0.6673") ///
 label(4 "C4: ROC 0.6964") label (5 "Referencia"))



