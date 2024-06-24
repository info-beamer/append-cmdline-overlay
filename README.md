# Appending conditional kernel command line arguments in config.txt

Out of the box the Pi firmware only allows a single `cmdline` option. Anything within the referenced file
is used as the command line argument passed to the booted Linux kernel. I needed additional conditional 
values, so I could do something like, for example, this:

```
[Pi5]
# somehow append key=value option to the cmdline value...
```

Thankfully my [question in the Pi forum](https://forums.raspberrypi.com/viewtopic.php?p=2231554) was
quickly answered by PhilE: It's possible to use a custom overlay for that.

This is how it works: First copy the included `append_cmdline.dtbo` file to /overlays.

Within a conditional `config.txt` section or an `include`d file, use the following line to append some value to the existing command line:

```
dtoverlay=append_cmdline,append=video=HDMI-A-1:1920x540@60
```

This can be repeated to append multiple values. Alternatively multiple values can be specified like this:

```
dtoverlay=append_cmdline
dtparam=append=append=video=HDMI-A-1:1920x540@60
dtparam=append=append=video=HDMI-A-2:1920x540@60
```
