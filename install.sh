#!/data/data/com.termux/files/usr/bin/bash


# msf-termux

# Author - D3adpool2K

# github - https://github.com/Deadpool2000

echo ">>>>>    Script by Deadpool2000     <<<<<\n"
ver=6.1.9
path="/data/data/com.termux/files/home/"
rm $PREFIX/bin/msfconsole && rm $PREFIX/bin/msfvenom > /dev/null
rm -rf $HOME/metasploit-framework > /dev/null
echo
echo "Installing required packages........"
echo
apt update && apt upgrade
apt install -y ruby wget apr apr-util libiconv zlib autoconf bison clang coreutils curl findutils git libffi libgmp libpcap postgresql readline libsqlite openssl libtool libxml2 libxslt ncurses pkg-config make libgrpc termux-tools ncurses-utils ncurses tar termux-elf-cleaner unzip zip
echo
echo "Downloading latest metasploit......."
echo
wget -O msf.tar.gz https://github.com/rapid7/metasploit-framework/archive/$ver.tar.gz
mv msf.tar.gz $path
tar -xvf $path/msf.tar.gz
mv $path/metasploit-framework-$ver $path/metasploit-framework 
rm $path/msf.tar.gz
echo
echo "Installing gems........."
echo
gem install --no-document --verbose rubygems-update 
update_rubygems
gem install bundler && bundle config build.nokogiri --use-system-libraries
cd $path/metasploit-framework && bundle install
cp assets/msfconsole $PREFIX/bin/ && cp assets/msfvenom $PREFIX/bin/

echo
echo "Now just use commands 'msfconsole' or 'msfvenom' to run metasploit."