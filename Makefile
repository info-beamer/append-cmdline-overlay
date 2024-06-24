all: append_cmdline.dtbo

append_cmdline.dtbo: append_cmdline.dts
	dtc -I dts -O dtb -o $@ $<

clean:
	rm -f append_cmdline.dtbo

.PHONY: clean
