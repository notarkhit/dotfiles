#!/bin/env bash

# Define an array of approximate color names for 256 colors
color=(
    "Black" "Maroon" "Green" "Olive" "Navy" "Purple" "Teal" "Silver"
    "Gray" "Red" "Lime" "Yellow" "Blue" "Fuchsia" "Aqua" "White"
    "Grey0" "NavyBlue" "DarkBlue" "Blue3" "Blue3" "Blue1" "DarkGreen" "DeepSkyBlue4"
    "DeepSkyBlue4" "DeepSkyBlue4" "DodgerBlue3" "DodgerBlue2" "Green4" "SpringGreen4"
    "Turquoise4" "DeepSkyBlue3" "DeepSkyBlue3" "DodgerBlue1" "Green3" "SpringGreen3"
    "DarkCyan" "LightSeaGreen" "DeepSkyBlue2" "DeepSkyBlue1" "Green3" "SpringGreen3"
    "SpringGreen2" "Cyan3" "DarkTurquoise" "Turquoise2" "Green1" "SpringGreen2"
    "SpringGreen1" "MediumSpringGreen" "Cyan2" "Cyan1" "DarkRed" "DeepPink4"
    "Purple4" "Purple4" "Purple3" "BlueViolet" "Orange4" "Grey37" "MediumPurple4"
    "SlateBlue3" "SlateBlue3" "RoyalBlue1" "Chartreuse4" "DarkSeaGreen4" "PaleTurquoise4"
    "SteelBlue" "SteelBlue3" "CornflowerBlue" "Chartreuse3" "DarkSeaGreen4" "CadetBlue"
    "CadetBlue" "SkyBlue3" "SteelBlue1" "Chartreuse3" "PaleGreen3" "SeaGreen3"
    "Aquamarine3" "MediumTurquoise" "SteelBlue1" "Chartreuse2" "SeaGreen2" "SeaGreen1"
    "SeaGreen1" "Aquamarine1" "DarkSlateGray2" "DarkRed" "DeepPink4" "DarkMagenta"
    "DarkMagenta" "DarkViolet" "Purple" "Orange4" "LightPink4" "Plum4" "MediumPurple3"
    "MediumPurple3" "SlateBlue1" "Yellow4" "Wheat4" "Grey53" "LightSlateGrey"
    "MediumPurple" "LightSlateBlue" "Yellow4" "DarkOliveGreen3" "DarkSeaGreen" "LightSkyBlue3"
    "LightSkyBlue3" "SkyBlue2" "Chartreuse2" "DarkOliveGreen3" "PaleGreen3" "DarkSeaGreen3"
    "DarkSlateGray3" "SkyBlue1" "Chartreuse1" "LightGreen" "LightGreen" "PaleGreen1"
    "Aquamarine1" "DarkSlateGray1" "Red3" "DeepPink4" "MediumVioletRed" "Magenta3"
    "DarkViolet" "Purple" "DarkOrange3" "IndianRed" "HotPink3" "MediumOrchid3"
    "MediumOrchid" "MediumPurple2" "DarkGoldenrod" "LightSalmon3" "RosyBrown" "Grey63"
    "MediumPurple2" "MediumPurple1" "Gold3" "DarkKhaki" "NavajoWhite3" "Grey69"
    "LightSteelBlue3" "LightSteelBlue" "Yellow3" "DarkOliveGreen3" "DarkSeaGreen3"
    "DarkSeaGreen2" "LightCyan3" "LightSkyBlue1" "GreenYellow" "DarkOliveGreen2"
    "PaleGreen1" "DarkSeaGreen2" "DarkSeaGreen1" "PaleTurquoise1" "Red3" "DeepPink3"
    "DeepPink3" "Magenta3" "Magenta3" "Magenta2" "DarkOrange3" "IndianRed" "HotPink3"
    "HotPink2" "Orchid" "MediumOrchid1" "Orange3" "LightSalmon3" "LightPink3" "Pink3"
    "Plum3" "Violet" "Gold3" "LightGoldenrod3" "Tan" "MistyRose3" "Thistle3"
    "Plum2" "Yellow3" "Khaki3" "LightGoldenrod2" "LightYellow3" "Grey84"
    "LightSteelBlue1" "Yellow2" "DarkOliveGreen1" "DarkOliveGreen1" "DarkSeaGreen1"
    "Honeydew2" "LightCyan1" "Red1" "DeepPink2" "DeepPink1" "DeepPink1" "Magenta2"
    "Magenta1" "OrangeRed1" "IndianRed1" "IndianRed1" "HotPink" "HotPink" "MediumOrchid1"
    "DarkOrange" "Salmon1" "LightCoral" "PaleVioletRed1" "Orchid2" "Orchid1"
    "Orange1" "SandyBrown" "LightSalmon1" "LightPink1" "Pink1" "Plum1" "Gold1"
    "LightGoldenrod2" "LightGoldenrod2" "NavajoWhite1" "MistyRose1" "Thistle1" "Yellow1"
    "LightGoldenrod1" "Khaki1" "Wheat1" "Cornsilk1" "Grey100" "Grey3" "Grey7"
    "Grey11" "Grey15" "Grey19" "Grey23" "Grey27" "Grey30" "Grey35" "Grey39"
    "Grey42" "Grey46" "Grey50" "Grey54" "Grey58" "Grey62" "Grey66" "Grey70"
    "Grey74" "Grey78" "Grey82" "Grey85" "Grey89" "Grey93"
)


# Loop through all 256 colors and print their codes with names
for i in {0..255}; do
    echo -e "\e[38;5;${i}m${i}: ${color[$i]} \e[0m"
done | fzf --ansi --reverse | awk -F ":" '{print "\\033[38;5;"$1"m<MESSAGE>\\033[0m"}' | xclip -selection clipboard
