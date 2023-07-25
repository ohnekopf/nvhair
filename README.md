## nvhair (nühair)

![image](https://github.com/ohnekopf/nvhair/assets/68486059/42ffed7e-65f4-4543-a69d-feb8f9e87786)
## Popup Mandarin dictionary for Linux
This couple of scripts use dunst and xsel and the [CEDICT](https://cc-cedict.org/wiki) text based dictionary to
provide definitions of mandarin chinese characters. 
Currently at a very basic but functional state. Inspired by the [Zhongwen](https://github.com/cschiller/zhongwen) browser extension.
Supports simplified chinese, although it can be set to recognize traditional characters with a little bit of tweaking.
## Requirements
* [dunst](https://github.com/dunst-project/dunst) notifications daemon with `dunstify`.
  
  Other daemons might work, you could also run dunst and nvhair in parallel with some `dbus-run-session` magic, probably.
* xsel, the tool used by the script to get your text selection.
* GNU awk
* some linux literacy

## Installation
* Clone the repo and place the files `nvhair` and `nv.awk` somewhere in your `$PATH`, I use `$HOME/.local/bin`. (use `chmod +x`
 to grant them execution permission)
* Download the CEDICT free dictionary ([CEDICT](https://cc-cedict.org/wiki)) in `.gz` format.
* Unpack it and tweak it with it with:
```
cat cedict_1_0_ts_utf-8_mdbg.txt.gz | gzip -d | dos2unix | cat - <(echo)  > cedict_1_0_ts_utf-8_mdbg.txt
```
* Dictionary needs sorting, use the sorting script `sortit.py`  to generate a sorted version:
  ```
  python sortit.py #generates  file dicout
  
  mkdir -p "$HOME/.local/share/cedict"
  mv dicout "$HOME/.local/share/cedict/cedict.txt"  # put the dictionary where nvhair expects it
  ```
* done, now just set up a keyboard shortcut to run the command `nvhair` after you select some chinese text


## Usage
* Select some chinese text with your mouse
* Run the program `nvhair` (most practically by a keyboard shortcut)
* That's it, a popup notification should appear with different defintions lifted from the CEDICT dictionary.
