set more off

***********************************************
************Results using firm data************
***********************************************
use firm_data, clear

************Table I************
reg growth_empl_5156 ///
treated_bk_notwest ///
, cluster(county)
estimates store growth_empl_5156_1
	
reg growth_empl_5156 ///
i.zone##i.industry i.zone##i.empl_bin i.zone##c.lnage ///
treated_bk_notwest ///
, cluster(county)
estimates store growth_empl_5156_2

reg growth_empl_5156 ///
treated_bk_notwest ///
if focused_sample==1, cluster(county)
estimates store growth_empl_5156_3
	
reg growth_empl_5156 ///
i.industry i.empl_bin c.lnage ///
treated_bk_notwest ///
if focused_sample==1, cluster(county)
estimates store growth_empl_5156_4

reg growth_empl_5156 ///
treated_bk_notwest ///
if exporter==1, cluster(county)
estimates store growth_empl_5156_5
	
reg growth_empl_5156 ///
i.zone##i.industry i.zone##i.empl_bin i.zone##c.lnage ///
treated_bk_notwest ///
if exporter==1, cluster(county)
estimates store growth_empl_5156_6

reg growth_empl_5156 ///
treated_bk_notwest ///
if strict_state==1, cluster(county)
estimates store growth_empl_5156_7
	
reg growth_empl_5156 ///
i.zone##i.industry i.zone##i.empl_bin i.zone##c.lnage ///
treated_bk_notwest ///
if strict_state==1, cluster(county)
estimates store growth_empl_5156_8

outreg2 [growth_empl_5156_1 growth_empl_5156_2 growth_empl_5156_3 growth_empl_5156_4 ///
growth_empl_5156_5 growth_empl_5156_6 growth_empl_5156_7 growth_empl_5156_8] ///
using "table1", replace ///
keep(treated_bk_notwest) nocons sortvar(treated_bk_notwest) ///
title("Table I") nonotes dec(3) ctitle(" ") noaster


************Table II************
foreach outcome in growth_empl_5160 growth_bkdebt_5160 growth_bkdebt_assets_5160 growth_rev_per_empl_5160 {

	reg `outcome' ///
	treated_bk, cluster(county)
	estimates store `outcome'_1
	
	reg `outcome' ///
	i.zone##i.industry i.zone##c.lnassets i.zone##c.lnage ///
	treated_bk, cluster(county)
	estimates store `outcome'_2

	reg `outcome' ///
	i.zone##i.industry i.zone##c.lnassets i.zone##c.lnage ///
	treated_bk if bkdebt_assets_high==1, cluster(county)
	estimates store `outcome'_3

	reg `outcome' ///
	i.zone##i.industry i.zone##c.lnassets i.zone##c.lnage ///
	treated_bk if capital_assets_low==1, cluster(county)
	estimates store `outcome'_4

}

outreg2 [growth_empl_5160_1 growth_empl_5160_2 growth_empl_5160_3 growth_empl_5160_4 ///
growth_bkdebt_5160_1 growth_bkdebt_5160_2 growth_bkdebt_5160_3 growth_bkdebt_5160_4 ///
growth_bkdebt_assets_5160_1 growth_bkdebt_assets_5160_2 growth_bkdebt_assets_5160_3 growth_bkdebt_assets_5160_4 ///
growth_rev_per_empl_5160_1 growth_rev_per_empl_5160_2 growth_rev_per_empl_5160_3 growth_rev_per_empl_5160_4] ///
using "table2", replace ///
keep(treated_bk) nocons sortvar(treated_bk) ///
title("Table II") nonotes dec(3) ctitle(" ") noaster


************Table III************
reg growth_bkdebt_assets_5160 ///
i.zone##i.industry i.zone##c.lnassets i.zone##c.lnage ///
treated_bk if opaque==1, cluster(county)
estimates store opaque_1

reg growth_cap_assets_5160 ///
i.zone##i.industry i.zone##c.lnassets i.zone##c.lnage ///
treated_bk if opaque==1, cluster(county)
estimates store opaque_2

reg growth_empl_5160 ///
i.zone##i.industry i.zone##c.lnassets i.zone##c.lnage ///
treated_bk if opaque==1, cluster(county)
estimates store opaque_3

reg growth_bkdebt_assets_5160 ///
i.zone##i.industry i.zone##c.lnassets i.zone##c.lnage ///
treated_bk_uptohalf treated_bk_overhalf if opaque==1, cluster(county)
estimates store opaque_4

reg growth_empl_5156 ///
i.zone##i.industry i.zone##i.empl_bin i.zone##c.lnage ///
treated_bk_notwest_uptohalf treated_bk_notwest_overhalf if opaque==1, cluster(county)
estimates store opaque_5

reg growth_empl_5156 ///
i.industry i.empl_bin c.lnage ///
treated_bk_notwest_uptohalf treated_bk_notwest_overhalf if opaque==1 & focused_sample==1, cluster(county)
estimates store opaque_6

outreg2 [opaque_1 opaque_2 opaque_3 opaque_4 opaque_5 opaque_6] ///
using "table3", replace ///
keep(treated_bk treated_bk_uptohalf treated_bk_overhalf treated_bk_notwest_uptohalf treated_bk_notwest_overhalf) nocons ///
sortvar(treated_bk treated_bk_uptohalf treated_bk_overhalf treated_bk_notwest_uptohalf treated_bk_notwest_overhalf) ///
title("Table III") nonotes dec(3) ctitle(" ") noaster


************Table IV************
reg growth_empl_5156 ///
treated_added_notwest ///
if increased_banks_sample==1, cluster(county)
estimates store added_1

reg growth_empl_5156 ///
i.zone##i.industry i.zone##i.empl_bin i.zone##c.lnage ///
treated_added_notwest ///
if increased_banks_sample==1, cluster(county)
estimates store added_2

reg growth_empl_5156 ///
i.zone##i.industry i.zone##i.empl_bin i.zone##c.lnage ///
treated_added_notwest treated_dropped_notwest treated_never_notwest, cluster(county)
estimates store added_3

reg growth_empl_5160 ///
treated_added ///
if increased_banks_sample==1, cluster(county)
estimates store added_4

reg growth_empl_5160 ///
i.zone##i.industry i.zone##c.lnassets i.zone##c.lnage ///
treated_added ///
if increased_banks_sample==1, cluster(county)
estimates store added_5
	
reg growth_empl_5160 ///
i.zone##i.industry i.zone##c.lnassets i.zone##c.lnage ///
treated_added treated_dropped treated_never, cluster(county)
estimates store added_6

outreg2 [added_1 added_2 added_3 added_4 added_5 added_6] ///
using "table4", replace ///
keep(treated_added_notwest treated_dropped_notwest treated_never_notwest treated_added treated_dropped treated_never) nocons ///
sortvar(treated_added_notwest treated_dropped_notwest treated_never_notwest treated_added treated_dropped treated_never) ///
title("Table IV") nonotes dec(3) ctitle(" ") noaster


************Table VII************
reg treated_fraction_70 ///
	opaque ///
	low_vol if treated_bk==0, cluster(county)
estimates store risky_1

reg treated_fraction_70 ///
	i.zone##i.industry i.zone##i.empl_bin i.zone##c.lnage opaque ///
	low_vol if treated_bk==0, cluster(county)
estimates store risky_2

reg treated_fraction_70 ///
	opaque ///
	low_leverage medium_leverage if treated_bk==0, cluster(county)
estimates store risky_3

reg treated_fraction_70 ///
	i.zone##i.industry i.zone##i.empl_bin i.zone##c.lnage opaque ///
	low_leverage medium_leverage if treated_bk==0, cluster(county)
estimates store risky_4

outreg2 [risky_1 risky_2 risky_3 risky_4] ///
using "table7", replace ///
keep(low_vol low_leverage medium_leverage) nocons ///
sortvar(low_vol low_leverage medium_leverage) ///
title("Table VII") nonotes dec(3) ctitle(" ") noaster


*******************************************************
************Results using municipality data************
*******************************************************
use municipality_data, clear

************Table V************
reg growth_5160 ///
i.state i.size_bin ///
treated_branch, robust
estimates store municipality_1

reg growth_5160 ///
i.state i.size_bin ruhr ///
treated_branch, robust
estimates store municipality_2

reg growth_5160 ///
i.state i.size_bin ruhr ///
fraction_with_treated_bk, robust
estimates store municipality_3

reg growth_5156 ///
i.state i.size_bin ruhr ///
treated_branch_notwest treated_branch_west, robust
estimates store municipality_4

reg growth_4751 ///
i.state i.size_bin ruhr ///
treated_branch, robust
estimates store municipality_5

reg growth_5160 ///
i.zone##i.size_bin i.zone##c.share_manufacturing i.zone##c.share_primary i.zone##c.share_public ///
i.zone##c.share_displaced i.zone##c.growth_4751 ruhr ///
treated_branch, robust
estimates store municipality_6

outreg2 [municipality_1 municipality_2 municipality_3 municipality_4 municipality_5 municipality_6] ///
using "table5", replace ///
keep(treated_branch fraction_with_treated_bk treated_branch_notwest treated_branch_west) nocons ///
sortvar(treated_branch fraction_with_treated_bk treated_branch_notwest treated_branch_west) ///
title("Table V") nonotes dec(3) ctitle(" ") noaster


***********************************************
************Results using bank data************
***********************************************
use bank_data, clear

foreach outcome of varlist avg_assets_prereform growth_loans_5260 growth_profits_5260 ///
profit_eff_ratio_1952 profit_eff_ratio_1960 cost_eff_ratio_1952 cost_eff_ratio_1960 ///
nonintcost_assets_1952 nonintcost_assets_1960 nonintcost_revenue_1952 nonintcost_revenue_1960 {
	reg `outcome' treated, robust
	estimates store `outcome'
}

outreg2 [avg_assets_prereform growth_loans_5260 growth_profits_5260 ///
profit_eff_ratio_1952 profit_eff_ratio_1960 cost_eff_ratio_1952 cost_eff_ratio_1960 ///
nonintcost_assets_1952 nonintcost_assets_1960 nonintcost_revenue_1952 nonintcost_revenue_1960] ///
using "table6", replace ///
keep(treated) nocons sortvar(treated) ///
title("Table VI") nonotes dec(2) ctitle(" ") noaster
