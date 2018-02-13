# linm
# http://kldp.net/projects/mls/download
sudo apt-get install -qq libsmbclient
sudo apt-get install -qq libssl0.9.8
sudo apt-get install -qq libssl1.0.0

local linm_url="http://kldp.net/frs/download.php/4509/linm_0.8.1-1_amd64.deb"
local tmp_linm_deb="/tmp/linm.deb"
wget -O $tmp_linm_deb $linm_url
sudo dpkg -i $tmp_linm_deb
