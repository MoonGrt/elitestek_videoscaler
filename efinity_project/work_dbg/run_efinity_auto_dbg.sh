python.exe  -m "efx_dbg.DbgWizard" --device  "Ti60F225" --family  "Titanium" --in_profile_name  "F:/Project/yls/Project5/simplify_full_led_fill++_vs1/debug_profile.wizard.json" --out_dbg_vdb  "debug_top.post.vdb" --out_profile_name  "F:/Project/yls/Project5/simplify_full_led_fill++_vs1/debug_profile.wizard.json" --out_dir  "work_dbg"
efx_map  --mode "speed" --max_ram "-1" --max_mult "-1" --infer-clk-enable "3" --infer-sync-set-reset "1" --fanout-limit "0" --seq_opt "0" --retiming "1" --dsp-mac-packing "1" --dsp-input-regs-packing "1" --dsp-output-regs-packing "1" --bram_output_regs_packing "1" --blast_const_operand_adders "1" --operator-sharing "0" --optimize-adder-tree "0" --pack-luts-to-comb4 "0" --min-sr-fanout "0" --seq-opt-sync-only "0" --blackbox-error "1" --allow-const-ram-index "0" --hdl-compile-unit "1" --create-onehot-fsms "0" --min-ce-fanout "0" --mult-decomp-retime "0" --optimize-zero-init-rom "1" --insert-carry-skip "0" --I "F:/Project/yls/Project5/simplify_full_led_fill++_vs1" --I "F:/Project/yls/Project5/simplify_full_led_fill++_vs1/ip/efx_ddr3_axi_1" --I "F:/Project/yls/Project5/simplify_full_led_fill++_vs1/ip/fifo_efinity" --family "Titanium" --device "Ti60F225" --keep-gclk-in-module "1" --root "edb_top" --v "F:/Project/yls/Project5/simplify_full_led_fill++_vs1/work_dbg/debug_top.v" --write-postmap-module "F:/Project/yls/Project5/simplify_full_led_fill++_vs1/work_dbg/debug_top.post.vdb" --generate_sig_profile "false" --work-dir "F:/Project/yls/Project5/simplify_full_led_fill++_vs1/work_dbg" --output-dir "F:/Project/yls/Project5/simplify_full_led_fill++_vs1/outflow"
efx_map  --family "Titanium" --device "Ti60F225" --mode "speed" --max_ram "-1" --max_mult "-1" --infer-clk-enable "3" --infer-sync-set-reset "1" --fanout-limit "0" --seq_opt "0" --retiming "1" --dsp-mac-packing "1" --dsp-input-regs-packing "1" --dsp-output-regs-packing "1" --bram_output_regs_packing "1" --blast_const_operand_adders "1" --operator-sharing "0" --optimize-adder-tree "0" --pack-luts-to-comb4 "0" --min-sr-fanout "0" --seq-opt-sync-only "0" --blackbox-error "1" --allow-const-ram-index "0" --hdl-compile-unit "1" --create-onehot-fsms "0" --min-ce-fanout "0" --mult-decomp-retime "0" --optimize-zero-init-rom "1" --insert-carry-skip "0" --I "F:/Project/yls/Project5/simplify_full_led_fill++_vs1" --I "F:/Project/yls/Project5/simplify_full_led_fill++_vs1/ip/efx_ddr3_axi_1" --I "F:/Project/yls/Project5/simplify_full_led_fill++_vs1/ip/fifo_efinity" --root "example_top" --vdb "F:/Project/yls/Project5/simplify_full_led_fill++_vs1/outflow/DDR3_MC.elab.vdb" --vdb "F:/Project/yls/Project5/simplify_full_led_fill++_vs1/work_dbg/debug_top.post.vdb" --write-efx-verilog "F:/Project/yls/Project5/simplify_full_led_fill++_vs1/work_dbg/DDR3_MC.dbg.map.v" --binary-db "F:/Project/yls/Project5/simplify_full_led_fill++_vs1/work_dbg/DDR3_MC.dbg.vdb" --merge_vdbs=1 --conn "F:/Project/yls/Project5/simplify_full_led_fill++_vs1/debug_profile.wizard.json" --generate_sig_profile "false" --work-dir "F:/Project/yls/Project5/simplify_full_led_fill++_vs1/work_dbg" --output-dir "F:/Project/yls/Project5/simplify_full_led_fill++_vs1/outflow"
python.exe  "S:/DevTools/Efinity/scripts/efx_pt_jtag_util.py" --device "Ti60F225" --project "DDR3_MC" --design_file "F:/Project/yls/Project5/simplify_full_led_fill++_vs1/DDR3_MC.peri.xml" --action "add" --jtag_user "JTAG_USER2" --output "F:/Project/yls/Project5/simplify_full_led_fill++_vs1/DDR3_MC.dbg.peri.xml"
python 
