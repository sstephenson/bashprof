enable -f "$BASHPROF_ROOT"/libexec/bashprof/bashprof.dylib utime
[ -z "$BASHPROF_OUT" ] && BASHPROF_OUT="bashprof.$$.log"
[ -z "$BASHPROF_PROGRAM" ] && BASHPROF_PROGRAM="(sourced)"

bashprof_log() {
  utime
  echo "program=$BASHPROF_PROGRAM"
  echo "statement=${1//$'\n'/\\n}"
  echo "function=${FUNCNAME[1]}"
  echo "filename=${BASH_SOURCE[1]}"
  echo "lineno=${BASH_LINENO[0]}"

  # The following information is not currently used by the formatter
  echo "pid=$$"
  echo "subshell=$2"
  echo "caller_functions=${FUNCNAME[@]:2}"
  echo "caller_filenames=${BASH_SOURCE[@]:2}"
  echo "caller_linenos=${BASH_LINENO[@]:1:${#FUNCNAME[@]}-2}"

} >>"$BASHPROF_OUT"

profile() {
  local trap="$(trap debug)"
  set -T
  trap "bashprof_log \"\$BASH_COMMAND\" \"\$BASH_SUBSHELL\"; $trap" debug
}
