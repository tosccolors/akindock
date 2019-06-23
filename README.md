# akindock docker image
ak from Akretion, but operating in a container, for instance on CoreOS


Execute following commands to install voodoo in a container on CoreOS
$ curl -L --fail https://github.com/whulshof/akindock/releases/download/v1.1/ak.sh > ~/ak
$ sudo mkdir -p /opt/bin
$ sudo mv ~/ak /opt/bin/
$ sudo chown root:root /opt/bin/ak
$ sudo chmod +x /opt/bin/ak

Execute following commands to install ak in a container on MacOS
$ curl -L --fail https://github.com/whulshof/akindock/releases/download/v1.1/ak-macos.sh > /usr/local/bin/ak
$ sudo chmod +x /usr/local/bin/ak
