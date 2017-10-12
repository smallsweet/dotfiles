# Defined in /var/folders/1d/ycp93qn95lg261q6bg4vxkp45qsks4/T//fish.Cnvhjt/pwgen.fish @ line 2
function pwgen --argument length
	if test -z "$length"
        set length 12
    end
	openssl rand -base64 $length | cut -c 1-$length
end
