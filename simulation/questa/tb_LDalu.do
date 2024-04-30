onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -radix unsigned -radixshowbase 0 /tb_LDalu/tb_test_case
add wave -noupdate -color Yellow -radix binary -radixshowbase 0 /tb_LDalu/tb_clk
add wave -noupdate -color {Dark Orchid} -radix binary -radixshowbase 0 /tb_LDalu/op
add wave -noupdate -color Cyan -radix binary -radixshowbase 0 /tb_LDalu/A
add wave -noupdate -color Cyan -radix binary -radixshowbase 0 /tb_LDalu/B
add wave -noupdate -color Navy -radix binary -radixshowbase 0 -subitemconfig {{/tb_LDalu/R[11]} {-color Navy} {/tb_LDalu/R[10]} {-color Navy} {/tb_LDalu/R[9]} {-color Navy} {/tb_LDalu/R[8]} {-color Navy} {/tb_LDalu/R[7]} {-color Navy} {/tb_LDalu/R[6]} {-color Navy} {/tb_LDalu/R[5]} {-color Navy} {/tb_LDalu/R[4]} {-color Navy} {/tb_LDalu/R[3]} {-color Navy} {/tb_LDalu/R[2]} {-color Navy} {/tb_LDalu/R[1]} {-color Navy} {/tb_LDalu/R[0]} {-color Navy}} /tb_LDalu/R
add wave -noupdate -color {Steel Blue} -radix binary -radixshowbase 0 /tb_LDalu/expected_R
TreeUpdate [SetDefaultTree]
quietly wave cursor active 1
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {0 ps} {30 ps}
run 30ps
