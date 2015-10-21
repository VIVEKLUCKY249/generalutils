Source URL: https://github.com/nodejs/node
GIT URL: git clone git://github.com/nodejs/node.git
cd node
./configure
make
sudo make install

# Note the new setup script name for Node.js v0.12
curl -sL https://deb.nodesource.com/setup_0.12 | sudo bash -
sudo apt-get update
# Then install with:
sudo apt-get install -y nodejs

## Uninstall Nodejs from Ubuntu
sudo apt-get remove nodejs

Current NodeJS Working Directory
/var/www/html/NodeJS/Examples/

Install packages with "npm"
npm install <package_name>

sudo apt-get --purge remove node
sudo apt-get --purge remove nodejs
sudo apt-get install nodejs

# Confirm it worked
node --version       # v0.10.13
ls -la `which node`  # ... /usr/bin/node -> /etc/alternatives/node
