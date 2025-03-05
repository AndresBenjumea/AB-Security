# ABSEC - A Cyber Security Toolkit

ABSEC is an advanced cybersecurity toolkit developed by **Andres Benjumea** to assist in various security tasks, including **data encryption**, **automated reconnaissance**, and **network scanning** using Nmap. This toolkit provides an easy-to-use interface for security professionals and ethical hackers to perform essential cybersecurity operations efficiently.

## Features
- **Encrypt/Decrypt Data:** Securely encrypt and decrypt data with advanced cryptographic algorithms.
- **Automated Reconnaissance:** Collect WHOIS, DNS records, and subdomains using Amass and related tools.
- **Nmap Scanning:** Perform advanced network scanning to identify active hosts, services, and vulnerabilities.

## Installation
To install ABSEC, clone the repository and run the installation script:
```bash
git clone https://github.com/yourusername/absec.git
cd absec
chmod +x install.sh
./install.sh
```

## Running the Toolkit
After installation, you can start the toolkit by running:
```bash
./absec.sh
```
Once launched, select an option from the menu to execute different security tasks.

## Requirements
ABSEC requires the following tools to function correctly:
- **figlet & lolcat** (for banner display)
- **openssl** (for encryption and decryption)
- **amass** (for reconnaissance)
- **whois & dig** (for domain information gathering)
- **nmap** (for network scanning)

If any dependencies are missing, they will be installed automatically.

## Usage
Upon execution, the toolkit presents a menu with the following options:
1. **Encrypt/Decrypt Data** - Securely encrypt or decrypt text.
2. **Automated Reconnaissance** - Gather WHOIS, DNS, and subdomain data.
3. **Nmap Scan** - Perform an advanced network security scan.
4. **Exit** - Close the toolkit.

Simply enter the corresponding number to execute your desired function.

## Uninstallation
To remove ABSEC from your system, run:
```bash
./uninstall.sh
```
This will delete all installed files and configurations.

## License
ABSEC is licensed under the **MIT License**. Feel free to modify and distribute it for ethical security research.

## Contributing
If you'd like to contribute, feel free to submit a pull request or open an issue in the repository.

## Disclaimer
This toolkit is for **educational and ethical hacking purposes only**. The developer is not responsible for any misuse of this tool.

---
For updates and contributions, visit: [GitHub Repository](https://github.com/yourusername/absec)
