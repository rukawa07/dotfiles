# Prints tmux session info.
# Assuems that [ -n "$TMUX"].

run_segment() {
  case $(uname) in

    Darwin)
      echo '' ;;
    Linux)
      echo '' ;;
    *)
      echo '' ;;
  esac
}
