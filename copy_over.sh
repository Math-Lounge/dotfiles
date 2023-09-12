
function copy_base ()
{
    local CMD=""
    for F in $@
    do
        CMD+=" ${SRC}/$F"
    done
    CMD+=" ${DST}/"
    echo ${CMD}
}

function copy_folders () { echo "cp -R $(copy_base $@)"; }

function copy_files () { echo "cp $(copy_base $@)"; }

