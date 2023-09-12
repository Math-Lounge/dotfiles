
function exec_cmd () { echo "$@"; $@; }
function warn () { echo "$(date) | $@"; }
function fatal () { echo "$(date) | $@"; exit 1; }
function die () { echo "$(date) | $@"; exit 1; }

