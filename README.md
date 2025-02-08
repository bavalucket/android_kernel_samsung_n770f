# kernel_samsung_N770F

KernelSU-Next Compatible kernel for samsung galaxy note 10 lite

### Installation steps:

Back up all previous modules (they will be permanently deleted once you install KernelSU-Next)

Download the latest boot.img

Flash it through TWRP/Odin/heimdall/...

recommended: clear cache and dalvik art

Enjoy!

### Notes

🔴: Fatal, 🟡: Not advised, 🟢: Permissible.
# Installation:

🔴: SuSfs isn't enabled as it needs further development

🟡: Overlayfs can't be used while modules are mounted without further development






### Compilation:

Clone the repo using the "--recurse-submodules" flag

```
git clone --recurse-submodules https://github.com/bavalucket/android_kernel_samsung_n770f.git
```

and then CD into the directory & run the automated 'build_kernel.sh'

```
bash build_kernel.sh
```
## Notes:

- No patch history - not yet added

- "setup_repos.sh" might fail due to an HTTP/2 error, in which case you should rerun the script

```
./setup_repos.sh
```

- **MUST** disable RKP, Uh, and KDP, Otherwise known as "scamsong's b.s."

- Can enable/disable magic mount in menuconfig

- Thou shall NOT enable SUS_SU (without further patches)

- After successful compilation do the following:

- Copy the Image from arch/arm64/boot/Image

- Paste it into Android Image Kitchen

- Boot! 

### BUG Reporting & features:

In case of a bug feel free to publish a bug report on this repo.

If you want to request an additional feature feel free to do so.
