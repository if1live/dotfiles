# OS_TYPE : linux / osx / unknown ...
# 맥의 경우는 환경설정이 달라질때가 많다.
# 매번 확인하기 귀찮아서 환경변수로 설정

function dotfiles::os::check_osx() {
	if [ -d "/Applications" ]; then
	  # 맥인지 확인하는 무식한 방법
	  # 설마 리눅스에서 /Applications 디렉토리를 만들겠어?
	  local DIST_NAME=$(sw_vers -productName)
	  local DIST_VERSION=$(sw_vers -productVersion)
	  local DIST_BUILD=$(sw_vers -buildVersion)

    export OS_TYPE="osx"
    export OS_DIST_TYPE="osx"
	  export OS_DIST_NAME="$DIST_NAME $DIST_VERSION $DIST_BUILD"
  fi
}

function dotfiles::os::check_redhat_dist() {
	local RELEASE_FILE="/etc/redhat-release"

  if [ -f $RELEASE_FILE ]; then
	  # centos
    export OS_TYPE="linux"
    export OS_DIST_TYPE="redhat"
	  export OS_DIST_NAME=`cat $REDHAT_RELEASE_FILE`
  fi
}


function dotfiles::os::check_debian_dist() {
  local RELEASE_FILE="/etc/lsb-release"
  if [ -f $RELEASE_FILE ]; then
    local DIST_NAME=$(sed -n 's/^DISTRIB_ID=//p' $RELEASE_FILE)
		local DIST_VERSION=$(sed -n 's/^DISTRIB_RELEASE=//p' $RELEASE_FILE)

	  if [[ $DIST_NAME != "" ]]; then
      export OS_TYPE="linux"
      export OS_DIST_TYPE="debian"
		  export OS_DIST_NAME="$DIST_NAME $DIST_VERSION"
	  fi
  fi
}

function dotfiles::os::check_chromeos() {
  local RELEASE_FILE="/etc/lsb-release"
	if [ -f $RELEASE_FILE ]; then
    local CHROMEOS_RELEASE_DESCRIPTION=$(sed -n 's/^CHROMEOS_RELEASE_DESCRIPTION=//p' $RELEASE_FILE)

    if [[ $CHROMEOS_RELEASE_DESCRIPTION != "" ]]; then
      export OS_TYPE="linux"
      export OS_DIST_TYPE="chromeos"
      export OS_DIST_NAME=$CHROMEOS_RELEASE_DESCRIPTION
    fi
  fi
}


function dotfiles::os::init() {
  export OS_TYPE="unknown"
  export OS_DIST_TYPE="unknown"
  export OS_DIST_NAME="Unknown Distribution"

  dotfiles::os::check_chromeos
  dotfiles::os::check_debian_dist
  dotfiles::os::check_redhat_dist
  dotfiles::os::check_osx

  echo "OS\t: ${OS_TYPE} - ${OS_DIST_TYPE}"
  echo "OS Name\t: ${OS_DIST_NAME}"
}
