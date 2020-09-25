onerror {quit -code 1}
source "/home/borg/Documents/Insper/3Sem/20b-ele-av1/vunit_out/test_output/lib.tb_q1.all_7002e7522f84b5a0acaeaa53335eb5a4635076a2/modelsim/common.do"
set failed [vunit_load]
if {$failed} {quit -code 1}
set failed [vunit_run]
if {$failed} {quit -code 1}
quit -code 0
