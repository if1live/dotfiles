# raspberry pi에서는 환경변수 추가세팅 안하면 문제 발생
# 아키텍쳐에 의한 버그
# https://www.raspberrypi.org/forums/viewtopic.php?f=34&t=10781
# https://github.com/golang/go/wiki/GoArm
case $(uname -m) in
  "armv5l")
    export GOARM="5"
    ;;
  "armv6l")
    export GOARM="6"
    ;;
  "armv7l")
    export GOARM="7"
    ;;
  "armv8l")
    export GOARM="arm64"
    ;;
esac

if [[ -s $HOME/.gvm/scripts/gvm ]]; then
  source $HOME/.gvm/scripts/gvm

  gvm_version=$(gvm version | sed 's/Go Version Manager //g')
  echo "gvm version : $gvm_version"
else
  echo "gvm not found"
fi
