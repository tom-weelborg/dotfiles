{ pkgs, ... }:
with pkgs.vscode-marketplace;
with pkgs.vscode-marketplace-release;
with pkgs.open-vsx;
with pkgs.open-vsx-release;
with pkgs.vscode-extensions;
[
  # Extension Pack for Java
  redhat.java
  vscjava.vscode-gradle
  vscjava.vscode-java-debug
  vscjava.vscode-java-dependency
  vscjava.vscode-java-pack
  vscjava.vscode-java-test
  vscjava.vscode-maven

  # Spring Boot Extension Pack
  # vscjava.vscode-spring-boot-dashboard
  # vscjava.vscode-spring-initializr
  vmware.vscode-boot-dev-pack
  # vmware.vscode-spring-boot
]
++
pkgs.vscode-utils.extensionsFromVscodeMarketplace [
  {
    name = "vscode-spring-boot-dashboard";
    publisher = "vscjava";
    version = "0.14.2025041702";
    sha256 = "gtEn4UD5Ft+JJqHcz/Eh4t2njOZJg2NRVtfD8Hy4LT8=";
  }
  {
    name = "vscode-spring-initializr";
    publisher = "vscjava";
    version = "0.12.0";
    sha256 = "q2++9C01okq5pFdmKKc3ZSr0G4XTAchpEmBMqZm3q7Y=";
  }
  {
    name = "vscode-spring-boot";
    publisher = "vmware";
    version = "2.1.2026022400";
    sha256 = "S0OO1rqyE8W0GOUT3U6YZ2mKsl61Q1eAWvGghXnWR74=";
  }
]