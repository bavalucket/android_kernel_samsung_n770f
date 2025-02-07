# kernel_samsung_N770F
KernelSU-Next Compatible kernel for samsung galaxy note 10 lite

### Installation steps:

Back up all modules (they will be permanently deleted once you install KernelSU-Next)
Download the latest boot.img
Flash it through TWRP/Odin/heimdall/...
recommended: clear cache and dalvik art
Enjoy!

### Notes


# Installation:

🔴: SuSfs isn't enabled as it needs further development\n
🟡: Overlayfs can't be used while modules are mounted without further development\n

# Compilation:
🟡: No patch history - not yet added\n
🔴: **MUST** disable RKP, Uh, and KDP, Otherwise known as "scamsong's b.s."\n
🟢: Can enable/disable magic mount in menuconfig\n
🟢: Thou shall NOT enable SUS_SU (without further patches)\n
🟢: After successful compilation do the following:\n
1: Copy the Image from arch/arm64/boot/Image\n
2: Paste it into Android Image Kitchen\n
3: Boot! \n

### BUG Reporting & features:

In case of a bug feel free to publish a bug report on this repo.\n
If you want to request an additional feature feel free to do so.
