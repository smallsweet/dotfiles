# Defined in /var/folders/1d/ycp93qn95lg261q6bg4vxkp45qsks4/T//fish.GoHpEc/refactor.fish @ line 2
function refactor --argument pattern replacement filepattern
	if test -z "$pattern"
        echo "refactor pattern replacement [filepattern]"
        return
    end
    if test -n "$pattern" -a -z "$replacement"
        ag -l "$pattern"
        return
    end
    echo ag -l "$pattern" | grep "$filepattern" | xargs sed -i ".bck" -e "s/$pattern/$replacement/"
end
