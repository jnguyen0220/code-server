ARCH=`dpkg --print-architecture`
curl -o /tmp/golang.tar.gz "https://dl.google.com/go/go1.15.6.linux-$ARCH.tar.gz"
tar -C /usr/local -xzvf /tmp/golang.tar.gz
rm -f /tmp/golang.tar.gz
echo "export PATH=\$PATH:/usr/local/go/bin:\$HOME/go/bin" >> /etc/bash.bashrc