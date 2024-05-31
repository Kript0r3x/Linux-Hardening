<!-- 
# Usage

## Overview
The Linux Hardening Tool is designed to enhance the security of your Linux system by reducing vulnerabilities, improving event logging coverage, and ensuring patch compliance. By implementing configuration optimizations and removing unnecessary components, this tool helps strengthen your system's defenses. It aligns with industry standards such as CIS Benchmarks and NIST guidelines, implementing best practices to protect against common threats.


## Prerequisites
- Debian-based Linux distribution
- Root privileges

## Installation
1. Clone the repository:
    ```bash
    git clone https://github.com/yourusername/linux-hardening-tool.git
    cd linux-hardening-tool
    ```

2. Make the scripts executable:
    ```bash
    cd ./scripts
    chmod +x setup.sh vulnerability_reduction.sh setup_logging.sh update_system.sh apply_best_practices.sh
    ```

## Running the Tool
Run the setup script as root:
```bash
sudo ./setup.sh
```

The setup script will execute the following steps:
1. Reduce vulnerabilities by enforcing strong password policies, disabling root login, locking inactive accounts, and removing unnecessary services.
2. Set up comprehensive system logging and auditing.
3. Automate system updates and patching.
4. Apply best practices based on CIS Benchmarks and NIST compliance settings.

## Features
- **Vulnerability Reduction**
  - Enforces strong password policies.
  - Disables root login.
  - Locks inactive user accounts.
  - Removes unnecessary services.
  - Secures SSH configuration.

- **Event Logging Coverage**
  - Installs and configures `rsyslog` for system logging.
  - Configures `auditd` for detailed auditing and monitoring.
  - Ensures critical logs are collected and stored securely.

- **Patch Compliance**
  - Automates system updates using the package manager.
  - Schedules regular updates and verifies their application.

- **Best Practices Implementation**
  - Applies CIS Benchmark settings, including secure partition configurations and filesystem options.
  - Disables unused filesystems to reduce attack surface.
  - Ensures gpgcheck is globally activated for package installations.
  - Installs and configures AIDE for integrity checking.
  - Configures time synchronization with `chrony`.
  - Applies NIST compliance settings, including secure boot and integrity checks.
  - Configures secure permissions on log files.
  - Enables and configures the `ufw` firewall with default deny incoming policy.
- **Vulnerability Reduction:** Enforces strong password policies, disables root login, locks inactive accounts, removes unnecessary services, and secures SSH configuration.
- **Event Logging Coverage:** Installs and configures `rsyslog` and `auditd`, ensuring critical logs are collected.
- **Patch Compliance:** Automates system updates and schedules regular updates.
- **Best Practices Implementation:** Applies settings based on CIS Benchmarks and NIST compliance guidelines. -->

# Linux Hardening Tool

## Overview
The Linux Hardening Tool enhances the security of your Linux system by implementing configuration optimizations and removing unnecessary components. It aligns with industry standards such as CIS Benchmarks and NIST guidelines, applying best practices to protect against common threats. The tool is especially effective for Ubuntu systems but can be adapted for other Linux distributions.

## Features
- **Secure Boot and Full Disk Encryption**
  - Ensure the OS is cryptographically signed and enable full disk encryption to prevent unauthorized access.
- **Partitioning**
  - Create separate partitions for `/tmp`, `/var/tmp`, `/home`, `/var/log`, and `/var/log/audit` to prevent resource exhaustion.
- **Automated Hardening Tools**
  - Integrate tools like the Ubuntu Security Guide (USG) to apply CIS benchmark rules automatically and audit system compliance.
- **AppArmor/SELinux**
  - Use AppArmor or SELinux for Mandatory Access Control to limit the capabilities of processes and mitigate unknown threats.
- **Remove Unused Software and Services**
  - Audit and remove unnecessary software packages and services, especially those exposed to the network.
- **Encrypt Network Services**
  - Ensure that all network services use encryption by default. Utilize tools like `nmap` to check for unencrypted services.
- **Logging and Forensics**
  - Implement centralized logging servers with synchronized system clocks using NTP. Use Intrusion Detection Systems (IDS) like AIDE for File Integrity Monitoring.
- **Regular Patching and Vulnerability Management**
  - Automate security updates using tools like `unattended-upgrades`. Use vulnerability scanning tools to monitor and remediate known vulnerabilities.
- **Firewall Configuration**
  - Set up firewalls to block all incoming traffic except what is explicitly required. Test firewall configurations using tools like `nmap`.
- **Web Server and TLS Configuration**
  - Configure web servers to use secure ciphers and protocols, disable outdated SSL/TLS versions, and ensure TLS certificate management.
- **SSH Server Hardening**
  - Follow CIS profiles for SSH configuration, manage user accounts centrally, and use SSH keys on hardware tokens.
- **Operational Hardening**
  - Manage user accounts with Single Sign-On (SSO) solutions, enforce strong passwords and Multi-Factor Authentication (MFA), and use asset management systems like Landscape. Store secrets in an encrypted vault system with restricted access.
- **High Availability (HA) Setup**
  - Implement HA to allow for patching without service interruption and to mitigate hardware failures.
- **Container Security**
  - Harden container images by removing unneeded components, ensuring network services use encrypted connections, and keeping container software updated.
- **Kubernetes Security**
  - Secure Kubernetes deployments using tools like kube-bench and follow NSA/CIS guidelines for hardening.
- **Independent Validation**
  - Commission penetration tests by accredited third parties to ensure the infrastructure is secure.

## Update Features
This section provides information about the latest updates and new features added to the Linux Hardening Tool.

### Version 2.0
- **Secure Boot Configuration**: Added scripts to ensure the OS being loaded is cryptographically signed.
- **Full Disk Encryption (FDE)**: Integrated support for full disk encryption to prevent unauthorized access to disk data.
- **Partitioning Enhancements**: Implemented separate partitions for writable locations such as `/tmp`, `/var/tmp`, `/home`, `/var/log`, and `/var/log/audit`.
- **Automated Hardening with USG**: Integrated the Ubuntu Security Guide (USG) to apply CIS benchmark rules automatically and audit system compliance.
- **AppArmor/SELinux Integration**: Added support for AppArmor to provide Mandatory Access Control and mitigate unknown threats.
- **Unused Software and Service Removal**: Enhanced scripts to audit and remove unnecessary software packages and services.
- **Network Service Encryption**: Ensured all network services use encryption by default and included tools like `nmap` to check for unencrypted services.
- **Centralized Logging and IDS**: Implemented centralized logging with synchronized system clocks using NTP and added Intrusion Detection Systems (IDS) like AIDE.
- **Automated Patching and Vulnerability Management**: Automated security updates using tools like `unattended-upgrades` and integrated vulnerability scanning tools.
- **Enhanced Firewall Configuration**: Set up and tested firewalls to block all incoming traffic except what is explicitly required.
- **Web Server and TLS Enhancements**: Configured web servers to use secure ciphers and protocols, disabled outdated SSL/TLS versions, and ensured TLS certificate management.
- **SSH Server Hardening**: Followed CIS profiles for SSH configuration, managed user accounts centrally, and used SSH keys on hardware tokens.
- **Operational Hardening Enhancements**: Managed user accounts with SSO solutions, enforced strong passwords and MFA, and used asset management systems like Landscape. Stored secrets in an encrypted vault system with restricted access.
- **High Availability (HA) Implementation**: Implemented HA to allow for patching without service interruption and to mitigate hardware failures.
- **Container and Kubernetes Security**: Hardened container images and secured Kubernetes deployments using tools like kube-bench.
- **Independent Validation**: Recommended commissioning penetration tests by accredited third parties to ensure infrastructure security.

## Prerequisites
- Debian-based Linux distribution
- Root privileges

## Installation
1. Clone the repository:
    ```bash
    git clone https://github.com/yourusername/linux-hardening-tool.git
    cd linux-hardening-tool
    ```

2. Make the scripts executable:
    ```bash
    chmod +x setup.sh scripts/*.sh
    ```

## Running the Tool
Run the setup script as root:
```bash
sudo ./setup.sh


## Logs
The tool's actions are logged to `/var/log/linux-hardening-tool.log`.

## Additional Information
For detailed information on each hardening step and its configuration, refer to the individual scripts in the repository.
```
