# kernel_samsung_N770F

KernelSU-Next Compatible kernel for samsung galaxy note 10 lite

# Installation steps:

Back up all previous modules (they will be permanently deleted once you install KernelSU-Next)

Download the [latest boot.img](https://github.com/bavalucket/android_kernel_samsung_n770f/releases/tag/releases)

Flash it through TWRP/Odin/heimdall/...

recommended: clear cache and dalvik art

Enjoy!

## Notes

🔴: Fatal, 🟡: Not advised, 🟢: Permissible.

🟡🟢: SuSfs is enabled for production builds

🟡: Overlayfs can't be used while modules are mounted without further development

🟢: (DEV) get_cred_rcu() is [bypassed](https://github.com/bavalucket/KernelSU-Next/commit/a55b01ca98602f26f856d2dabb086a880cec26b9) rather than ported



# Compilation:

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

- Keep in mind overlayfs is unstable

- After successful compilation do the following:

- Copy the Image from arch/arm64/boot/Image

- Paste it into Android Image Kitchen

- Boot! 

## BUG Reporting & features:

In case of a bug feel free to publish a bug report on this repo.

If you want to request an additional feature feel free to do so.

## Credits

- [kernel-assisted-superuser](https://git.zx2c4.com/kernel-assisted-superuser/about/): the KernelSU idea.
- [Magisk](https://github.com/topjohnwu/Magisk): the powerful root tool.
- [genuine](https://github.com/brevent/genuine/): apk v2 signature validation.
- [Diamorphine](https://github.com/m0nad/Diamorphine): some rootkit skills.
- [KernelSU](https://github.com/tiann/KernelSU): thanks to tiann, or else KernelSU Next wouldn't even exist.
- [Magic Mount Port](https://github.com/5ec1cff/KernelSU/blob/main/userspace/ksud/src/magic_mount.rs): 💜 5ec1cff for saving KernelSU!
