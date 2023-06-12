# Test Workstation: Setup

## Prerequisites

- [ ] Setup Kubernetes nodes' hardware
- [ ] Setup Kubernetes nodes' OS configs
- [ ] Setup Kubernetes base infrastructure.
- [ ] Setup services required for network boot.

## Process

Setup current Windows desktop workstation PC for testing infrastructure & Windows configurations & provisioning packages.

Notes:
- Windows config & provisioning packages can be tested inside a VM.
- Physical machine only needed to test network boot infrastructure.
- Should test with both Windows 10 & Windows 11.
- AFAIK we don't have any Windows 11 machines yet, but likely will in not-so-distant future.
- Windows 10 testing **must** occur on hardware.
- Windows 11 testing can be done in VM until we have plans to acquire new hardware or upgrade Windows 10 machines

1. [ ] Create Windows installation USB drive
  - purchase new USB drive?
  - possible to install Ventoy to USB & place multiple NixOS/Windows installation images inside?

2. [ ] Install Windows 10 Pro to original hard drive

3. [ ] Install Windows 11 Pro to additional hard drive
  - overwrite original hard drive?
  - purchase small hard drive? M.2 SATA? NVMe? 64 GB too small? 128 GB will work


