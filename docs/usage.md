
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
- **Best Practices Implementation:** Applies settings based on CIS Benchmarks and NIST compliance guidelines.

## Logs
The tool's actions are logged to `/var/log/linux-hardening-tool.log`.

## Additional Information
For detailed information on each hardening step and its configuration, refer to the individual scripts in the repository.
```
