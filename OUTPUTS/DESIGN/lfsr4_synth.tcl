# This script contains the setup for the database from a Tcl object. This script
# needs to be sourced before that database is loaded.
#
# Script written with '18.10-p003_1'.
::legacy::set_attribute -quiet novus_ui true /
#
# user-defined attributes
#
if {![get_attribute_status wlec_internal_to_write_lec_db_for_invocation -type root]} {
  define_attribute -obj_type root -category {lec} -data_type {string} -help_string {Capture internal write_lec variables.} -hidden wlec_internal_to_write_lec_db_for_invocation
}
if {![get_attribute_status wlec_internal_to_write_lec_db_for_label -type root]} {
  define_attribute -obj_type root -category {lec} -data_type {string} -help_string {Capture internal write_lec variables.} -hidden wlec_internal_to_write_lec_db_for_label
}
if {![get_attribute_status wlec_internal_to_write_lec_label_data -type root]} {
  define_attribute -obj_type root -category {lec} -data_type {string} -help_string {Capture internal write_lec variables.} -hidden wlec_internal_to_write_lec_label_data
}
#
# non-default attributes to messages
#
if {[llength [vfind -message /messages/TUI/TUI-59]] == 1} {
  set_db -quiet message:TUI/TUI-59 .max_print inf
}
if {[llength [vfind -message /messages/TUI/TUI-61]] == 1} {
  set_db -quiet message:TUI/TUI-61 .max_print inf
}
if {[llength [vfind -message /messages/TUI/TUI-266]] == 1} {
  set_db -quiet message:TUI/TUI-266 .max_print inf
}
set ::_continue_on_error [get_db continue_on_error]
set_db -quiet continue_on_error true
set_db -quiet force_tui_is_remote 1 
#
# root attributes changed from their default
#
set_db -quiet lef_library ""
set_db -quiet stim_no_validate_dut true
set_db -quiet phys_ple_reporting false
set_db -quiet use_abstract_models false
set_db -quiet gui_pgrid_control 0
set_db -quiet hdl_combine_sop_nodes 1
set_db -quiet hdl_reduce_mux_chain 1
set_db -quiet hdl_infer_macro 1
set_db -quiet hdl_enable_bitwidth_analysis_based_pruning 1
set_db -quiet hdl_enable_xform_constant_shiftrotates 1
set_db -quiet hdl_simplify_variable_part_selects 1
set_db -quiet max_sandbox_inst_resize_cnt 10000
set_db -quiet cpr__flag_cpr__beginning_big_loop 1
set_db -quiet map_upsize_size_ok 1
set_db -quiet dft__within_replace_scan 0
set_db -quiet dft__within_replace_scan_preprocessing 0
set_db -quiet eta__debug 0
set_db -quiet cell_based_bucketing 1
set_db -quiet cpf_synth__leaf_loads_threshold 10
set_db -quiet cpf_synth__local_loads_threshold 2
set_db -quiet aupt_combo_input_count_threshold 150000
set_db -quiet aupt_module_size_threshold 80000
set_db -quiet aupt__debug 0
set_db -quiet aupt__tolerance 10
set_db -quiet cpr__flag_cpr__whole_design 0
set_db -quiet plc_cpr_crit_nets 800
set_db -quiet write_vlog_new_one_hot_mux_model 0
set_db -quiet write_vlog_insert_new_line_after_separator 0
set_db -quiet gbf_factor_xor_penalty 2
set_db -quiet gbf_rrm_include_mog 0
set_db -quiet simsat_sat_effort 2200
set_db -quiet simsat_sat_max_effort 6000
set_db -quiet simsat_sat_seq_effort 15000
set_db -quiet simsat_sat_seq_max_assignments 150000
set_db -quiet simsat_sat_seq_max_effort 60000000
set_db -quiet simsat_sat_threshold_high_effort 2000
set_db -quiet simsat_sat_assign_limit 5000000
set_db -quiet simsat_sim_effort 1000
set_db -quiet simsat_sim_max_effort 8000
set_db -quiet simsat_sim_seq_effort 1500
set_db -quiet simsat_sim_seq_max_effort 8000
set_db -quiet cpf_iso__honorDesignIsoRule 4
set_db -quiet cpf_synth__debug 0
set_db -quiet cpf_synth__consider_constant_drivers 1
set_db -quiet cpf_synth__do_collect_buffer_trees 1
set_db -quiet cpf_synth__ignore_buf_inv_tree_polarity 1
set_db -quiet cpf_synth__preserve_as_user 1
set_db -quiet cpf_synth__preview 0
set_db -quiet cpf_synth__timing_models_are_boundaries 1
set_db -quiet spef__print_swapping_stats 0
set_db -quiet gui_include_macro_blockage 0
set_db -quiet gui_include_derived_blockage 0
set_db -quiet lef_power_ground_pin_override 1
set_db -quiet degenerate_combo_elts_to_basic 0
set_db -quiet disable_power_ground_pin_support 0
set_db -quiet db_compatibility_for_non_seq_setup_arcs 0
set_db -quiet _gui_stop 0
set_db -quiet stats_db__suppress 0
set_db -quiet cle__disable_extra_space 0
set_db -quiet spef__detour_net_threshold 0.0
set_db -quiet spef__site_size_multiple_threshold 0.0
set_db -quiet spef__min_cap_ratio_threshold 0.0
set_db -quiet information_level 4
set_db -quiet novus_ui true
set_db -quiet novus_gui true
set_db -quiet metric_internal_tcl_data {id {} metric_cfgs {{metric alerts type alert description {Alerts about other metric values} dp 0 cmp notEqualBad} {metric check.drc description {Total check DRC count} dp 0 cmp lessBetter} {metric check.drc.layer:<layer> description {Check DRC count per layer} dp 0 cmp lessBetter} {metric check.drc.type:<type> description {Check DRC count per type} dp 0 cmp lessBetter} {metric design.area units um^2 type area description {Total design area} dp 0 cmp lessBetter} {metric design.area.always_on units um^2 type area description {Total area of always on instances} dp 0 cmp lessBetter} {metric design.area.area_io units um^2 type area description {Total area of area_io instances} dp 0 cmp lessBetter} {metric design.area.blackbox units um^2 type area description {Total area of block instances} dp 0 cmp lessBetter} {metric design.area.block units um^2 type area description {Total area of block instances} dp 0 cmp lessBetter} {metric design.area.block.<block> units um^2 type area description {Design area per block} dp 0 cmp lessBetter} {metric design.area.buffer units um^2 type area description {Total area of buffer instances} dp 0 cmp lessBetter scan_tcl {
  set_alert_metric -id $db_id -uuid $self_uuid -name $metric "Buffer area increased by over 20%" -condition [expr { [lindex $previous 0 0] ne {} && [lindex $self 0] ne {} && ( [lindex $previous 0 0] == 0 || (([lindex $self 0] * 100) / [lindex $previous 0 0]) >= 120) }]
}} {metric design.area.combinatorial units um^2 type area description {Total area of combinational standard cell logic} dp 0 cmp lessBetter} {metric design.area.filler units um^2 type area description {Total design area of filler isntances} dp 0 cmp lessBetter} {metric design.area.hinst:<block> units um^2 type area description {Design area per block} dp 0 cmp lessBetter} {metric design.area.icg units um^2 type area description {Total area of icg instances} dp 0 cmp lessBetter} {metric design.area.inverter units um^2 type area description {Total area of inverter} dp 0 cmp lessBetter} {metric design.area.io units um^2 type area description {Total area of io instances} dp 0 cmp lessBetter} {metric design.area.iso_ls units um^2 type area description {Total area of iso and level shifter instances} dp 0 cmp lessBetter} {metric design.area.latch units um^2 type area description {Total area of latch instances} dp 0 cmp lessBetter} {metric design.area.logical units um^2 type area description {Total area of logical} dp 0 cmp lessBetter} {metric design.area.macro units um^2 type area description {Total area of block instances} dp 0 cmp lessBetter} {metric design.area.physical units um^2 type area description {Total area of physical only instances} dp 0 cmp lessBetter} {metric design.area.power_switch units um^2 type area description {Total area of power switches instances} dp 0 cmp lessBetter} {metric design.area.register units um^2 type area description {Total area of register instances} dp 0 cmp lessBetter} {metric design.area.sequential units um^2 type area description {Total area of sequential instances} dp 0 cmp lessBetter} {metric design.area.std_cell units um^2 type area description {Total area of standard cell instances} dp 0 cmp lessBetter} {metric design.congestion.hotspot.max description {Maximum congestion hotspot size} dp 2 cmp lessBetter} {metric design.congestion.hotspot.total description {Total size of all congestion hotspots} dp 2 cmp lessBetter} {metric design.density units % type density description {Density w/o filler cells} dp 1 cmp lessBetter} {metric design.density.peak units % type density description {Peak design density w/o filler cells} dp 1 cmp lessBetter} {metric design.floorplan.image type imageplot dp 0} {metric design.instances description {Total number of instances} dp 0 cmp lessBetter} {metric design.instances.always_on description {Total number of always on instances} dp 0 cmp lessBetter} {metric design.instances.area_io description {Total number of Area IO instances} dp 0 cmp lessBetter} {metric design.instances.blackbox description {Total number of blackbox instances} dp 0 cmp lessBetter} {metric design.instances.block description {Total number of block instances} dp 0 cmp lessBetter} {metric design.instances.block.<block> description {Number of instances per block} dp 0 cmp lessBetter} {metric design.instances.buffer description {Total number of buffer instances} dp 0 cmp lessBetter} {metric design.instances.combinatorial description {Total number of combinational standard cell logic instances} dp 0 cmp lessBetter} {metric design.instances.filler description {Total number of filler instances} dp 0 cmp lessBetter} {metric design.instances.hinst:<block> description {Number of instances per block} dp 0 cmp lessBetter} {metric design.instances.icg description {Total number of clock gating instances} dp 0 cmp lessBetter} {metric design.instances.inverter description {Total number of inverter instances} dp 0 cmp lessBetter} {metric design.instances.io description {Total number of IO instances} dp 0 cmp lessBetter} {metric design.instances.iso_ls description {Total number of iso and level shifter instances} dp 0 cmp lessBetter} {metric design.instances.latch description {Total number of latch instances} dp 0 cmp lessBetter} {metric design.instances.logical description {Total number of logical instances} dp 0 cmp lessBetter} {metric design.instances.macro description {Total number of block instances} dp 0 cmp lessBetter} {metric design.instances.physical description {Total number of physical instances} dp 0 cmp lessBetter} {metric design.instances.power_switch description {Total number of power switches} dp 0 cmp lessBetter} {metric design.instances.register description {Total number of sequential instances} dp 0 cmp lessBetter} {metric design.instances.sequential description {Total number of sequential instances} dp 0 cmp lessBetter} {metric design.instances.std_cell description {Total number of standard cell instances} dp 0 cmp lessBetter} {metric design.multibit.avg_width description {Total bits / total flops} dp 0 cmp moreBetter} {metric design.multibit.count description {Total number of multi-bit instances} dp 0 cmp moreBetter} {metric design.multibit.coverage units % type density description {Total multi-bits / total bits} dp 1 cmp moreBetter} {metric design.name tcl {
  if {[llength [um::userscript::get_obj "designs"]] == 1} {
    if {[um::userscript::get_obj "current_design"] ne ""} {
      return [um::userscript::get_obj [um::userscript::get_obj "current_design"] .name]
    }
  }
  return ""
} type area description {Design name} dp 0} {metric design.nets.avg_pin description {Average terms per net} dp 1 cmp lessBetter} {metric design.nets.global description {Number of global nets} dp 0 cmp lessBetter} {metric design.nets.missing_iso description {Number of nets crossing domains w/o ISO} dp 0 cmp lessBetter} {metric design.nets.signal description {Number of signal nets} dp 0 cmp lessBetter} {metric design.power_domains description {List of power domains} dp 0} {metric design.route.drc.image type imageplot dp 0} {metric flow.cputime units s type time description {CPU time since the last snapshot} dp 0 cmp lessBetter} {metric flow.cputime.not_child units s type time description {CPU time taken since the last snapshot excluding child snapshots} dp 0 cmp lessBetter} {metric flow.cputime.total units s type time description {Total CPU time} dp 0 cmp lessBetter} {metric flow.cputime.user units s type time description {User CPU time since the last snapshot} dp 0 cmp lessBetter} {metric flow.cputime.user.not_child units s type time description {User CPU time since the last snapshot excluding child snapshots} dp 0 cmp lessBetter} {metric flow.cputime.user.total units s type time description {Total user CPU time} dp 0 cmp lessBetter} {metric flow.exclude_time_metric type bool description {CPU and Wall time are excluded from parent snapshot} dp 0 inheritance_enabled 0} {metric flow.last_child_snapshot description {Name of the last child snapshot} dp 0 inheritance_tcl {
  if {[llength $children_uuid] > 0} {
    return [lindex [get_metric -id $db_id -uuid [lindex $children_uuid end] "name"] 1]
  }
  return ""
} inherit_no_children 1} {metric flow.log tcl {return [file normalize [um::userscript::get_obj "log_file"]]} type file description {log file} dp 0} {metric flow.log.verbose type file description {verbose log file} dp 0} {metric flow.machine tcl { info hostname } description Hostname dp 0} {metric flow.machine.load description {Host load average} dp 2 cmp lessBetter} {metric flow.memory units MB type memory description {Current memory footprint} dp 0 cmp lessBetter inheritance_tcl {
  variable m [lindex [get_metric -id $db_id -uuid $self_uuid $metric.instant] 1]
  # Use get_metric to normalize to MB and strip off units
  foreach cu $children_uuid {variable c [lindex [get_metric -id $db_id -uuid $cu $metric] 1]; if {$c > $m || $m == ""} {variable m $c}}
  if {$m == ""} {return ""}
  return [list $m MB]
} inherit_no_children 1} {metric flow.memory.instant units MB type memory description {Current memory footprint} dp 0 cmp lessBetter inheritance_enabled 0} {metric flow.memory.resident units MB type memory description {Current resident memory footprint} dp 0 cmp lessBetter inheritance_tcl {
  variable m [lindex [get_metric -id $db_id -uuid $self_uuid $metric.instant] 1]
  # Use get_metric to normalize to MB and strip off units
  foreach cu $children_uuid {variable c [lindex [get_metric -id $db_id -uuid $cu $metric] 1]; if {$c > $m || $m == ""} {variable m $c}}
  if {$m == ""} {return ""}
  return [list $m MB]
} inherit_no_children 1} {metric flow.memory.resident.instant units MB type memory description {Current resident memory footprint} dp 0 cmp lessBetter inheritance_enabled 0} {metric flow.memory.resident.peak units MB type memory description {Maximum resident memory footprint} dp 0 cmp lessBetter inheritance_tcl {
  variable m [lindex [get_metric -id $db_id -uuid $self_uuid $metric.instant] 1]
  # Use get_metric to normalize to MB and strip off units
  foreach cu $children_uuid {variable c [lindex [get_metric -id $db_id -uuid $cu $metric] 1]; if {$c > $m || $m == ""} {variable m $c}}
  if {$m == ""} {return ""}
  return [list $m MB]
} inherit_no_children 1} {metric flow.memory.resident.peak.instant units MB type memory description {Maximum resident memory footprint} dp 0 cmp lessBetter inheritance_enabled 0} {metric flow.realtime units s type time description {Real time since the last snapshot} dp 0 cmp lessBetter} {metric flow.realtime.not_child units s type time description {Real time since the last snapshot excluding child snapshots} dp 0 cmp lessBetter} {metric flow.realtime.total units s type time description {Total real time} dp 0 cmp lessBetter} {metric flow.root_config type dict description {Non-default root config option values} dp 0} {metric flow.run_directory tcl { return [pwd] } type dir description {Current working directory} dp 0} {metric flow.run_tag tcl { ; #owner: um team
  if {[is_attribute -obj_type root flow_run_tag]} { 
    return [um::userscript::get_obj flow_run_tag]
  }
  return "" 
} description {Flow run tag} dp 0} {metric flow.step.tcl type tcl description {Tcl that was executed for this step} dp 0 inheritance_enabled 0} {metric flow.template.feature_enabled tcl {
  variable ret {}
  variable f
  variable s
  if {[is_attribute flow_template_feature_definition -obj_type root]} { 
    foreach {f s} [um::userscript::get_obj flow_template_feature_definition] { 
      if {$s eq {enabled}} { 
        lappend ret $f
      }
      if {($s eq {optional}) && [um::userscript::get_obj flow_feature_$f]} { 
        lappend ret $f
      }
    }
  }
  return $ret
} description {The flow template features that are currently enabled} dp 0} {metric flow.template.type tcl {
  if {[is_attribute flow_template_type -obj_type root]} { 
    return [um::userscript::get_obj flow_template_type]; 
  }
  return {}
} description {The type of flow template} dp 0} {metric flow.tool.name tcl { 
  return [um::userscript::get_obj program_name]
} description {Tool name} dp 0} {metric flow.tool.name.short tcl {
  return [um::userscript::get_obj program_short_name] 
} description {Tool short name} dp 0} {metric flow.tool.version tcl {
  return [um::userscript::get_obj program_version]
} description {Tool version} dp 0} {metric flow.tool_list description {List of tools used in flow} dp 0 inheritance_tcl {
  variable tool_list [list "[lindex [get_metric -id $db_id -uuid $self_uuid flow.tool.name.short] 1]-[lindex [get_metric -id $db_id -uuid $self_uuid flow.tool.version] 1]"]
  if {$tool_list eq "-"} {variable tool_list ""}
  foreach c $children {variable tool_list [concat $tool_list $c]}
  return [lsort -unique $tool_list]
} inherit_no_children 1} {metric flow.user tcl { set env(USER) } description {User name} dp 0} {metric messages tcl {
  # check that the procs exist
  if {[namespace eval ::flowkit {info commands generic.get_msg_since_last_call}] eq {}} {
    return {}
  } else {
    # call the flowkit messages with out own var
    return [::flowkit::generic.get_msg_since_last_call ::um::userscript::metric_last_message]
  }
} type messages description messages dp 0 inheritance_tcl {
  # add the counts together of the similar messages
  # format is: [list {count 1 id IMPDBTCL-247 ... }]
  variable parent_dict {}
  variable c
  variable e
  foreach c $children {
    foreach e $c {
      if {$e ne {}} {
        if {[dict exists $parent_dict [dict get $e "id"]]} {
          dict set parent_dict [dict get $e "id"] "count"  [expr [dict get $parent_dict [dict get $e "id"] "count"]  + [dict get $e "count"]]
        } else {
          dict set parent_dict [dict get $e "id"] $e
        }
      }
    }
  }
  return [dict values $parent_dict]  
}} {metric metric.version type version description {version number of metrics} dp 0 inheritance_tcl {
  variable v [lindex [get_metric -id $db_id -uuid $self_uuid $metric.instant] 1]
  foreach c $children {if {[lsearch -exact $v $c] == -1} {lappend v $c}}
  if {$v == ""} {return "1"}
  return $v
} inherit_no_children 1} {metric metric.version.instant type version description {version number of metrics} dp 0 inheritance_enabled 0} {metric name description {Name of the snapshot} dp 0} {metric power units mW description {Total power} dp 2 cmp lessBetter} {metric power.block.<block> units mW description {Total per block power} dp 2 cmp lessBetter} {metric power.clock units mW description {Total clock power} dp 2 cmp lessBetter} {metric power.clock.total units mW description {Total clock power} dp 2 cmp lessBetter} {metric power.dynamic units mW description {Total dynamic power} dp 2 cmp lessBetter} {metric power.dynamic.block units mW description {Macro dynamic power} dp 2 cmp lessBetter} {metric power.dynamic.block.<block> units mW description {Total per block dynamic power} dp 2 cmp lessBetter} {metric power.dynamic.combinatorial units mW description {Combinatorial dynamic power} dp 2 cmp lessBetter} {metric power.dynamic.hinst:<block> units mW description {Total per block dynamic power} dp 2 cmp lessBetter} {metric power.dynamic.io units mW description {IO dynamic power} dp 2 cmp lessBetter} {metric power.dynamic.macro units mW description {Macro dynamic power} dp 2 cmp lessBetter} {metric power.dynamic.sequential units mW description {Sequential dynamic power} dp 2 cmp lessBetter} {metric power.dynamic.total units mW description {Total dynamic power} dp 2 cmp lessBetter} {metric power.dynamic.type:<combinatorial|clock_combinatorial|io|clock_sequential|sequential> units mW description {Per type dynamic power} dp 2 cmp lessBetter} {metric power.hinst:<block> units mW description {Total per block power} dp 2 cmp lessBetter} {metric power.internal units mW description {Total internal power} dp 2 cmp lessBetter} {metric power.internal.block units mW description {Internal Macro power} dp 2 cmp lessBetter} {metric power.internal.block.<block> units mW description {Total per block internal power} dp 2 cmp lessBetter} {metric power.internal.clock_combinatorial units mW description {Internal combinatorial clock power} dp 2 cmp lessBetter} {metric power.internal.clock_sequential units mW description {Internal sequential clock power} dp 2 cmp lessBetter} {metric power.internal.combinatorial units mW description {Internal combinatorial power} dp 2 cmp lessBetter} {metric power.internal.hinst:<block> units mW description {Total per block internal power} dp 2 cmp lessBetter} {metric power.internal.io units mW description {Internal IO power} dp 2 cmp lessBetter} {metric power.internal.macro units mW description {Internal Macro power} dp 2 cmp lessBetter} {metric power.internal.sequential units mW description {Internal sequential power} dp 2 cmp lessBetter} {metric power.internal.total units mW description {Total internal power} dp 2 cmp lessBetter} {metric power.internal.type:<combinatorial|clock_combinatorial|io|clock_sequential|sequential> units mW description {Per type internal power} dp 2 cmp lessBetter} {metric power.leakage units mW description {Total leakage power} dp 2 cmp lessBetter} {metric power.leakage.block units mW description {Macro leakage power} dp 2 cmp lessBetter} {metric power.leakage.block.<block> units mW description {Total per block leakage power} dp 2 cmp lessBetter} {metric power.leakage.clock_combinatorial units mW description {Combinatorial clock leakage power} dp 2 cmp lessBetter} {metric power.leakage.clock_sequential units mW description {Sequential clock leakage power} dp 2 cmp lessBetter} {metric power.leakage.combinatorial units mW description {Combinatorial leakage power} dp 2 cmp lessBetter} {metric power.leakage.hinst:<block> units mW description {Total per block leakage power} dp 2 cmp lessBetter} {metric power.leakage.io units mW description {IO leakage power} dp 2 cmp lessBetter} {metric power.leakage.macro units mW description {Macro leakage power} dp 2 cmp lessBetter} {metric power.leakage.sequential units mW description {Sequential leakage power} dp 2 cmp lessBetter} {metric power.leakage.total units mW description {Total leakage power} dp 2 cmp lessBetter} {metric power.leakage.type:<combinatorial|clock_combinatorial|io|clock_sequential|sequential> units mW description {Per type leakage power} dp 2 cmp lessBetter} {metric power.switching units mW description {Total switching power} dp 2 cmp lessBetter} {metric power.switching.block units mW description {Macro switching power} dp 2 cmp lessBetter} {metric power.switching.block.<block> units mW description {Total per block switching power} dp 2 cmp lessBetter} {metric power.switching.clock_combinatorial units mW description {Combinatorial clock switching power} dp 2 cmp lessBetter} {metric power.switching.clock_sequential units mW description {Sequential clock switching power} dp 2 cmp lessBetter} {metric power.switching.combinatorial units mW description {Combinatorial switching power} dp 2 cmp lessBetter} {metric power.switching.hinst:<block> units mW description {Total per block switching power} dp 2 cmp lessBetter} {metric power.switching.io units mW description {IO switching power} dp 2 cmp lessBetter} {metric power.switching.macro units mW description {Macro switching power} dp 2 cmp lessBetter} {metric power.switching.sequential units mW description {Sequential switching power} dp 2 cmp lessBetter} {metric power.switching.total units mW description {Total switching power} dp 2 cmp lessBetter} {metric power.switching.type:<combinatorial|clock_combinatorial|io|clock_sequential|sequential> units mW description {Per type switching power} dp 2 cmp lessBetter} {metric power.total units mW description {Total power} dp 2 cmp lessBetter} {metric power.view description {Power analysis view} dp 0} {metric route.drc description {Total DRC count} dp 0 cmp lessBetter} {metric route.drc.<layer> description {DRC count per layer} dp 0 cmp lessBetter} {metric route.drc.<type> description {DRC count per type} dp 0 cmp lessBetter} {metric route.drc.layer:<layer> description {DRC count per layer} dp 0 cmp lessBetter} {metric route.drc.total description {Total DRC count} dp 0 cmp lessBetter} {metric route.drc.type:<type> description {DRC count per type} dp 0 cmp lessBetter} {metric route.layers description {Number of routing layers} dp 0} {metric route.overcon description {Total GR overcon} dp 0 cmp lessBetter} {metric route.overcon.<layer> description {GR overcon per layer} dp 0 cmp lessBetter} {metric route.overcon.layer:<layer> description {GR overcon per layer} dp 0 cmp lessBetter} {metric route.overcon.total description {Total GR overcon} dp 0 cmp lessBetter} {metric route.overflow.horizontal description {Trial-route horizontal overflow} dp 3 cmp lessBetter} {metric route.overflow.vertical description {Trial-route vertical overflow} dp 3 cmp lessBetter} {metric route.pitch.<layer> units um description {Routing pitch per layer} dp 3} {metric route.pitch.layer:<layer> units um description {Routing pitch per layer} dp 3} {metric route.shielding.nets description {Number of shielded nets} dp 0} {metric route.shielding.percentage description {Shielding percentage} dp 0} {metric route.via description {Total number of vias} dp 0 cmp lessBetter} {metric route.via.layer:<layer> description {Total number of vias per layer} dp 0 cmp lessBetter} {metric route.via.multicut description {Total number of MC vias} dp 0 cmp lessBetter} {metric route.via.multicut.<layer> description {Number of MC vias per layer} dp 0 cmp lessBetter} {metric route.via.multicut.layer:<layer> description {Number of MC vias per layer} dp 0 cmp lessBetter} {metric route.via.multicut.percentage description {Percentage of MC vias} dp 0 cmp lessBetter} {metric route.via.multicut.total description {Total number of MC vias} dp 0 cmp lessBetter} {metric route.via.singlecut description {Total number of SC vias} dp 0 cmp lessBetter} {metric route.via.singlecut.<layer> description {Number of SC vias per layer} dp 0 cmp lessBetter} {metric route.via.singlecut.layer:<layer> description {Number of SC vias per layer} dp 0 cmp lessBetter} {metric route.via.singlecut.percentage description {Percentage of SC vias} dp 0} {metric route.via.singlecut.total description {Total number of SC vias} dp 0 cmp lessBetter} {metric route.via.total description {Total number of vias} dp 0 cmp lessBetter} {metric route.via.total.<layer> description {Total number of vias per layer} dp 0 cmp lessBetter} {metric route.width.<layer> units um description {Routing width per layer} dp 3} {metric route.width.layer:<layer> units um description {Routing width per layer} dp 3} {metric route.wirelength units um description {Total wirelength} dp 0 cmp lessBetter} {metric route.wirelength.<layer> units um description {Wirelength per layer} dp 0 cmp lessBetter} {metric route.wirelength.layer:<layer> units um description {Wirelength per layer} dp 0 cmp lessBetter} {metric route.wirelength.total units um description {Total wirelength} dp 0 cmp lessBetter} {metric timing.analysis_views.all description {All views of setup/hold timing} dp 0} {metric timing.analysis_views.all.number description {The number of all views of setup/hold timing} dp 0} {metric timing.drv.max_cap units pF description {Total max capacitance violation} dp 0 cmp lessBetter} {metric timing.drv.max_cap.total units pF description {Total max capacitance violation} dp 0 cmp lessBetter} {metric timing.drv.max_cap.worst units pF description {Worst max capacitance violation} dp 0 cmp lessBetter} {metric timing.drv.max_fanout description {Total max fanout violations} dp 0 cmp lessBetter} {metric timing.drv.max_fanout.total description {Total max fanout violations} dp 0 cmp lessBetter} {metric timing.drv.max_fanout.worst description {Worst max fanout violation} dp 0 cmp lessBetter} {metric timing.drv.max_length description {Total max length violations} dp 0 cmp lessBetter} {metric timing.drv.max_length.total description {Total max length violations} dp 0 cmp lessBetter} {metric timing.drv.max_length.worst units um description {Worst max length violation} dp 3 cmp lessBetter} {metric timing.drv.max_tran units ns description {Total max transition violations} dp 0 cmp lessBetter} {metric timing.drv.max_tran.total units ns description {Total max transition violations} dp 0 cmp lessBetter} {metric timing.drv.max_tran.worst units ns description {Worst max transition violation} dp 3 cmp lessBetter} {metric timing.drv.report_file description {Location of the timing DRV report file} dp 0} {metric timing.hold.worst_path.capture_clock description {Capture clock of the worst hold path} dp 0} {metric timing.hold.worst_path.frequency units GHz description {Frequency: 1/(capture period-slack) of the worst hold path} dp 0 cmp moreBetter} {metric timing.hold.worst_path.launch_clock description {Launch clock of the worst hold path} dp 0} {metric timing.hold.worst_path.view description {Analysis view of the worst hold path} dp 0} {metric timing.setup.analysis_views.active description {All active views of setup timing} dp 0} {metric timing.setup.analysis_views.active.number description {The number of all active views of setup timing} dp 0} {metric timing.setup.analysis_views.enabled description {All enabled views of setup timing} dp 0} {metric timing.setup.analysis_views.enabled.number description {The number of all enabled views of setup timing} dp 0} {metric timing.setup.feps description {Total number of setup failing end points} dp 0 cmp lessBetter} {metric timing.setup.feps.<pathgroup> description {Total number of setup failing end points for a specific path group} dp 0 cmp lessBetter} {metric timing.setup.feps.analysis_view:<view> description {Total number of setup failing end points for a specific view} dp 0 cmp lessBetter} {metric timing.setup.feps.analysis_view:<view>.path_group:<group> description {Total number of setup failing end points for a specific view and path group} dp 0 cmp lessBetter} {metric timing.setup.feps.path_group:<group> description {Total number of setup failing end points for a specific path group} dp 0 cmp lessBetter} {metric timing.setup.histogram type histogram description {Setup TNS histogram} dp 0} {metric timing.setup.paths type timing_data description {Setup timing path details} dp 0} {metric timing.setup.tns units ns type slack description {Total negative setup slack (all path groups)} dp 0 cmp moreBetter} {metric timing.setup.tns.<pathgroup> units ns type slack description {Total negative setup slack for a specific path group} dp 0 cmp moreBetter} {metric timing.setup.tns.analysis_view:<view> units ns type slack description {Total negative setup slack for a specific view} dp 0 cmp moreBetter} {metric timing.setup.tns.analysis_view:<view>.path_group:<group> units ns type slack description {Total negative setup slack for a specific view and path group} dp 0 cmp moreBetter} {metric timing.setup.tns.path_group:<group> units ns type slack description {Total negative setup slack for a specific path group} dp 0 cmp moreBetter} {metric timing.setup.wns units ns type slack description {Worst negative setup slack (all path groups)} dp 3 cmp moreBetterBelowTarget target 0} {metric timing.setup.wns.<pathgroup> units ns type slack description {Worst negative setup slack for a specific path group} dp 3 cmp moreBetterBelowTarget target 0} {metric timing.setup.wns.analysis_view:<view> units ns type slack description {Worst negative setup slack for a specific view} dp 3 cmp moreBetterBelowTarget target 0} {metric timing.setup.wns.analysis_view:<view>.path_group:<group> units ns type slack description {Worst negative setup slack for a specific view and path group} dp 3 cmp moreBetterBelowTarget target 0} {metric timing.setup.wns.path_group:<group> units ns type slack description {Worst negative setup slack for a specific path group} dp 3 cmp moreBetterBelowTarget target 0} {metric timing.setup.worst_path.capture_clock description {Capture clock of the worst setup path} dp 0} {metric timing.setup.worst_path.frequency units GHz description {Frequency: 1/(capture period-slack) of the worst setup path} dp 0 cmp moreBetter} {metric timing.setup.worst_path.launch_clock description {Launch clock of the worst setup path} dp 0} {metric timing.setup.worst_path.view description {Analysis view of the worst setup path} dp 0} {metric timing.si.glitches description {Number of SI glitches} dp 0 cmp lessBetter} {metric timing.si.noise units ns description {Amount of noise delay remaining} dp 3 cmp lessBetter}} headers {} metadata {imageplot {b87f93b1-c0d1-4617-851d-bdc5e2d2cc68 {type imageplot id b87f93b1-c0d1-4617-851d-bdc5e2d2cc68 value {boundary { data { G0.0,} fill_color {#FFFFFF} stroke_color {#002794} } ports { data { C0,0,2, C0,0,2, C0,0,2, C0,0,2, C0,0,2, C0,0,2, } fill_color {#CA354D} stroke_color {#CA354D} }}}}} snapshots {{name elaborate uuid 00985047-eb02-4c9e-ad54-0224280e8722 path elaborate branch default key 00985047-eb02-4c9e-ad54-0224280e8722 parent_key {} exclude_time_metric 0 previous {} metrics {{name alerts value {}} {name design.area value 46.513774} {name design.area.always_on value 0} {name design.area.blackbox value 0} {name design.area.buffer value 0} {name design.area.combinatorial value 46.513774} {name design.area.icg value 0} {name design.area.inverter value 0} {name design.area.io value 0} {name design.area.iso_ls value 0} {name design.area.latch value 0} {name design.area.logical value 46.513774} {name design.area.macro value 0} {name design.area.physical value 0} {name design.area.power_switch value 0} {name design.area.register value 0} {name design.area.sequential value 0} {name design.area.std_cell value 46.513774} {name design.density value 0} {name design.floorplan.image metadata {id b87f93b1-c0d1-4617-851d-bdc5e2d2cc68}} {name design.instances value 9} {name design.instances.always_on value 0} {name design.instances.area_io value 0} {name design.instances.blackbox value 0} {name design.instances.buffer value 0} {name design.instances.combinatorial value 5} {name design.instances.icg value 0} {name design.instances.inverter value 0} {name design.instances.io value 0} {name design.instances.iso_ls value 0} {name design.instances.latch value 0} {name design.instances.logical value 9} {name design.instances.macro value 0} {name design.instances.physical value 0} {name design.instances.power_switch value 0} {name design.instances.register value 4} {name design.instances.sequential value 4} {name design.instances.std_cell value 9} {name design.multibit.avg_width value 1.00} {name design.multibit.count value 0} {name design.multibit.coverage value 0.0} {name design.name value lfsr4} {name design.nets.global value 0} {name design.nets.signal value 23} {name design.power_domains value {}} {name flow.cputime value 10} {name flow.cputime.not_child value 10} {name flow.cputime.total value 10} {name flow.cputime.user value 10} {name flow.cputime.user.not_child value 10} {name flow.cputime.user.total value 10} {name flow.log value /home/rg1322/VLSI/VLSI_Lab_1/genus.log5} {name flow.machine value ee-mill1.ee.ic.ac.uk} {name flow.machine.load value 2.66} {name flow.memory value {233 MB} inherited 1} {name flow.memory.instant value {233 MB}} {name flow.memory.resident value {233 MB} inherited 1} {name flow.memory.resident.instant value {233 MB}} {name flow.memory.resident.peak value {267 MB} inherited 1} {name flow.memory.resident.peak.instant value {267 MB}} {name flow.realtime value 34} {name flow.realtime.not_child value 34} {name flow.realtime.total value 34} {name flow.run_directory value /home/rg1322/VLSI/VLSI_Lab_1} {name flow.tool.name value {Genus(TM) Synthesis Solution}} {name flow.tool.name.short value genus} {name flow.tool.version value 18.10-p003_1} {name flow.tool_list value genus-18.10-p003_1 inherited 1} {name flow.user value rg1322} {name messages value {{count 2 id message:TUI/TUI-31 severity Warning short {Obsolete command.}} {count 638 id message:LBR/LBR-436 severity Info short {Could not find an attribute in the library.}} {count 1 id message:LBR/LBR-518 severity Info short {Missing a function attribute in the output pin definition.}} {count 1 id message:LBR/LBR-40 severity Info short {An unsupported construct was detected in this library.}} {count 34 id message:LBR/LBR-9 severity Warning short {Library cell has no output pins defined.}} {count 1 id message:LBR/LBR-41 severity Info short {An output library pin lacks a function attribute.}} {count 1 id message:LBR/LBR-412 severity Info short {Created nominal operating condition.}} {count 1 id message:LBR/LBR-161 severity Info short {Setting the maximum print count of this message to 10 if information_level is less than 9.}} {count 122 id message:LBR/LBR-162 severity Info short {Both 'pos_unate' and 'neg_unate' timing_sense arcs have been processed.}} {count 48 id message:LBR/LBR-155 severity Info short {Mismatch in unateness between 'timing_sense' attribute and the function.}} {count 4 id message:PHYS/PHYS-12 severity Warning short {The variant range of wire parameters is too large.}} {count 1 id message:ELAB/ELAB-1 severity Info short {Elaborating Design.}} {count 1 id message:ELAB/ELAB-3 severity Info short {Done Elaborating Design.}} {count 1 id message:CDFG/CDFG-303 severity Info short {Processing HDL design.}} {count 1 id message:CDFG/CDFG-742 severity Info short {Common subexpression elimination.}} {count 1 id message:CDFG2G/CDFG2G-110 severity Info short {Finished processing module.}}}} {name metric.version value 1 inherited 1} {name metric.version.instant value 1} {name name value elaborate} {name timing.analysis_views.all value {}} {name timing.analysis_views.all.number value 0} {name timing.setup.analysis_views.active value {}} {name timing.setup.analysis_views.active.number value 0} {name timing.setup.analysis_views.enabled value {}} {name timing.setup.analysis_views.enabled.number value 0}} snapshots {} total_cpu 10.0 total_cpu_user 10.0 delta_cpu_not_child 10.0 delta_cpu_user_not_child 10.0 delta_cpu 10.0 delta_cpu_user 10.0 real_start 1759415365 real_end 1759415399 delta_real_not_child 34.0} {name syn_generic uuid 62363e79-18c0-4f27-b4f1-df380bf012ce path syn_generic branch default key 62363e79-18c0-4f27-b4f1-df380bf012ce parent_key {} exclude_time_metric 0 previous 00985047-eb02-4c9e-ad54-0224280e8722 metrics {{name alerts value {design.area.buffer {Buffer area increased by over 20%}}} {name design.area value 34.379746} {name design.area.always_on value 0} {name design.area.blackbox value 0} {name design.area.buffer value 0} {name design.area.combinatorial value 34.379746} {name design.area.icg value 0} {name design.area.inverter value 0} {name design.area.io value 0} {name design.area.iso_ls value 0} {name design.area.latch value 0} {name design.area.logical value 34.379746} {name design.area.macro value 0} {name design.area.physical value 0} {name design.area.power_switch value 0} {name design.area.register value 0} {name design.area.sequential value 0} {name design.area.std_cell value 34.379746} {name design.density value 0} {name design.floorplan.image metadata {id b87f93b1-c0d1-4617-851d-bdc5e2d2cc68}} {name design.instances value 7} {name design.instances.always_on value 0} {name design.instances.area_io value 0} {name design.instances.blackbox value 0} {name design.instances.buffer value 0} {name design.instances.combinatorial value 3} {name design.instances.icg value 0} {name design.instances.inverter value 0} {name design.instances.io value 0} {name design.instances.iso_ls value 0} {name design.instances.latch value 0} {name design.instances.logical value 7} {name design.instances.macro value 0} {name design.instances.physical value 0} {name design.instances.power_switch value 0} {name design.instances.register value 4} {name design.instances.sequential value 4} {name design.instances.std_cell value 7} {name design.multibit.avg_width value 1.00} {name design.multibit.count value 0} {name design.multibit.coverage value 0.0} {name design.name value lfsr4} {name design.nets.global value 0} {name design.nets.signal value 9} {name design.power_domains value {}} {name flow.cputime value 1} {name flow.cputime.not_child value 1} {name flow.cputime.total value 11} {name flow.cputime.user value 1} {name flow.cputime.user.not_child value 1} {name flow.cputime.user.total value 11} {name flow.log value /home/rg1322/VLSI/VLSI_Lab_1/genus.log5} {name flow.machine value ee-mill1.ee.ic.ac.uk} {name flow.machine.load value 2.69} {name flow.memory value {236 MB} inherited 1} {name flow.memory.instant value {236 MB}} {name flow.memory.resident value {236 MB} inherited 1} {name flow.memory.resident.instant value {236 MB}} {name flow.memory.resident.peak value {267 MB} inherited 1} {name flow.memory.resident.peak.instant value {267 MB}} {name flow.realtime value 1} {name flow.realtime.not_child value 1} {name flow.realtime.total value 35} {name flow.run_directory value /home/rg1322/VLSI/VLSI_Lab_1} {name flow.tool.name value {Genus(TM) Synthesis Solution}} {name flow.tool.name.short value genus} {name flow.tool.version value 18.10-p003_1} {name flow.tool_list value genus-18.10-p003_1 inherited 1} {name flow.user value rg1322} {name messages value {{count 24 id message:LBR/LBR-155 severity Info short {Mismatch in unateness between 'timing_sense' attribute and the function.}} {count 1 id message:GLO/GLO-34 severity Info short {Deleting instances not driving any primary outputs.}} {count 1 id message:TIM/TIM-101 severity Warning short {Replacing existing clock definition.}} {count 1 id message:TIM/TIM-304 severity Info short {Replacing an existing timing exception with another.}} {count 1 id message:PHYS/PHYS-752 severity Info short {Partition Based Synthesis execution skipped.}} {count 1 id message:DPOPT/DPOPT-5 severity Info short {Skipping datapath optimization.}} {count 1 id message:DPOPT/DPOPT-6 severity Info short {Pre-processed datapath logic.}} {count 1 id message:SYNTH/SYNTH-2 severity Info short {Done synthesizing.}} {count 1 id message:SYNTH/SYNTH-1 severity Info short Synthesizing.}}} {name metric.version value 1 inherited 1} {name metric.version.instant value 1} {name name value syn_generic} {name timing.analysis_views.all value default_emulate_view} {name timing.analysis_views.all.number value 1} {name timing.setup.analysis_views.active value default_emulate_view} {name timing.setup.analysis_views.active.number value 1} {name timing.setup.analysis_views.enabled value default_emulate_view} {name timing.setup.analysis_views.enabled.number value 1}} snapshots {} total_cpu 11.0 total_cpu_user 11.0 delta_cpu_not_child 1.0 delta_cpu_user_not_child 1.0 delta_cpu 1.0 delta_cpu_user 1.0 real_start 1759415399 real_end 1759415400 delta_real_not_child 1.0} {name syn_map uuid 07b4e6e7-bab0-4732-a672-93050c1aa3f2 path syn_map branch default key 07b4e6e7-bab0-4732-a672-93050c1aa3f2 parent_key {} exclude_time_metric 0 previous 62363e79-18c0-4f27-b4f1-df380bf012ce metrics {{name alerts value {design.area.buffer {Buffer area increased by over 20%}}} {name design.area value 30.52} {name design.area.always_on value 0} {name design.area.blackbox value 0} {name design.area.buffer value 0} {name design.area.combinatorial value 2.8000000000000007} {name design.area.icg value 0} {name design.area.inverter value 0.84} {name design.area.io value 0} {name design.area.iso_ls value 0} {name design.area.latch value 0} {name design.area.logical value 30.52} {name design.area.macro value 0} {name design.area.physical value 0} {name design.area.power_switch value 0} {name design.area.register value 26.88} {name design.area.sequential value 26.88} {name design.area.std_cell value 30.52} {name design.density value 0} {name design.floorplan.image metadata {id b87f93b1-c0d1-4617-851d-bdc5e2d2cc68}} {name design.instances value 6} {name design.instances.always_on value 0} {name design.instances.area_io value 0} {name design.instances.blackbox value 0} {name design.instances.buffer value 0} {name design.instances.combinatorial value 1} {name design.instances.icg value 0} {name design.instances.inverter value 1} {name design.instances.io value 0} {name design.instances.iso_ls value 0} {name design.instances.latch value 0} {name design.instances.logical value 6} {name design.instances.macro value 0} {name design.instances.physical value 0} {name design.instances.power_switch value 0} {name design.instances.register value 4} {name design.instances.sequential value 4} {name design.instances.std_cell value 6} {name design.multibit.avg_width value 1.00} {name design.multibit.count value 0} {name design.multibit.coverage value 0.0} {name design.name value lfsr4} {name design.nets.global value 0} {name design.nets.signal value 8} {name design.power_domains value {}} {name flow.cputime value 1} {name flow.cputime.not_child value 1} {name flow.cputime.total value 12} {name flow.cputime.user value 1} {name flow.cputime.user.not_child value 1} {name flow.cputime.user.total value 12} {name flow.log value /home/rg1322/VLSI/VLSI_Lab_1/genus.log5} {name flow.machine value ee-mill1.ee.ic.ac.uk} {name flow.machine.load value 2.69} {name flow.memory value {237 MB} inherited 1} {name flow.memory.instant value {237 MB}} {name flow.memory.resident value {237 MB} inherited 1} {name flow.memory.resident.instant value {237 MB}} {name flow.memory.resident.peak value {267 MB} inherited 1} {name flow.memory.resident.peak.instant value {267 MB}} {name flow.realtime value 1} {name flow.realtime.not_child value 1} {name flow.realtime.total value 36} {name flow.run_directory value /home/rg1322/VLSI/VLSI_Lab_1} {name flow.tool.name value {Genus(TM) Synthesis Solution}} {name flow.tool.name.short value genus} {name flow.tool.version value 18.10-p003_1} {name flow.tool_list value genus-18.10-p003_1 inherited 1} {name flow.user value rg1322} {name messages value {{count 1 id message:PHYS/PHYS-752 severity Info short {Partition Based Synthesis execution skipped.}} {count 2 id message:PA/PA-7 severity Info short {Resetting power analysis results.}} {count 1 id message:SYNTH/SYNTH-5 severity Info short {Done mapping.}} {count 1 id message:SYNTH/SYNTH-4 severity Info short Mapping.} {count 1 id message:CFM/CFM-1 severity Info short {Wrote dofile.}} {count 1 id message:CFM/CFM-5 severity Info short {Wrote formal verification information.}} {count 1 id message:CFM/CFM-212 severity Info short {Forcing flat compare.}}}} {name metric.version value 1 inherited 1} {name metric.version.instant value 1} {name name value syn_map} {name timing.analysis_views.all value default_emulate_view} {name timing.analysis_views.all.number value 1} {name timing.setup.analysis_views.active value default_emulate_view} {name timing.setup.analysis_views.active.number value 1} {name timing.setup.analysis_views.enabled value default_emulate_view} {name timing.setup.analysis_views.enabled.number value 1}} snapshots {} total_cpu 12.0 total_cpu_user 12.0 delta_cpu_not_child 1.0 delta_cpu_user_not_child 1.0 delta_cpu 1.0 delta_cpu_user 1.0 real_start 1759415400 real_end 1759415401 delta_real_not_child 1.0} {name syn_opt uuid c48825b8-a09c-4287-b734-ddefcc2a9a3a path syn_opt branch default key c48825b8-a09c-4287-b734-ddefcc2a9a3a parent_key {} exclude_time_metric 0 previous 07b4e6e7-bab0-4732-a672-93050c1aa3f2 metrics {{name alerts value {design.area.buffer {Buffer area increased by over 20%}}} {name design.area value 30.52} {name design.area.always_on value 0} {name design.area.blackbox value 0} {name design.area.buffer value 0} {name design.area.combinatorial value 2.8000000000000007} {name design.area.icg value 0} {name design.area.inverter value 0.84} {name design.area.io value 0} {name design.area.iso_ls value 0} {name design.area.latch value 0} {name design.area.logical value 30.52} {name design.area.macro value 0} {name design.area.physical value 0} {name design.area.power_switch value 0} {name design.area.register value 26.88} {name design.area.sequential value 26.88} {name design.area.std_cell value 30.52} {name design.density value 0} {name design.floorplan.image metadata {id b87f93b1-c0d1-4617-851d-bdc5e2d2cc68}} {name design.instances value 6} {name design.instances.always_on value 0} {name design.instances.area_io value 0} {name design.instances.blackbox value 0} {name design.instances.buffer value 0} {name design.instances.combinatorial value 1} {name design.instances.icg value 0} {name design.instances.inverter value 1} {name design.instances.io value 0} {name design.instances.iso_ls value 0} {name design.instances.latch value 0} {name design.instances.logical value 6} {name design.instances.macro value 0} {name design.instances.physical value 0} {name design.instances.power_switch value 0} {name design.instances.register value 4} {name design.instances.sequential value 4} {name design.instances.std_cell value 6} {name design.multibit.avg_width value 1.00} {name design.multibit.count value 0} {name design.multibit.coverage value 0.0} {name design.name value lfsr4} {name design.nets.global value 0} {name design.nets.signal value 8} {name design.power_domains value {}} {name flow.cputime value 0} {name flow.cputime.not_child value 0} {name flow.cputime.total value 12} {name flow.cputime.user value 0} {name flow.cputime.user.not_child value 0} {name flow.cputime.user.total value 12} {name flow.log value /home/rg1322/VLSI/VLSI_Lab_1/genus.log5} {name flow.machine value ee-mill1.ee.ic.ac.uk} {name flow.machine.load value 2.69} {name flow.memory value {240 MB} inherited 1} {name flow.memory.instant value {240 MB}} {name flow.memory.resident value {240 MB} inherited 1} {name flow.memory.resident.instant value {240 MB}} {name flow.memory.resident.peak value {267 MB} inherited 1} {name flow.memory.resident.peak.instant value {267 MB}} {name flow.realtime value 1} {name flow.realtime.not_child value 1} {name flow.realtime.total value 37} {name flow.run_directory value /home/rg1322/VLSI/VLSI_Lab_1} {name flow.tool.name value {Genus(TM) Synthesis Solution}} {name flow.tool.name.short value genus} {name flow.tool.version value 18.10-p003_1} {name flow.tool_list value genus-18.10-p003_1 inherited 1} {name flow.user value rg1322} {name messages value {{count 1 id message:TIM/TIM-11 severity Warning short {Possible timing problems have been detected in this design.}} {count 2 id message:PA/PA-7 severity Info short {Resetting power analysis results.}} {count 1 id message:SYNTH/SYNTH-8 severity Info short {Done incrementally optimizing.}} {count 1 id message:SYNTH/SYNTH-7 severity Info short {Incrementally optimizing.}} {count 1 id message:RPT_DP/RPT_DP-100 severity Warning short {The filename, column and line number information will not be available in the report.}}}} {name metric.version value 1 inherited 1} {name metric.version.instant value 1} {name name value syn_opt} {name timing.analysis_views.all value default_emulate_view} {name timing.analysis_views.all.number value 1} {name timing.setup.analysis_views.active value default_emulate_view} {name timing.setup.analysis_views.active.number value 1} {name timing.setup.analysis_views.enabled value default_emulate_view} {name timing.setup.analysis_views.enabled.number value 1}} snapshots {} total_cpu 12.0 total_cpu_user 12.0 delta_cpu_not_child 0.0 delta_cpu_user_not_child 0.0 delta_cpu 0.0 delta_cpu_user 0.0 real_start 1759415401 real_end 1759415402 delta_real_not_child 1.0}} metrics {{name alerts value {design.area.buffer {Buffer area increased by over 20%}} inherited 1} {name design.area value 30.52 inherited 1} {name design.area.always_on value 0 inherited 1} {name design.area.blackbox value 0 inherited 1} {name design.area.buffer value 0 inherited 1} {name design.area.combinatorial value 2.8000000000000007 inherited 1} {name design.area.icg value 0 inherited 1} {name design.area.inverter value 0.84 inherited 1} {name design.area.io value 0 inherited 1} {name design.area.iso_ls value 0 inherited 1} {name design.area.latch value 0 inherited 1} {name design.area.logical value 30.52 inherited 1} {name design.area.macro value 0 inherited 1} {name design.area.physical value 0 inherited 1} {name design.area.power_switch value 0 inherited 1} {name design.area.register value 26.88 inherited 1} {name design.area.sequential value 26.88 inherited 1} {name design.area.std_cell value 30.52 inherited 1} {name design.density value 0 inherited 1} {name design.floorplan.image metadata {id b87f93b1-c0d1-4617-851d-bdc5e2d2cc68} inherited 1} {name design.instances value 6 inherited 1} {name design.instances.always_on value 0 inherited 1} {name design.instances.area_io value 0 inherited 1} {name design.instances.blackbox value 0 inherited 1} {name design.instances.buffer value 0 inherited 1} {name design.instances.combinatorial value 1 inherited 1} {name design.instances.icg value 0 inherited 1} {name design.instances.inverter value 1 inherited 1} {name design.instances.io value 0 inherited 1} {name design.instances.iso_ls value 0 inherited 1} {name design.instances.latch value 0 inherited 1} {name design.instances.logical value 6 inherited 1} {name design.instances.macro value 0 inherited 1} {name design.instances.physical value 0 inherited 1} {name design.instances.power_switch value 0 inherited 1} {name design.instances.register value 4 inherited 1} {name design.instances.sequential value 4 inherited 1} {name design.instances.std_cell value 6 inherited 1} {name design.multibit.avg_width value 1.00 inherited 1} {name design.multibit.count value 0 inherited 1} {name design.multibit.coverage value 0.0 inherited 1} {name design.name value lfsr4 inherited 1} {name design.nets.global value 0 inherited 1} {name design.nets.signal value 8 inherited 1} {name design.power_domains value {} inherited 1} {name flow.cputime value 12} {name flow.cputime.not_child value 0} {name flow.cputime.total value 12} {name flow.cputime.user value 12} {name flow.cputime.user.not_child value 0} {name flow.cputime.user.total value 12} {name flow.last_child_snapshot value syn_opt inherited 1} {name flow.log value /home/rg1322/VLSI/VLSI_Lab_1/genus.log5 inherited 1} {name flow.machine value ee-mill1.ee.ic.ac.uk inherited 1} {name flow.machine.load value 2.69 inherited 1} {name flow.memory value {240 MB} inherited 1} {name flow.memory.resident value {240 MB} inherited 1} {name flow.memory.resident.peak value {267 MB} inherited 1} {name flow.realtime value 37} {name flow.realtime.not_child value 0} {name flow.realtime.total value 37} {name flow.run_directory value /home/rg1322/VLSI/VLSI_Lab_1 inherited 1} {name flow.tool.name value {Genus(TM) Synthesis Solution} inherited 1} {name flow.tool.name.short value genus inherited 1} {name flow.tool.version value 18.10-p003_1 inherited 1} {name flow.tool_list value genus-18.10-p003_1 inherited 1} {name flow.user value rg1322 inherited 1} {name messages value {{count 2 id message:TUI/TUI-31 severity Warning short {Obsolete command.}} {count 638 id message:LBR/LBR-436 severity Info short {Could not find an attribute in the library.}} {count 1 id message:LBR/LBR-518 severity Info short {Missing a function attribute in the output pin definition.}} {count 1 id message:LBR/LBR-40 severity Info short {An unsupported construct was detected in this library.}} {count 34 id message:LBR/LBR-9 severity Warning short {Library cell has no output pins defined.}} {count 1 id message:LBR/LBR-41 severity Info short {An output library pin lacks a function attribute.}} {count 1 id message:LBR/LBR-412 severity Info short {Created nominal operating condition.}} {count 1 id message:LBR/LBR-161 severity Info short {Setting the maximum print count of this message to 10 if information_level is less than 9.}} {count 122 id message:LBR/LBR-162 severity Info short {Both 'pos_unate' and 'neg_unate' timing_sense arcs have been processed.}} {count 72 id message:LBR/LBR-155 severity Info short {Mismatch in unateness between 'timing_sense' attribute and the function.}} {count 4 id message:PHYS/PHYS-12 severity Warning short {The variant range of wire parameters is too large.}} {count 1 id message:ELAB/ELAB-1 severity Info short {Elaborating Design.}} {count 1 id message:ELAB/ELAB-3 severity Info short {Done Elaborating Design.}} {count 1 id message:CDFG/CDFG-303 severity Info short {Processing HDL design.}} {count 1 id message:CDFG/CDFG-742 severity Info short {Common subexpression elimination.}} {count 1 id message:CDFG2G/CDFG2G-110 severity Info short {Finished processing module.}} {count 1 id message:GLO/GLO-34 severity Info short {Deleting instances not driving any primary outputs.}} {count 1 id message:TIM/TIM-101 severity Warning short {Replacing existing clock definition.}} {count 1 id message:TIM/TIM-304 severity Info short {Replacing an existing timing exception with another.}} {count 2 id message:PHYS/PHYS-752 severity Info short {Partition Based Synthesis execution skipped.}} {count 1 id message:DPOPT/DPOPT-5 severity Info short {Skipping datapath optimization.}} {count 1 id message:DPOPT/DPOPT-6 severity Info short {Pre-processed datapath logic.}} {count 1 id message:SYNTH/SYNTH-2 severity Info short {Done synthesizing.}} {count 1 id message:SYNTH/SYNTH-1 severity Info short Synthesizing.} {count 4 id message:PA/PA-7 severity Info short {Resetting power analysis results.}} {count 1 id message:SYNTH/SYNTH-5 severity Info short {Done mapping.}} {count 1 id message:SYNTH/SYNTH-4 severity Info short Mapping.} {count 1 id message:CFM/CFM-1 severity Info short {Wrote dofile.}} {count 1 id message:CFM/CFM-5 severity Info short {Wrote formal verification information.}} {count 1 id message:CFM/CFM-212 severity Info short {Forcing flat compare.}} {count 1 id message:TIM/TIM-11 severity Warning short {Possible timing problems have been detected in this design.}} {count 1 id message:SYNTH/SYNTH-8 severity Info short {Done incrementally optimizing.}} {count 1 id message:SYNTH/SYNTH-7 severity Info short {Incrementally optimizing.}} {count 1 id message:RPT_DP/RPT_DP-100 severity Warning short {The filename, column and line number information will not be available in the report.}}} inherited 1} {name metric.version value 1 inherited 1} {name name value syn_opt inherited 1} {name timing.analysis_views.all value default_emulate_view inherited 1} {name timing.analysis_views.all.number value 1 inherited 1} {name timing.setup.analysis_views.active value default_emulate_view inherited 1} {name timing.setup.analysis_views.active.number value 1 inherited 1} {name timing.setup.analysis_views.enabled value default_emulate_view inherited 1} {name timing.setup.analysis_views.enabled.number value 1 inherited 1}} aliases {} total_cpu 12.0 total_cpu_user 12.0 total_real 37.0}
set_db -quiet metric_enable true
set_db -quiet library_scaling 2
set_db -quiet lib_allow_functional_cell_footprint false
set_db -quiet case_analysis_consider_constant_clk true
set_db -quiet case_analysis_enabled true
set_db -quiet read_library_with_bus_bundle_opt_ecsm true
set_db -quiet read_compact_ccs_lib true
set_db -quiet on_demand_library_loading false
set_db -quiet debug_library_scaling false
set_db -quiet skip_arcs_reloading false
set_db -quiet lbr_merge_lib_arcs 6
set_db -quiet allow_higher_node_cube_limit 1
set_db -quiet library /usr/local/cadence/kits/tsmc/beLibs/65nm/TSMCHOME/digital/Front_End/timing_power_noise/NLDM/tcbn65lpbwp7t_220a/tcbn65lpbwp7twc.lib
set_db -quiet hdl_unconnected_marking_done true
set_db -quiet dp_tmd_downsizing 0
set_db -quiet boundary_optimize_invert_hier_pins false
set_db -quiet new_closest_event_calculation false
set_db -quiet design_mode_process 90.0
set_db -quiet phys_assume_met_fill 0.0
set_db -quiet map_placed_for_hum false
set_db -quiet phys_use_invs_extraction true
set_db -quiet phys_route_blockage_free false
set_db -quiet phys_route_time_out 120.0
set_db -quiet maximum_interval_of_vias inf
set_db -quiet lef_library /usr/local/cadence/kits/tsmc/beLibs/65nm/TSMCHOME/digital/Back_End/lef/tcbn65lpbwp7t_141a/lef/tcbn65lpbwp7t_9lmT2.lef
set_db -quiet cap_table_file /usr/local/cadence/kits/tsmc/beLibs/65nm/TSMCHOME/digital/Back_End/lef/tcbn65lpbwp7t_141a/techfiles/captable/cln65lp_1p09m+alrdl_top2_rcworst.captable
set_db -quiet interconnect_mode ple
set_db -quiet scale_of_congestion_adjustment 1.01
set_db -quiet runtime_by_stage {{PBS_Generic-Start 0 35 0.0 11.0} {to_generic 0 35 0 11} {first_condense 0 35 0 11} {PBS_Generic_Opt-Post 0 35 -0.001160000000000494 10.99884} {{PBS_Generic-Postgen HBO Optimizations} 0 35 0.0 10.99884} {PBS_TechMap-Start 0 35 0.0 10.99884} {{PBS_TechMap-Premap HBO Optimizations} 0 35 0.0 10.99884} {first_condense 1 36 0 11} {reify 0 36 0 11} {global_incr_map 0 36 0 11} {{PBS_Techmap-Global Mapping} 1 36 0.9974120000000006 11.996252} {{PBS_TechMap-Datapath Postmap Operations} 0 36 0.0 11.996252} {{PBS_TechMap-Postmap HBO Optimizations} 0 36 0.0 11.996252} {{PBS_TechMap-Postmap Clock Gating} 0 36 0.0 11.996252} {{PBS_TechMap-Postmap Cleanup} 0 36 0.0 11.996252} {PBS_Techmap-Post_MBCI 0 36 0.0 11.996252} {incr_opt 1 37 0 12} }
set_db -quiet env_enable_endpoint_adjust true
set_db -quiet env_endpoint_adjust_to_latch true
set_db -quiet timing_disable_multi_threading_modes {incr_tim delay_calc}
set_db -quiet timing_report_enable_novus_header true
set_db -quiet use_area_from_lef true
set_db -quiet dp_characterization {0 0}
set_db -quiet dft_ideal_shift_enable false
set_db -quiet dft_ideal_test_mode false
set_db -quiet use_tiehilo_for_const duplicate
set_db -quiet multibit_seqs_from_different_banks true
set_db -quiet pbs_runtime_by_stage {{PBS_Generic-Start 0.00  0.00 } {PBS_Generic_Opt-Post 0.00  -0.00 } {PBS_Generic-Postgen HBO Optimizations 0.00  0.00 } {PBS_TechMap-Start 0.00  0.00 } {PBS_TechMap-Premap HBO Optimizations 0.00  0.00 } {PBS_Techmap-Global Mapping 1.00  1.00 } {PBS_TechMap-Datapath Postmap Operations 0.00  0.00 } {PBS_TechMap-Postmap HBO Optimizations 0.00  0.00 } {PBS_TechMap-Postmap Clock Gating 0.00  0.00 } {PBS_TechMap-Postmap Cleanup 0.00  0.00 } {PBS_Techmap-Post_MBCI 0.00  0.00 } }
set_db -quiet pbs_map_partition_metrics {{{Number of Partitions:} -809129408} {{Max Partition Size:} 0} {{Number of Secondary Partitions:} 0} {{Max Secondary Partition Size:} 0} {{Focused Internal Logics Ratio:} 0.0} {{Extended Internal Logics Ratio:} 0.0} {{Secondary Partition Logics Ratio:} 0.0} {{Number of Budget Points:} 0} {{Number of Positive Cuts:} 0} {{Number of Negative Cuts:} 0} {{WNS of Partition Boundaries:} 0.0} {{TNS of Partition Boundaries:} 0.0}}
set_db -quiet pbs_iopt_partition_metrics {{{Number of Partitions:} -809129312} {{Max Partition Size:} 0} {{Number of Secondary Partitions:} 0} {{Max Secondary Partition Size:} 0} {{Focused Internal Logics Ratio:} 0.0} {{Extended Internal Logics Ratio:} 0.0} {{Secondary Partition Logics Ratio:} 0.0} {{Number of Budget Points:} 0} {{Number of Positive Cuts:} 0} {{Number of Negative Cuts:} 0} {{WNS of Partition Boundaries:} 0.0} {{TNS of Partition Boundaries:} 0.0}}
set_db -quiet pbs_gen_schedule {{"PARTITION_ID" "PRE_WNS" "PRE_TNS" "PRE_CNT" "PRE_PORT_CNT" "PRE_AREA" "POST_WNS" "POST_TNS" "POST_CNT" "POST_PORT_CNT" "POST_AREA" "G:Read DB" "G:Mux Opto" "G:Generic" "G:Retime" "G:Clk Gate" "G:Const Prop" "G:Gobble" "G:Set Targets" "G:Write DB" "Total Elapsed" "GEN_START_OPT" "GEN_END_OPT" "GEN_START_ASSEMBLE" "GEN_END_ASSEMBLE" } }
set_db -quiet pbs_map_schedule {{"PARTITION_ID" "PRE_WNS" "PRE_TNS" "PRE_CNT" "PRE_PORT_CNT" "PRE_AREA" "POST_WNS" "POST_TNS" "POST_CNT" "POST_PORT_CNT" "POST_AREA" "M:Read DB" "M:Logic Reduce" "M:Partition" "M:Const Prop" "M:Structuring" "M:Virtual Map" "M:Tech Map" "M:Global Incr" "M:TNS(D)" "M:Const Prop(D)" "M:Write DB" "Total Elapsed" "MAP_START_OPT" "MAP_END_OPT" "MAP_START_ASSEMBLE" "MAP_END_ASSEMBLE" } }
set_db -quiet pbs_iopt_schedule {{"PARTITION_ID" "PRE_WNS" "PRE_TNS" "PRE_CNT" "PRE_PORT_CNT" "PRE_AREA" "POST_WNS" "POST_TNS" "POST_CNT" "POST_PORT_CNT" "POST_AREA" "I:DB" "I:WDB" "Total Elapsed" "IOPT_START_OPT" "IOPT_END_OPT" "IOPT_START_ASSEMBLE" "IOPT_END_ASSEMBLE" } }
set_db -quiet pbs_gen_runtime_dist {{"G:Initial" 1} {"G:Pre Cleanup" 0} {"G:Setup" 0} {"G:Launch ST" 0} {"G:Design Partition" 0} {"G:Create Partition Netlists" 0} {"G:Init Power" 0} {"G:Budgeting" 0} {"G:Derive Environment" 0} {"G:Write Partition DB" 0} {"G:Derenv-DB" 0} {"G:Debug Outputs" 0} {"G:ST loading" 0} {"G:Distributed" 0} {"G:Timer" 0} {"G:Assembly" 0} {"G:DFT" 0} {"G:DP Operations" 0} {"G:Const Prop" 0} {"G:Cleanup" 0} {"G:MBCI" 0} {"G:Misc" 0} {"Total Elapsed" 1} }
set_db -quiet pbs_map_runtime_dist {{"M:Initial" 0} {"M:Pre Cleanup" 0} {"M:Setup" 0} {"M:Launch ST" 0} {"M:Design Partition" 0} {"M:Create Partition Netlists" 0} {"M:Init Power" 0} {"M:Budgeting" 0} {"M:Derive Environment" 0} {"M:Write Partition DB" 0} {"M:Derenv-DB" 0} {"M:Debug Outputs" 0} {"M:ST loading" 0} {"M:Distributed" 0} {"M:Timer" 0} {"M:Assembly" 0} {"M:DFT" 0} {"M:DP Operations" 0} {"M:Const Prop" 0} {"M:Cleanup" 0} {"M:MBCI" 0} {"M:Misc" 1} {"Total Elapsed" 1} }
set_db -quiet pbs_iopt_runtime_dist {{"I:Initial" 0} {"I:Pre Cleanup" 0} {"I:Setup" 0} {"I:Launch ST" 0} {"I:Design Partition" 0} {"I:Create Partition Netlists" 0} {"I:Init Power" 0} {"I:Budgeting" 0} {"I:Derive Environment" 0} {"I:Write Partition DB" 0} {"I:Derenv-DB" 0} {"I:Debug Outputs" 0} {"I:ST loading" 0} {"I:Distributed" 0} {"I:Timer" 0} {"I:Assembly" 0} {"I:DFT" 0} {"I:DP Operations" 0} {"I:Const Prop" 0} {"I:Cleanup" 0} {"I:MBCI" 0} {"I:Misc" 0} {"Total Elapsed" 0} }
set_db -quiet pbs_stage_start_elapsed_time 36
set_db -quiet pbs_stage_start_st_time 11
set_db -quiet hdl_show_all_hdl_libraries true
set_db -quiet init_hdl_search_path ./SRC
set_db -quiet hdl_search_path ./SRC
set_db -quiet last_written_sdc_file /home/rg1322/VLSI/VLSI_Lab_1/OUTPUTS/lfsr4_synth.sdc
set_db -quiet last_written_sdf_file /home/rg1322/VLSI/VLSI_Lab_1/OUTPUTS/lfsr4_synth.sdf
set_db -quiet last_written_netlist /home/rg1322/VLSI/VLSI_Lab_1/OUTPUTS/lfsr4_synth.v
set_db -quiet pbs_set_UGM_in_gen true
set_db -quiet phys_stats_cache {lfsr4,final,slk_cg no_value lfsr4,map,runtime_real 29 lfsr4,final,clk_r2o 0 lfsr4,syn_opt,mode_r2r no_value lfsr4,map,pcell 0 lfsr4,final,oflowv no_value lfsr4,final,tot_cell_area 30.52 lfsr4,final,mode_cg no_value lfsr4,final,tns_i2o no_value lfsr4,syn_opt,max_cong no_value lfsr4,syn_opt,clk_r2o 0 lfsr4,map,slk 304.8 lfsr4,final,runtime_real 0 lfsr4,final,clk_r2r 1000.0 lfsr4,slowclk_per 1000.0 lfsr4,map,endpt {{pin:lfsr4/sreg_reg[1]/D} {sreg_reg[1]/D}} lfsr4,map,clk_i2o 0 lfsr4,syn_opt,util 0.0 lfsr4,syn_opt,mode_cg no_value lfsr4,syn_opt,tns_i2o no_value lfsr4,final,tns_i2r no_value lfsr4,syn_opt,clk_r2r 1000.0 lfsr4,map,tot_cong no_value lfsr4,syn_opt,pcell 0 lfsr4,fastclk_name clock:lfsr4/clk lfsr4,map,clk_i2r 0 lfsr4,syn_opt,tns_i2r no_value lfsr4,map,cell 6 lfsr4,final,tot_cong no_value lfsr4,syn_opt,endpt {{pin:lfsr4/sreg_reg[1]/D} {sreg_reg[1]/D}} lfsr4,syn_opt,hidden 0 lfsr4,final,cell 6 lfsr4,final,cell_area 30.52 lfsr4,map,endpt_r2o {no_value no_value} lfsr4,syn_opt,elaptime_cpu 12.0 lfsr4,map,tot_cell 6 lfsr4,map,mode_i2o no_value lfsr4,final,runtime_cpu 1.0 lfsr4,final,slk_r2o no_value lfsr4,map,endpt_r2r {{pin:lfsr4/sreg_reg[1]/D} {sreg_reg[1]/D}} lfsr4,final,tns 0.0 lfsr4,syn_opt,runtime_cpu 0.0 lfsr4,syn_opt,tot_voflow 0 lfsr4,map,mode_i2r no_value lfsr4,final,tot_cell 6 lfsr4,final,mode_i2o no_value lfsr4,syn_opt,slk_r2o no_value lfsr4,final,slk_r2r 304.8 lfsr4,syn_opt,tot_hoflow 0 lfsr4,syn_opt,endpt_r2o {no_value no_value} lfsr4,syn_opt,tns 0.0 lfsr4,map,slk_i2o no_value lfsr4,syn_opt,netlen no_value lfsr4,map,hidden 0 lfsr4,map,endpt_cg {no_value no_value} lfsr4,final,mode_i2r no_value lfsr4,syn_opt,runtime_real 1 lfsr4,syn_opt,slk_r2r 304.8 lfsr4,steps {map syn_opt final} lfsr4,final,clk 1000.0 lfsr4,syn_opt,endpt_r2r {{pin:lfsr4/sreg_reg[1]/D} {sreg_reg[1]/D}} lfsr4,map,slk_i2r no_value lfsr4,final,endpt_cg {no_value no_value} lfsr4,final,endpt_i2o {no_value no_value} lfsr4,final,elaptime_real 31 lfsr4,final,hidden 0 lfsr4,syn_opt,clk 1000.0 lfsr4,final,tns_r2o no_value lfsr4,final,endpt_i2r {no_value no_value} lfsr4,final,net no_value lfsr4,syn_opt,tot_cong no_value lfsr4,map,tot_voflow 0 lfsr4,fastclk_per 1000.0 lfsr4,map,clk_r2o 0 lfsr4,syn_opt,tns_r2o no_value lfsr4,syn_opt,net no_value lfsr4,map,tot_hoflow 0 lfsr4,map,mode no_value lfsr4,final,tns_r2r 0.0 lfsr4,syn_opt,cell 6 lfsr4,map,netlen no_value lfsr4,map,tns_i2o no_value lfsr4,map,mode_cg no_value lfsr4,map,tot_cell_area 30.52 lfsr4,final,tot_voflow 0 lfsr4,map,clk_r2r 1000.0 lfsr4,syn_opt,tns_r2r 0.0 lfsr4,final,tot_hoflow 0 lfsr4,final,mode no_value lfsr4,syn_opt,clk_cg 0 lfsr4,map,tns_i2r no_value lfsr4,final,netlen no_value lfsr4,map,seq_mbci 0.0 lfsr4,final,pcell 0 lfsr4,syn_opt,tot_cell 6 lfsr4,syn_opt,tot_cell_area 30.52 lfsr4,syn_opt,tns_cg no_value lfsr4,syn_opt,mode_i2o no_value lfsr4,map,nvio 0 lfsr4,syn_opt,seq_mbci_bits_per_inst 1.0 lfsr4,syn_opt,oflowh no_value lfsr4,slowclk_name clock:lfsr4/clk lfsr4,final,slk 304.8 lfsr4,final,clk_i2o 0 lfsr4,final,endpt {{pin:lfsr4/sreg_reg[1]/D} {sreg_reg[1]/D}} lfsr4,final,seq_mbci 0.0 lfsr4,syn_opt,mode_i2r no_value lfsr4,map,mode_r2o no_value lfsr4,final,nvio 0 lfsr4,syn_opt,slk 304.8 lfsr4,map,cell_area 30.52 lfsr4,design_name lfsr4 lfsr4,syn_opt,clk_i2o 0 lfsr4,final,clk_i2r 0 lfsr4,syn_opt,endpt_cg {no_value no_value} lfsr4,map,mode_r2r no_value lfsr4,final,mode_r2o no_value lfsr4,syn_opt,avglen no_value lfsr4,map,runtime_cpu 8.0 lfsr4,map,clk_cg 0 lfsr4,syn_opt,clk_i2r 0 lfsr4,map,max_cong no_value lfsr4,map,slk_r2o no_value lfsr4,map,tns 0.0 lfsr4,final,mode_r2r no_value lfsr4,syn_opt,cell_area 30.52 lfsr4,map,util 0.0 lfsr4,map,tns_cg no_value lfsr4,final,clk_cg 0 lfsr4,syn_opt,memory 786.08 lfsr4,map,oflowh no_value lfsr4,map,seq_mbci_bits_per_inst 1.0 lfsr4,map,slk_r2r 304.8 lfsr4,final,max_cong no_value lfsr4,final,endpt_r2o {no_value no_value} lfsr4,syn_opt,slk_cg no_value lfsr4,final,util 0.0 lfsr4,final,tns_cg no_value lfsr4,map,clk 1000.0 lfsr4,final,seq_mbci_bits_per_inst 1.0 lfsr4,final,oflowh no_value lfsr4,syn_opt,mode no_value lfsr4,syn_opt,oflowv no_value analysis {{pqos_vs_oqos pqos oqos}} lfsr4,final,endpt_r2r {{pin:lfsr4/sreg_reg[1]/D} {sreg_reg[1]/D}} lfsr4,map,elaptime_real 30 lfsr4,map,endpt_i2o {no_value no_value} lfsr4,map,avglen no_value lfsr4,final,slk_i2o no_value lfsr4,map,net no_value lfsr4,map,endpt_i2r {no_value no_value} lfsr4,map,tns_r2o no_value lfsr4,map,elaptime_cpu 12.0 lfsr4,final,avglen no_value lfsr4,syn_opt,slk_i2o no_value lfsr4,syn_opt,seq_mbci 0.0 lfsr4,dlta_steps {} lfsr4,map,memory 785.08 lfsr4,final,slk_i2r no_value lfsr4,syn_opt,nvio 0 lfsr4,syn_opt,endpt_i2o {no_value no_value} lfsr4,syn_opt,elaptime_real 31 lfsr4,map,tns_r2r 0.0 lfsr4,map,slk_cg no_value lfsr4,final,elaptime_cpu 13.0 lfsr4,syn_opt,slk_i2r no_value lfsr4,final,memory 787.08 lfsr4,syn_opt,mode_r2o no_value lfsr4,syn_opt,endpt_i2r {no_value no_value} lfsr4,map,oflowv no_value version 1.2}
set_db -quiet phys_tag_tracker final
set_db -quiet phys_tag_list { map syn_opt final}
set_db -quiet phys_eval_file_dir REPORTS/final/
set_db -quiet statistics_csv {setup {time 35 wns {} tns {} fep {} area {} inst {}} syn_generic {time 0 inst 7 area 37.48437 wns {} tns {} fep {}} {} {time 0 inst 6 area 36.291419 wns {} tns {} fep {}} syn_map {time 0 inst 6 area 36.291419 wns {} tns {} fep {}} syn_opt {time 0 inst 6 area 36.291419 wns {} tns {} fep {}}}
set_db -quiet wlec_internal_to_write_lec_db_for_invocation {write_lec {lfsr4 {fvdir fv/lfsr4 current_label fv_map smart_lec false exit_at_end 1 dofile_replace 0 dofile_name fv/lfsr4/rtl_to_fv_map.do logfile_name fv/lfsr4/rtl_to_fv_map.log outdir {} verbose 0 save_session {} checkpoint {} no_dft 0 no_lp 0 sim_lib {} sim_plus_lib 0 env_vars {} pre_read {} pre_design_read {} pre_compare {} pre_exit {} dft_constraint_file {} cw_sim {} golden_cpf {} revised_cpf {} golden_1801 {} revised_1801 {} golden_design rtl revised_design fv/lfsr4/fv_map.v.gz revised_design_legacy {} hier_compare 1 flat_compare 0 no_insert_iso_in_dof 0 lp_ec_flow 0 lp_cpf_flow 0 lp_1801_flow 0 pipeline_comp_exists 0 need_retiming_lec 0 jtag_macro_exists_in_golden 0 cw_comp_list {} pipeline_comps {} vhdl_specified_as_golden {} hdl_param {} share_dp_analysis {} dft_constraints {} top_design_in_rtl lfsr4 top_design_in_lec lfsr4 start_time 1759415401093369 label_list {rtl fv_map} revised_design_normalized /home/rg1322/VLSI/VLSI_Lab_1/fv/lfsr4/fv_map.v.gz imp_label_rev fv_map rtl_top {} auto_analyze true analyze_abort false analyze_setup false cg_declone_hier_compare true name_for_alias_flow original_name alias_flow true add_golden_driver_info true cut_point none add_noblack_box_retime_subdesign true parallel_threads 4 compare_threads 4 hier_comp_threshold 50 low_power_analysis false write_cpf_lp_ec_flow true use_cpf_for_library true stop_after_syn_eqn_mismatch false set_cdn_synth_root false composite_compare true ncprotect_keydb true uniquify true retimed_module_uniquify true use_io_pad true use_constant_function_timing_model true use_lec_model true one_hot_mux false g1_has_iso_inserted false use_extconst false golden_is_rtl 1 golden_cpf_files {} revised_cpf_files {} golden_1801_files {} revised_1801_files {} fvdir_list fv/lfsr4 cw_vhdllib_list {} cw_model_list {} auto_verilog_detect_is_used {} all_clk clk all_test_clk {} pincon_rvz {} pincon_gdn {} rcv_vi_index 1 need_datapath_lec 1 hier_dofile_index 1}}}
set_db -quiet wlec_internal_to_write_lec_db_for_label {write_lec {lfsr4 {fv_map {do_set_vars {{set env(RC_VERSION)     "18.10-p003_1"} {set env(CDN_SYNTH_ROOT) "/usr/local/cadence/GENUS_18.10.000/tools.lnx86"} {set CDN_SYNTH_ROOT      "/usr/local/cadence/GENUS_18.10.000/tools.lnx86"} {set env(CW_DIR) "/usr/local/cadence/GENUS_18.10.000/tools.lnx86/lib/chipware"} {set CW_DIR      "/usr/local/cadence/GENUS_18.10.000/tools.lnx86/lib/chipware"} {set env(NCPROTECT_KEYDB) /usr/local/cadence/INCISIVE_15.20.058/kits/VerificationKit/misc/ip_keys}} do_set_naming {{set_naming_style rc -golden} {set_naming_rule "%s\[%d\]" -instance_array -golden} {set_naming_rule "%s_reg" -register -golden} {set_naming_rule "%L.%s" "%L\[%d\].%s" "%s" -instance -golden} {set_naming_rule "%L.%s" "%L\[%d\].%s" "%s" -variable -golden}} do_set_hdl_options {{# Align LEC's treatment of mismatched port widths with constant} {# connections with Genus's. Genus message CDFG-467 and LEC message} {# HRC3.6 may indicate the presence of this issue. This option is} {# only available with LEC 17.20-d301 or later.} {set lec_version_required "17.20301"} if\ \{\$lec_version\ >=\ \$lec_version_required\}\ \{ {    set_hdl_options -const_port_extend} \} {set_hdl_options -VERILOG_INCLUDE_DIR "incdir:sep:src:cwd"}} do_set_undriven {{set_undriven_signal 0 -golden}} do_set_undefined {{# default is to error out when module definitions are missing} {set_undefined_cell black_box -noascend -both}} do_read_library {{add_search_path . /usr/local/cadence/GENUS_18.10.000/tools.lnx86/lib/tech -library -both} {read_library -liberty -both   /usr/local/cadence/kits/tsmc/beLibs/65nm/TSMCHOME/digital/Front_End/timing_power_noise/NLDM/tcbn65lpbwp7t_220a/tcbn65lpbwp7twc.lib}} do_read_rtl {{delete_search_path -all -design -golden} {add_search_path ./SRC -design -golden} {read_design -enumconstraint  -define SYNTHESIS  -merge bbox -golden -lastmod -noelab -sv09 SRC/lfsr4.sv} {elaborate_design -golden -root {lfsr4} -rootonly }} do_read_design_revised {{read_design -verilog95   -revised -lastmod -noelab fv/lfsr4/fv_map.v.gz} {elaborate_design -revised -root {lfsr4}}} do_uniquify {{uniquify -all -nolib -golden}} do_int_reports {report_design_data report_black_box} do_flatten {{set_flatten_model -seq_constant} {set_flatten_model -seq_constant_x_to 0} {set_flatten_model -nodff_to_dlat_zero} {set_flatten_model -nodff_to_dlat_feedback} {set_flatten_model -hier_seq_merge}} alias_file_name {singlebit {original_name fv/lfsr4/fv_map.singlebit.original_name.alias.json.gz hdl_name fv/lfsr4/fv_map.singlebit.hdl_name.alias.json.gz}} do_alias_mapping {{#add_name_alias fv/lfsr4/fv_map.singlebit.original_name.alias.json.gz -revised} {#set_mapping_method -alias -revised} {#add_renaming_rule r1alias _reg((\\\[%w\\\])*(/U\\\$%d)*)$ @1 -type dff -both}} revised_hier_compare 1 retimed_modules {} unresolved_modules {} partial_sum_outputs_modules {} lock true}}}}
set_db -quiet wlec_internal_to_write_lec_label_data {{calling_function write_lec top_design lfsr4 label rtl fvdir fv/lfsr4 filename N/A filename_absolute N/A} {calling_function write_lec top_design lfsr4 label fv_map fvdir fv/lfsr4 filename fv/lfsr4/fv_map.v.gz filename_absolute /home/rg1322/VLSI/VLSI_Lab_1/fv/lfsr4/fv_map.v.gz}}
#
# non-default attributes to library domains, libraries, cells, pins, and arcs
#
set_db -quiet lib_cell:default_emulate_libset_max/tcbn65lpbwp7twc/BHDBWP7T .dont_use true
set_db -quiet lib_cell:default_emulate_libset_max/tcbn65lpbwp7twc/BHDBWP7T .dont_touch true
set_db -quiet base_cell:BHDBWP7T .dont_use true
set_db -quiet base_cell:BHDBWP7T .dont_touch true
set_db -quiet lib_pin:default_emulate_libset_max/tcbn65lpbwp7twc/CKLHQD1BWP7T/Q .user_function latch_negedge_precontrol
set_db -quiet lib_pin:default_emulate_libset_max/tcbn65lpbwp7twc/CKLHQD2BWP7T/Q .user_function latch_negedge_precontrol
set_db -quiet lib_pin:default_emulate_libset_max/tcbn65lpbwp7twc/CKLHQD4BWP7T/Q .user_function latch_negedge_precontrol
set_db -quiet lib_pin:default_emulate_libset_max/tcbn65lpbwp7twc/CKLHQD6BWP7T/Q .user_function latch_negedge_precontrol
set_db -quiet lib_pin:default_emulate_libset_max/tcbn65lpbwp7twc/CKLHQD8BWP7T/Q .user_function latch_negedge_precontrol
set_db -quiet lib_pin:default_emulate_libset_max/tcbn65lpbwp7twc/CKLNQD1BWP7T/Q .user_function latch_posedge_precontrol
set_db -quiet lib_pin:default_emulate_libset_max/tcbn65lpbwp7twc/CKLNQD2BWP7T/Q .user_function latch_posedge_precontrol
set_db -quiet lib_pin:default_emulate_libset_max/tcbn65lpbwp7twc/CKLNQD4BWP7T/Q .user_function latch_posedge_precontrol
set_db -quiet lib_pin:default_emulate_libset_max/tcbn65lpbwp7twc/CKLNQD6BWP7T/Q .user_function latch_posedge_precontrol
set_db -quiet lib_pin:default_emulate_libset_max/tcbn65lpbwp7twc/CKLNQD8BWP7T/Q .user_function latch_posedge_precontrol
set_db -quiet lib_cell:default_emulate_libset_max/tcbn65lpbwp7twc/GAN2D1BWP7T .dont_use true
set_db -quiet lib_cell:default_emulate_libset_max/tcbn65lpbwp7twc/GAN2D1BWP7T .dont_touch true
set_db -quiet base_cell:GAN2D1BWP7T .dont_use true
set_db -quiet base_cell:GAN2D1BWP7T .dont_touch true
set_db -quiet lib_cell:default_emulate_libset_max/tcbn65lpbwp7twc/GAN2D2BWP7T .dont_use true
set_db -quiet lib_cell:default_emulate_libset_max/tcbn65lpbwp7twc/GAN2D2BWP7T .dont_touch true
set_db -quiet base_cell:GAN2D2BWP7T .dont_use true
set_db -quiet base_cell:GAN2D2BWP7T .dont_touch true
set_db -quiet lib_cell:default_emulate_libset_max/tcbn65lpbwp7twc/GAOI21D1BWP7T .dont_use true
set_db -quiet lib_cell:default_emulate_libset_max/tcbn65lpbwp7twc/GAOI21D1BWP7T .dont_touch true
set_db -quiet base_cell:GAOI21D1BWP7T .dont_use true
set_db -quiet base_cell:GAOI21D1BWP7T .dont_touch true
set_db -quiet lib_cell:default_emulate_libset_max/tcbn65lpbwp7twc/GAOI21D2BWP7T .dont_use true
set_db -quiet lib_cell:default_emulate_libset_max/tcbn65lpbwp7twc/GAOI21D2BWP7T .dont_touch true
set_db -quiet base_cell:GAOI21D2BWP7T .dont_use true
set_db -quiet base_cell:GAOI21D2BWP7T .dont_touch true
set_db -quiet lib_cell:default_emulate_libset_max/tcbn65lpbwp7twc/GAOI22D1BWP7T .dont_use true
set_db -quiet lib_cell:default_emulate_libset_max/tcbn65lpbwp7twc/GAOI22D1BWP7T .dont_touch true
set_db -quiet base_cell:GAOI22D1BWP7T .dont_use true
set_db -quiet base_cell:GAOI22D1BWP7T .dont_touch true
set_db -quiet lib_cell:default_emulate_libset_max/tcbn65lpbwp7twc/GBUFFD1BWP7T .dont_use true
set_db -quiet lib_cell:default_emulate_libset_max/tcbn65lpbwp7twc/GBUFFD1BWP7T .dont_touch true
set_db -quiet base_cell:GBUFFD1BWP7T .dont_use true
set_db -quiet base_cell:GBUFFD1BWP7T .dont_touch true
set_db -quiet lib_cell:default_emulate_libset_max/tcbn65lpbwp7twc/GBUFFD2BWP7T .dont_use true
set_db -quiet lib_cell:default_emulate_libset_max/tcbn65lpbwp7twc/GBUFFD2BWP7T .dont_touch true
set_db -quiet base_cell:GBUFFD2BWP7T .dont_use true
set_db -quiet base_cell:GBUFFD2BWP7T .dont_touch true
set_db -quiet lib_cell:default_emulate_libset_max/tcbn65lpbwp7twc/GBUFFD3BWP7T .dont_use true
set_db -quiet lib_cell:default_emulate_libset_max/tcbn65lpbwp7twc/GBUFFD3BWP7T .dont_touch true
set_db -quiet base_cell:GBUFFD3BWP7T .dont_use true
set_db -quiet base_cell:GBUFFD3BWP7T .dont_touch true
set_db -quiet lib_cell:default_emulate_libset_max/tcbn65lpbwp7twc/GBUFFD8BWP7T .dont_use true
set_db -quiet lib_cell:default_emulate_libset_max/tcbn65lpbwp7twc/GBUFFD8BWP7T .dont_touch true
set_db -quiet base_cell:GBUFFD8BWP7T .dont_use true
set_db -quiet base_cell:GBUFFD8BWP7T .dont_touch true
set_db -quiet lib_cell:default_emulate_libset_max/tcbn65lpbwp7twc/GDCAP10BWP7T .dont_use true
set_db -quiet lib_cell:default_emulate_libset_max/tcbn65lpbwp7twc/GDCAP10BWP7T .dont_touch true
set_db -quiet base_cell:GDCAP10BWP7T .dont_use true
set_db -quiet base_cell:GDCAP10BWP7T .dont_touch true
set_db -quiet lib_cell:default_emulate_libset_max/tcbn65lpbwp7twc/GDCAP2BWP7T .dont_use true
set_db -quiet lib_cell:default_emulate_libset_max/tcbn65lpbwp7twc/GDCAP2BWP7T .dont_touch true
set_db -quiet base_cell:GDCAP2BWP7T .dont_use true
set_db -quiet base_cell:GDCAP2BWP7T .dont_touch true
set_db -quiet lib_cell:default_emulate_libset_max/tcbn65lpbwp7twc/GDCAP3BWP7T .dont_use true
set_db -quiet lib_cell:default_emulate_libset_max/tcbn65lpbwp7twc/GDCAP3BWP7T .dont_touch true
set_db -quiet base_cell:GDCAP3BWP7T .dont_use true
set_db -quiet base_cell:GDCAP3BWP7T .dont_touch true
set_db -quiet lib_cell:default_emulate_libset_max/tcbn65lpbwp7twc/GDCAP4BWP7T .dont_use true
set_db -quiet lib_cell:default_emulate_libset_max/tcbn65lpbwp7twc/GDCAP4BWP7T .dont_touch true
set_db -quiet base_cell:GDCAP4BWP7T .dont_use true
set_db -quiet base_cell:GDCAP4BWP7T .dont_touch true
set_db -quiet lib_cell:default_emulate_libset_max/tcbn65lpbwp7twc/GDCAPBWP7T .dont_use true
set_db -quiet lib_cell:default_emulate_libset_max/tcbn65lpbwp7twc/GDCAPBWP7T .dont_touch true
set_db -quiet base_cell:GDCAPBWP7T .dont_use true
set_db -quiet base_cell:GDCAPBWP7T .dont_touch true
set_db -quiet lib_cell:default_emulate_libset_max/tcbn65lpbwp7twc/GDFCNQD1BWP7T .dont_use true
set_db -quiet lib_cell:default_emulate_libset_max/tcbn65lpbwp7twc/GDFCNQD1BWP7T .dont_touch true
set_db -quiet base_cell:GDFCNQD1BWP7T .dont_use true
set_db -quiet base_cell:GDFCNQD1BWP7T .dont_touch true
set_db -quiet lib_cell:default_emulate_libset_max/tcbn65lpbwp7twc/GDFQD1BWP7T .dont_use true
set_db -quiet lib_cell:default_emulate_libset_max/tcbn65lpbwp7twc/GDFQD1BWP7T .dont_touch true
set_db -quiet base_cell:GDFQD1BWP7T .dont_use true
set_db -quiet base_cell:GDFQD1BWP7T .dont_touch true
set_db -quiet lib_cell:default_emulate_libset_max/tcbn65lpbwp7twc/GFILL10BWP7T .dont_use true
set_db -quiet lib_cell:default_emulate_libset_max/tcbn65lpbwp7twc/GFILL10BWP7T .dont_touch true
set_db -quiet base_cell:GFILL10BWP7T .dont_use true
set_db -quiet base_cell:GFILL10BWP7T .dont_touch true
set_db -quiet lib_cell:default_emulate_libset_max/tcbn65lpbwp7twc/GFILL2BWP7T .dont_use true
set_db -quiet lib_cell:default_emulate_libset_max/tcbn65lpbwp7twc/GFILL2BWP7T .dont_touch true
set_db -quiet base_cell:GFILL2BWP7T .dont_use true
set_db -quiet base_cell:GFILL2BWP7T .dont_touch true
set_db -quiet lib_cell:default_emulate_libset_max/tcbn65lpbwp7twc/GFILL3BWP7T .dont_use true
set_db -quiet lib_cell:default_emulate_libset_max/tcbn65lpbwp7twc/GFILL3BWP7T .dont_touch true
set_db -quiet base_cell:GFILL3BWP7T .dont_use true
set_db -quiet base_cell:GFILL3BWP7T .dont_touch true
set_db -quiet lib_cell:default_emulate_libset_max/tcbn65lpbwp7twc/GFILL4BWP7T .dont_use true
set_db -quiet lib_cell:default_emulate_libset_max/tcbn65lpbwp7twc/GFILL4BWP7T .dont_touch true
set_db -quiet base_cell:GFILL4BWP7T .dont_use true
set_db -quiet base_cell:GFILL4BWP7T .dont_touch true
set_db -quiet lib_cell:default_emulate_libset_max/tcbn65lpbwp7twc/GFILLBWP7T .dont_use true
set_db -quiet lib_cell:default_emulate_libset_max/tcbn65lpbwp7twc/GFILLBWP7T .dont_touch true
set_db -quiet base_cell:GFILLBWP7T .dont_use true
set_db -quiet base_cell:GFILLBWP7T .dont_touch true
set_db -quiet lib_cell:default_emulate_libset_max/tcbn65lpbwp7twc/GINVD1BWP7T .dont_use true
set_db -quiet lib_cell:default_emulate_libset_max/tcbn65lpbwp7twc/GINVD1BWP7T .dont_touch true
set_db -quiet base_cell:GINVD1BWP7T .dont_use true
set_db -quiet base_cell:GINVD1BWP7T .dont_touch true
set_db -quiet lib_cell:default_emulate_libset_max/tcbn65lpbwp7twc/GINVD2BWP7T .dont_use true
set_db -quiet lib_cell:default_emulate_libset_max/tcbn65lpbwp7twc/GINVD2BWP7T .dont_touch true
set_db -quiet base_cell:GINVD2BWP7T .dont_use true
set_db -quiet base_cell:GINVD2BWP7T .dont_touch true
set_db -quiet lib_cell:default_emulate_libset_max/tcbn65lpbwp7twc/GINVD3BWP7T .dont_use true
set_db -quiet lib_cell:default_emulate_libset_max/tcbn65lpbwp7twc/GINVD3BWP7T .dont_touch true
set_db -quiet base_cell:GINVD3BWP7T .dont_use true
set_db -quiet base_cell:GINVD3BWP7T .dont_touch true
set_db -quiet lib_cell:default_emulate_libset_max/tcbn65lpbwp7twc/GINVD8BWP7T .dont_use true
set_db -quiet lib_cell:default_emulate_libset_max/tcbn65lpbwp7twc/GINVD8BWP7T .dont_touch true
set_db -quiet base_cell:GINVD8BWP7T .dont_use true
set_db -quiet base_cell:GINVD8BWP7T .dont_touch true
set_db -quiet lib_cell:default_emulate_libset_max/tcbn65lpbwp7twc/GMUX2D1BWP7T .dont_use true
set_db -quiet lib_cell:default_emulate_libset_max/tcbn65lpbwp7twc/GMUX2D1BWP7T .dont_touch true
set_db -quiet base_cell:GMUX2D1BWP7T .dont_use true
set_db -quiet base_cell:GMUX2D1BWP7T .dont_touch true
set_db -quiet lib_cell:default_emulate_libset_max/tcbn65lpbwp7twc/GMUX2D2BWP7T .dont_use true
set_db -quiet lib_cell:default_emulate_libset_max/tcbn65lpbwp7twc/GMUX2D2BWP7T .dont_touch true
set_db -quiet base_cell:GMUX2D2BWP7T .dont_use true
set_db -quiet base_cell:GMUX2D2BWP7T .dont_touch true
set_db -quiet lib_cell:default_emulate_libset_max/tcbn65lpbwp7twc/GMUX2ND1BWP7T .dont_use true
set_db -quiet lib_cell:default_emulate_libset_max/tcbn65lpbwp7twc/GMUX2ND1BWP7T .dont_touch true
set_db -quiet base_cell:GMUX2ND1BWP7T .dont_use true
set_db -quiet base_cell:GMUX2ND1BWP7T .dont_touch true
set_db -quiet lib_cell:default_emulate_libset_max/tcbn65lpbwp7twc/GMUX2ND2BWP7T .dont_use true
set_db -quiet lib_cell:default_emulate_libset_max/tcbn65lpbwp7twc/GMUX2ND2BWP7T .dont_touch true
set_db -quiet base_cell:GMUX2ND2BWP7T .dont_use true
set_db -quiet base_cell:GMUX2ND2BWP7T .dont_touch true
set_db -quiet lib_cell:default_emulate_libset_max/tcbn65lpbwp7twc/GND2D1BWP7T .dont_use true
set_db -quiet lib_cell:default_emulate_libset_max/tcbn65lpbwp7twc/GND2D1BWP7T .dont_touch true
set_db -quiet base_cell:GND2D1BWP7T .dont_use true
set_db -quiet base_cell:GND2D1BWP7T .dont_touch true
set_db -quiet lib_cell:default_emulate_libset_max/tcbn65lpbwp7twc/GND2D2BWP7T .dont_use true
set_db -quiet lib_cell:default_emulate_libset_max/tcbn65lpbwp7twc/GND2D2BWP7T .dont_touch true
set_db -quiet base_cell:GND2D2BWP7T .dont_use true
set_db -quiet base_cell:GND2D2BWP7T .dont_touch true
set_db -quiet lib_cell:default_emulate_libset_max/tcbn65lpbwp7twc/GND2D3BWP7T .dont_use true
set_db -quiet lib_cell:default_emulate_libset_max/tcbn65lpbwp7twc/GND2D3BWP7T .dont_touch true
set_db -quiet base_cell:GND2D3BWP7T .dont_use true
set_db -quiet base_cell:GND2D3BWP7T .dont_touch true
set_db -quiet lib_cell:default_emulate_libset_max/tcbn65lpbwp7twc/GND3D1BWP7T .dont_use true
set_db -quiet lib_cell:default_emulate_libset_max/tcbn65lpbwp7twc/GND3D1BWP7T .dont_touch true
set_db -quiet base_cell:GND3D1BWP7T .dont_use true
set_db -quiet base_cell:GND3D1BWP7T .dont_touch true
set_db -quiet lib_cell:default_emulate_libset_max/tcbn65lpbwp7twc/GND3D2BWP7T .dont_use true
set_db -quiet lib_cell:default_emulate_libset_max/tcbn65lpbwp7twc/GND3D2BWP7T .dont_touch true
set_db -quiet base_cell:GND3D2BWP7T .dont_use true
set_db -quiet base_cell:GND3D2BWP7T .dont_touch true
set_db -quiet lib_cell:default_emulate_libset_max/tcbn65lpbwp7twc/GNR2D1BWP7T .dont_use true
set_db -quiet lib_cell:default_emulate_libset_max/tcbn65lpbwp7twc/GNR2D1BWP7T .dont_touch true
set_db -quiet base_cell:GNR2D1BWP7T .dont_use true
set_db -quiet base_cell:GNR2D1BWP7T .dont_touch true
set_db -quiet lib_cell:default_emulate_libset_max/tcbn65lpbwp7twc/GNR2D2BWP7T .dont_use true
set_db -quiet lib_cell:default_emulate_libset_max/tcbn65lpbwp7twc/GNR2D2BWP7T .dont_touch true
set_db -quiet base_cell:GNR2D2BWP7T .dont_use true
set_db -quiet base_cell:GNR2D2BWP7T .dont_touch true
set_db -quiet lib_cell:default_emulate_libset_max/tcbn65lpbwp7twc/GNR3D1BWP7T .dont_use true
set_db -quiet lib_cell:default_emulate_libset_max/tcbn65lpbwp7twc/GNR3D1BWP7T .dont_touch true
set_db -quiet base_cell:GNR3D1BWP7T .dont_use true
set_db -quiet base_cell:GNR3D1BWP7T .dont_touch true
set_db -quiet lib_cell:default_emulate_libset_max/tcbn65lpbwp7twc/GNR3D2BWP7T .dont_use true
set_db -quiet lib_cell:default_emulate_libset_max/tcbn65lpbwp7twc/GNR3D2BWP7T .dont_touch true
set_db -quiet base_cell:GNR3D2BWP7T .dont_use true
set_db -quiet base_cell:GNR3D2BWP7T .dont_touch true
set_db -quiet lib_cell:default_emulate_libset_max/tcbn65lpbwp7twc/GOAI21D1BWP7T .dont_use true
set_db -quiet lib_cell:default_emulate_libset_max/tcbn65lpbwp7twc/GOAI21D1BWP7T .dont_touch true
set_db -quiet base_cell:GOAI21D1BWP7T .dont_use true
set_db -quiet base_cell:GOAI21D1BWP7T .dont_touch true
set_db -quiet lib_cell:default_emulate_libset_max/tcbn65lpbwp7twc/GOAI21D2BWP7T .dont_use true
set_db -quiet lib_cell:default_emulate_libset_max/tcbn65lpbwp7twc/GOAI21D2BWP7T .dont_touch true
set_db -quiet base_cell:GOAI21D2BWP7T .dont_use true
set_db -quiet base_cell:GOAI21D2BWP7T .dont_touch true
set_db -quiet lib_cell:default_emulate_libset_max/tcbn65lpbwp7twc/GOR2D1BWP7T .dont_use true
set_db -quiet lib_cell:default_emulate_libset_max/tcbn65lpbwp7twc/GOR2D1BWP7T .dont_touch true
set_db -quiet base_cell:GOR2D1BWP7T .dont_use true
set_db -quiet base_cell:GOR2D1BWP7T .dont_touch true
set_db -quiet lib_cell:default_emulate_libset_max/tcbn65lpbwp7twc/GOR2D2BWP7T .dont_use true
set_db -quiet lib_cell:default_emulate_libset_max/tcbn65lpbwp7twc/GOR2D2BWP7T .dont_touch true
set_db -quiet base_cell:GOR2D2BWP7T .dont_use true
set_db -quiet base_cell:GOR2D2BWP7T .dont_touch true
set_db -quiet lib_cell:default_emulate_libset_max/tcbn65lpbwp7twc/GSDFCNQD1BWP7T .dont_use true
set_db -quiet lib_cell:default_emulate_libset_max/tcbn65lpbwp7twc/GSDFCNQD1BWP7T .dont_touch true
set_db -quiet base_cell:GSDFCNQD1BWP7T .dont_use true
set_db -quiet base_cell:GSDFCNQD1BWP7T .dont_touch true
set_db -quiet lib_cell:default_emulate_libset_max/tcbn65lpbwp7twc/GTIEHBWP7T .dont_use true
set_db -quiet lib_cell:default_emulate_libset_max/tcbn65lpbwp7twc/GTIEHBWP7T .dont_touch true
set_db -quiet base_cell:GTIEHBWP7T .dont_use true
set_db -quiet base_cell:GTIEHBWP7T .dont_touch true
set_db -quiet lib_cell:default_emulate_libset_max/tcbn65lpbwp7twc/GTIELBWP7T .dont_use true
set_db -quiet lib_cell:default_emulate_libset_max/tcbn65lpbwp7twc/GTIELBWP7T .dont_touch true
set_db -quiet base_cell:GTIELBWP7T .dont_use true
set_db -quiet base_cell:GTIELBWP7T .dont_touch true
set_db -quiet lib_cell:default_emulate_libset_max/tcbn65lpbwp7twc/GXNR2D1BWP7T .dont_use true
set_db -quiet lib_cell:default_emulate_libset_max/tcbn65lpbwp7twc/GXNR2D1BWP7T .dont_touch true
set_db -quiet base_cell:GXNR2D1BWP7T .dont_use true
set_db -quiet base_cell:GXNR2D1BWP7T .dont_touch true
set_db -quiet lib_cell:default_emulate_libset_max/tcbn65lpbwp7twc/GXNR2D2BWP7T .dont_use true
set_db -quiet lib_cell:default_emulate_libset_max/tcbn65lpbwp7twc/GXNR2D2BWP7T .dont_touch true
set_db -quiet base_cell:GXNR2D2BWP7T .dont_use true
set_db -quiet base_cell:GXNR2D2BWP7T .dont_touch true
set_db -quiet lib_cell:default_emulate_libset_max/tcbn65lpbwp7twc/GXOR2D1BWP7T .dont_use true
set_db -quiet lib_cell:default_emulate_libset_max/tcbn65lpbwp7twc/GXOR2D1BWP7T .dont_touch true
set_db -quiet base_cell:GXOR2D1BWP7T .dont_use true
set_db -quiet base_cell:GXOR2D1BWP7T .dont_touch true
set_db -quiet lib_cell:default_emulate_libset_max/tcbn65lpbwp7twc/GXOR2D2BWP7T .dont_use true
set_db -quiet lib_cell:default_emulate_libset_max/tcbn65lpbwp7twc/GXOR2D2BWP7T .dont_touch true
set_db -quiet base_cell:GXOR2D2BWP7T .dont_use true
set_db -quiet base_cell:GXOR2D2BWP7T .dont_touch true
set_db -quiet wireload:default_emulate_libset_max/tcbn65lpbwp7twc/TSMC512K_Lowk_Aggresive .fanout_cap {{1 0.6000} {2 2.8000} {3 5.0000} {4 7.3000} {5 9.9000} {6 12.6000} {7 14.8000} {8 17.3000} {9 19.5000} {10 20.5000}}
set_db -quiet wireload:default_emulate_libset_max/tcbn65lpbwp7twc/TSMC256K_Lowk_Aggresive .fanout_cap {{1 0.6000} {2 2.0000} {3 3.5000} {4 5.0000} {5 6.8000} {6 8.6000} {7 10.1000} {8 11.8000} {9 13.3000} {10 13.4000}}
set_db -quiet wireload:default_emulate_libset_max/tcbn65lpbwp7twc/TSMC128K_Lowk_Aggresive .fanout_cap {{1 0.6000} {2 1.6000} {3 2.8000} {4 4.0000} {5 5.2000} {6 6.6000} {7 7.7000} {8 9.0000} {9 10.1000} {10 10.2000}}
set_db -quiet wireload:default_emulate_libset_max/tcbn65lpbwp7twc/TSMC64K_Lowk_Aggresive .fanout_cap {{1 0.6000} {2 1.5000} {3 2.5000} {4 3.4000} {5 4.6000} {6 5.7000} {7 6.7000} {8 7.8000} {9 8.8000} {10 8.9000}}
set_db -quiet wireload:default_emulate_libset_max/tcbn65lpbwp7twc/TSMC32K_Lowk_Aggresive .fanout_cap {{1 0.6000} {2 1.4000} {3 2.2000} {4 3.1000} {5 4.2000} {6 5.1000} {7 6.1000} {8 7.1000} {9 8.0000} {10 8.1000}}
set_db -quiet wireload:default_emulate_libset_max/tcbn65lpbwp7twc/TSMC16K_Lowk_Aggresive .fanout_cap {{1 0.6000} {2 1.3000} {3 2.1000} {4 2.9000} {5 3.9000} {6 4.9000} {7 5.8000} {8 6.7000} {9 7.5000} {10 7.6000}}
set_db -quiet wireload:default_emulate_libset_max/tcbn65lpbwp7twc/TSMC8K_Lowk_Aggresive .fanout_cap {{1 0.6000} {2 1.3000} {3 2.1000} {4 2.9000} {5 3.8000} {6 4.7000} {7 5.5000} {8 6.4000} {9 7.2000} {10 7.3000}}
set_db -quiet wireload:default_emulate_libset_max/tcbn65lpbwp7twc/TSMC512K_Lowk_Conservative .fanout_cap {{1 1.3000} {2 6.8000} {3 12.2000} {4 17.7000} {5 24.1000} {6 30.5000} {7 35.9000} {8 42.0000} {9 47.5000} {10 47.8000}}
set_db -quiet wireload:default_emulate_libset_max/tcbn65lpbwp7twc/TSMC256K_Lowk_Conservative .fanout_cap {{1 1.2000} {2 4.3000} {3 7.5000} {4 10.7000} {5 14.5000} {6 18.4000} {7 21.6000} {8 25.2000} {9 28.4000} {10 28.6000}}
set_db -quiet wireload:default_emulate_libset_max/tcbn65lpbwp7twc/TSMC128K_Lowk_Conservative .fanout_cap {{1 1.2000} {2 3.1000} {3 5.2000} {4 7.3000} {5 9.8000} {6 12.3000} {7 14.4000} {8 16.7000} {9 18.8000} {10 18.9000}}
set_db -quiet wireload:default_emulate_libset_max/tcbn65lpbwp7twc/TSMC64K_Lowk_Conservative .fanout_cap {{1 1.1000} {2 2.6000} {3 4.1000} {4 5.7000} {5 7.7000} {6 9.6000} {7 11.3000} {8 13.0000} {9 14.7000} {10 14.8000}}
set_db -quiet wireload:default_emulate_libset_max/tcbn65lpbwp7twc/TSMC32K_Lowk_Conservative .fanout_cap {{1 1.1000} {2 2.2000} {3 3.5000} {4 4.8000} {5 6.4000} {6 7.9000} {7 9.3000} {8 10.8000} {9 12.1000} {10 12.2000}}
set_db -quiet wireload:default_emulate_libset_max/tcbn65lpbwp7twc/TSMC16K_Lowk_Conservative .fanout_cap {{1 1.1000} {2 2.0000} {3 3.1000} {4 4.3000} {5 5.7000} {6 7.0000} {7 8.2000} {8 9.5000} {9 10.7000} {10 10.8000}}
set_db -quiet wireload:default_emulate_libset_max/tcbn65lpbwp7twc/TSMC8K_Lowk_Conservative .fanout_cap {{1 1.1000} {2 1.9000} {3 2.9000} {4 4.0000} {5 5.3000} {6 6.6000} {7 7.6000} {8 8.8000} {9 9.9000} {10 10.0000}}
set_db -quiet wireload:default_emulate_libset_max/tcbn65lpbwp7twc/ZeroWireload .fanout_cap {{1 0.0000} {2 0.0000} {3 0.0000} {4 0.0000} {5 0.0000} {6 0.0000} {7 0.0000} {8 0.0000} {9 0.0000} {10 0.0000} {11 0.0000} {12 0.0000} {13 0.0000} {14 0.0000} {15 0.0000} {16 0.0000} {17 0.0000} {18 0.0000} {19 0.0000} {20 0.0000}}
set_db -quiet continue_on_error $::_continue_on_error
unset ::_continue_on_error
#
# DO NOT DELETE. The following lines contain the database.
#
read_db -from_tcl {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\
tecA}
