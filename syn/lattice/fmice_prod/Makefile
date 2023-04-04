BUILD_DIR=build
JT51_DIR=../../../hdl

all: $(BUILD_DIR)/top.bin

pins = hdl/pins.pcf

files = \
	hdl/top.v\
	hdl/dacif.v\
	\
	hdl/jt51_exprom.v\
	hdl/jt51_phrom.v\
	\
	$(JT51_DIR)/jt51.v\
	$(JT51_DIR)/jt51_acc.v\
	$(JT51_DIR)/jt51_csr_ch.v\
	$(JT51_DIR)/jt51_csr_op.v\
	$(JT51_DIR)/jt51_eg.v\
	$(JT51_DIR)/jt51_exp2lin.v\
	$(JT51_DIR)/jt51_kon.v\
	$(JT51_DIR)/jt51_lfo.v\
	$(JT51_DIR)/jt51_lin2exp.v\
	$(JT51_DIR)/jt51_mmr.v\
	$(JT51_DIR)/jt51_mod.v\
	$(JT51_DIR)/jt51_noise_lfsr.v\
	$(JT51_DIR)/jt51_noise.v\
	$(JT51_DIR)/jt51_op.v\
	$(JT51_DIR)/jt51_pg.v\
	$(JT51_DIR)/jt51_phinc_rom.v\
	$(JT51_DIR)/jt51_pm.v\
	$(JT51_DIR)/jt51_reg.v\
	$(JT51_DIR)/jt51_sh.v\
	$(JT51_DIR)/jt51_timers.v

$(BUILD_DIR)/top.json: $(files)
	@mkdir -p $$(dirname $@)
	yosys -q \
		-D FMICE \
		-p "synth_ice40 -abc9 -dff -device u -no-rw-check -top top -json $@" \
		-l $(basename $@)_synth.log \
		$(files)

$(BUILD_DIR)/%.asc: $(BUILD_DIR)/%.json
	nextpnr-ice40 -q -r \
		--json $< \
		--asc $@ \
		--pcf $(pins) \
		--u4k \
		--package sg48 \
		--log $(basename $@)_pnr.log

$(BUILD_DIR)/%.bin: $(BUILD_DIR)/%.asc
	icepack $< $@

$(BUILD_DIR)/%.bin.flash: $(BUILD_DIR)/%.bin
	iceprog -d i:0x0403:0x6014 $<

clean:
	rm -rf $(BUILD_DIR)
