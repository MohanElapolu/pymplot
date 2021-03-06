#!/usr/bin/env ruby

system "mkdir -p ~/.fonts; cp -rp ./fonts/* ~/.fonts; fc-cache -f -v"

system "mkdir -p ~/bin"

exec = [
	"showgraph", 
	"showmatrix",
	"showwiggle",
	"showcontour",
	"showslice",
	"showvolume",
	"showvolcon", 
	"showcolorbar", 
	"showslicon"
	]

exec.each do |i|

	file=File.open(Dir.home+"/bin/x_" + i, 'w+')

	file.puts "if [ $# -eq 0 ]; then"
	file.puts "  python3 -W ignore " + Dir.pwd + "/" + i + ".py -h"
	file.puts "else"
	file.puts "  python3 -W ignore " + Dir.pwd + "/" + i + ".py \"$@\" "
	file.puts "fi"

	file.close

	puts "x_" + i + " installed "

end

system "chmod +x ~/bin/x_show*"



