# Prints tmux session info.
# Assuems that [ -n "$TMUX"].

run_segment() {
  case $(uname) in

    Darwin)
      echo '' ;;
    Linux)
      case $(lsb_release -is) in
        Raspbian)
          echo '' ;;
        Ubuntu)
          echo '' ;;
        *)
          echo '' ;;
        esac ;;
    *)
      echo '' ;;
  esac
}
