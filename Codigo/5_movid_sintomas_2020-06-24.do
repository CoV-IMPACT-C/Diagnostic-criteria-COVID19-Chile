*Crear VP para definición caso sospechoso OMS  (C1)
 use "movid_sintomas_2020-06-24_3.dta", clear 
 
 
 forvalues i= 0/99 {
 diagt ex_confirmado cs_OMS, prev(`i'%)
 gen VPP_OMS`i'= r(ppv)
 gen VPP_lb_OMS`i'= r(ppv_lb)
 gen VPP_ub_OMS`i'= r(ppv_ub) 
 gen VPN_OMS`i'= r(npv) 
 gen VPN_lb_OMS`i'= r(npv_lb)
 gen VPN_ub_OMS`i'= r(npv_ub) 
 }
 
 collapse (max) VPP_OMS0-VPN_ub_OMS99
 gen Prev= 1
 reshape long VPP_OMS VPP_lb_OMS VPP_ub_OMS VPN_OMS VPN_lb_OMS VPN_ub_OMS, i(Prev) j(p)
 rename p Positividad
 
 twoway  (rarea VPP_lb VPP_ub Positividad , color(gs14%30))(line VPP Positividad) ///
 (rarea VPN_lb VPN_ub Positividad , color(gs14%30)) (line VPN Positividad, xline(16, lcolor(black) ///
 lpattern(_)) xline(30, lcolor(black) lpattern(.)) scheme(s1color) legend(order(2 "Valor predictivo positivo" ///
 4 "Valor predictivo negativo" 1 "IC95%") rows(3) size(vsmall) ring(0) position(4)))  
 save "movid_sintomas_2020-06-24_p_sospechoso_new.dta", replace 

  graph save cs_OMS
  
 save "movid_sintomas_2020-06-24_p_OMS.dta", replace 

*Crear VP para definición caso sospechoso antiguo  (C2)
 use "movid_sintomas_2020-06-24_3.dta", clear 
  
 forvalues i= 0/99 {
 diagt ex_confirmado sospechoso_old, prev(`i'%)
 gen VPP_old`i'= r(ppv)
 gen VPP_lb_old`i'= r(ppv_lb)
 gen VPP_ub_old`i'= r(ppv_ub) 
 gen VPN_old`i'= r(npv) 
 gen VPN_lb_old`i'= r(npv_lb)
 gen VPN_ub_old`i'= r(npv_ub) 
 }
 
 collapse (max) VPP_old0-VPN_ub_old99
 gen Prev= 1
 reshape long VPP_old VPP_lb_old VPP_ub_old VPN_old VPN_lb_old VPN_ub_old, i(Prev) j(p)
 rename p Positividad
 
 twoway  (rarea VPP_lb VPP_ub Positividad , color(gs14%30))(line VPP Positividad) ///
 (rarea VPN_lb VPN_ub Positividad , color(gs14%30)) (line VPN Positividad, xline(16, lcolor(black) ///
 lpattern(_)) xline(30, lcolor(black) lpattern(.)) scheme(s1color) legend(order(2 "Valor predictivo positivo" ///
 4 "Valor predictivo negativo" 1 "IC95%") rows(3) size(vsmall) ring(0) position(4))) 
 
 graph save sospechoso_old
 
 save "movid_sintomas_2020-06-24_p_sospechoso_old.dta", replace 

 
*Crear VP para definición caso sospechoso nuevo consejo no decretado (C3) 
use "movid_sintomas_2020-06-24_3.dta", clear 
 
 
 forvalues i= 0/99 {
 diagt ex_confirmado sospechoso_new, prev(`i'%)
 gen VPP_new`i'= r(ppv)
 gen VPP_lb_new`i'= r(ppv_lb)
 gen VPP_ub_new`i'= r(ppv_ub) 
 gen VPN_new`i'= r(npv) 
 gen VPN_lb_new`i'= r(npv_lb)
 gen VPN_ub_new`i'= r(npv_ub) 
 }
 
 collapse (max) VPP_new0-VPN_ub_new99
 gen Prev= 1
 reshape long VPP_new VPP_lb_new VPP_ub_new VPN_new VPN_lb_new VPN_ub_new, i(Prev) j(p)
 rename p Positividad
 
twoway  (rarea VPP_lb VPP_ub Positividad , color(gs14%30))(line VPP Positividad) ///
 (rarea VPN_lb VPN_ub Positividad , color(gs14%30)) (line VPN Positividad, xline(16, lcolor(black) ///
 lpattern(_)) xline(30, lcolor(black) lpattern(.)) scheme(s1color) legend(order(2 "Valor predictivo positivo" ///
 4 "Valor predictivo negativo" 1 "IC95%") rows(3) size(vsmall) ring(0) position(4)))  
 save "movid_sintomas_2020-06-24_p_sospechoso_new.dta", replace 

  graph save sospechoso_new

  save "movid_sintomas_2020-06-24_p_sospechoso_new.dta", replace 
  
*Crear VP para definición caso sospechoso actual (C4) 
use "movid_sintomas_2020-06-24_3.dta", clear 
 
 
 forvalues i= 0/99 {
 diagt ex_confirmado cs_actuald, prev(`i'%)
 gen VPP_a`i'= r(ppv)
 gen VPP_lb_a`i'= r(ppv_lb)
 gen VPP_ub_a`i'= r(ppv_ub) 
 gen VPN_a`i'= r(npv) 
 gen VPN_lb_a`i'= r(npv_lb)
 gen VPN_ub_a`i'= r(npv_ub) 
 }
 
 collapse (max) VPP_a0-VPN_ub_a99
 gen Prev= 1
 reshape long VPP_a VPP_lb_a VPP_ub_a VPN_a VPN_lb_a VPN_ub_a, i(Prev) j(p)
 rename p Positividad
 

  save "movid_sintomas_2020-06-24_p_actual.dta", replace 
  
  
 
*Crear VP para definición caso sospechoso propuesto  (C5)
 use "movid_sintomas_2020-06-24_3.dta", clear 
 
 
 forvalues i= 0/99 {
 diagt ex_confirmado cs_sw, prev(`i'%)
 gen VPP_sw`i'= r(ppv)
 gen VPP_lb_sw`i'= r(ppv_lb)
 gen VPP_ub_sw`i'= r(ppv_ub) 
 gen VPN_sw`i'= r(npv) 
 gen VPN_lb_sw`i'= r(npv_lb)
 gen VPN_ub_sw`i'= r(npv_ub) 
 }
 
 collapse (max) VPP_sw0-VPN_ub_sw99
 gen Prev= 1
 reshape long VPP_sw VPP_lb_sw VPP_ub_sw VPN_sw VPN_lb_sw VPN_ub_sw, i(Prev) j(p)
 rename p Positividad
 
 twoway  (rarea VPP_lb VPP_ub Positividad , color(gs14%30))(line VPP Positividad, color(green)) ///
 (rarea VPN_lb VPN_ub Positividad , color(gs14%30)) (line VPN Positividad, color(blue) xline(16, lcolor(black) ///
 lpattern(_)) xline(30, lcolor(black) lpattern(.)) scheme(s1color) legend(order(2 "Valor predictivo positivo" ///
 4 "Valor predictivo negativo" 1 "IC95%") rows(3) size(vsmall) ring(0) position(4)))  
 
 save "movid_sintomas_2020-06-24_p_sospechoso_new.dta", replace 

  graph save cs_sw
   
 save "movid_sintomas_2020-06-24_p_sw.dta", replace 

 *Unir bases
 
 use "movid_sintomas_2020-06-24_p_sw.dta" 
 merge 1:1 Positividad using "movid_sintomas_2020-06-24_p_sospechoso_new.dta"
 drop _merge
 merge 1:1 Positividad using "movid_sintomas_2020-06-24_p_OMS.dta"
 drop _merge
 merge 1:1 Positividad using "movid_sintomas_2020-06-24_p_sospechoso_old.dta"
 drop _merge
  merge 1:1 Positividad using "movid_sintomas_2020-06-24_p_actual.dta"
 
 save "movid_sintomas_2020-06-24_p_all.dta", replace 

  twoway  (rarea VPP_lb_a VPP_ub_a Positividad , color(gs14%30))(line VPP_a Positividad, color(green)) ///
 (rarea VPN_lb_a VPN_ub_a Positividad , color(gs14%30)) (line VPN_a Positividad, color(red) xline(16, lcolor(black) ///
 lpattern(_)) xline(30, lcolor(black) lpattern(.)) scheme(s1color)) /// 
 (rarea VPP_lb_sw VPP_ub_sw  Positividad , color(gs14%30))(line VPP_sw  Positividad, color(blue)) ///
 (rarea VPN_lb_sw  VPN_ub_sw  Positividad , color(gs14%30)) (line VPN_sw  Positividad, color(navy) ///
 legend(order(2 "Valor predictivo positivo C4" 4 "Valor predictivo negativo C4" ///
 1 "IC95%"6 "Valor predictivo positivo C5" 8 "Valor predictivo negativo C5") ///
 rows(2) size(vsmall)))
 
