function refactor --argument-names 'pattern' 'replacement' 'filepattern'
    if test -z "$pattern"
        echo "$0 pattern replacement [filepattern]"
        return
    end
    if test -n "$pattern" -a -z "$replacement"
        ag -l "$pattern"
        return
    end
    ag -l "$pattern" | grep "$filepattern" | xargs sed -i ".bck" -e "s/$pattern/$replacement/"
end
