# Defined in /var/folders/1d/ycp93qn95lg261q6bg4vxkp45qsks4/T//fish.IlE2rO/stop_parentcontrolsd.fish @ line 2
function stop_parentcontrolsd
	if ps -ef | grep -i parentalcontrol[s] >/dev/null ^&1
        echo "guess whos back, back again"
        sudo rm -rf /Library/Application\ Support/Apple/ParentalControls
        sudo pkill parentalcontrolsd
    end
end
