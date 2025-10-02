if {![namespace exists ::IMEX]} { namespace eval ::IMEX {} }
set ::IMEX::dataVar [file dirname [file normalize [info script]]]
set ::IMEX::libVar ${::IMEX::dataVar}/libs

create_library_set -name libs_typ\
   -timing\
    [list ${::IMEX::libVar}/mmmc/tcbn65lpbwp7twc.lib\
    ${::IMEX::libVar}/mmmc/tphn65lpnv2od3_sltc.lib\
    ${::IMEX::libVar}/mmmc/tphn65lpnv2od3_sltc1.lib\
    ${::IMEX::libVar}/mmmc/tphn65lpnv2od3_sltc2.lib\
    ${::IMEX::libVar}/mmmc/tphn65lpnv2od3_sltc3.lib\
    ${::IMEX::libVar}/mmmc/tphn65lpnv2od3_sltc4.lib]
create_rc_corner -name tsmc65_rc_corner_typ\
   -cap_table ${::IMEX::libVar}/mmmc/cln65lp_1p09m+alrdl_top2_typical.captable\
   -preRoute_res 1\
   -postRoute_res 1\
   -preRoute_cap 1\
   -postRoute_cap 1\
   -postRoute_xcap 1\
   -preRoute_clkres 0\
   -preRoute_clkcap 0\
   -T 25
create_delay_corner -name corner_typ\
   -library_set libs_typ\
   -rc_corner tsmc65_rc_corner_typ
create_constraint_mode -name CONSTRAINTS\
   -sdc_files\
    [list ${::IMEX::dataVar}/mmmc/modes/CONSTRAINTS/CONSTRAINTS.sdc]
create_analysis_view -name functional_typ -constraint_mode CONSTRAINTS -delay_corner corner_typ -latency_file ${::IMEX::dataVar}/mmmc/views/functional_typ/latency.sdc
set_analysis_view -setup [list functional_typ] -hold [list functional_typ]
