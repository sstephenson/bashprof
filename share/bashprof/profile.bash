enable -f "$BASHPROF_ROOT"/libexec/bashprof/bashprof.dylib utime
[ -z "$BASHPROF_OUT" ] && BASHPROF_OUT="bashprof.$$.log"
[ -z "$BASHPROF_PROGRAM" ] && BASHPROF_PROGRAM="(sourced)"

bashprof_log() {
  utime
  echo "program=$BASHPROF_PROGRAM"
  echo "command=$1"
  echo "subshell=$2"
  echo "function=${FUNCNAME[@]:1}"
  echo "filename=${BASH_SOURCE[@]:1}"
  echo "lineno=${BASH_LINENO[@]::${#FUNCNAME[@]}-1}"
} >>"$BASHPROF_OUT"

profile() {
  local trap="$(trap debug)"
  set -T
  trap "bashprof_log \"\$BASH_COMMAND\" \"\$BASH_SUBSHELL\"; $trap" debug
}
