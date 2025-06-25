#include <linux/types.h>
#include <asm/memory.h>

#define UH_32BIT_SMC_CALL_MAGIC 0x82000400
#define UH_64BIT_SMC_CALL_MAGIC 0xC2000400

#define UH_STACK_OFFSET 4096

#define UH_MODE_AARCH32 0
#define UH_MODE_AARCH64 1

int _uh_goto_EL2(int magic, void *label, int offset, int mode, void *base, int size);

static unsigned long hyp_params[4];
void uh_init_kvm(phys_addr_t code, phys_addr_t boot_pgd_ptr, phys_addr_t pgd_ptr, unsigned long hyp_stack_ptr, unsigned long vector_ptr)
{
    hyp_params[0] = boot_pgd_ptr;
    hyp_params[1] = pgd_ptr;
    hyp_params[2] = hyp_stack_ptr;
    hyp_params[3] = vector_ptr;
    __flush_dcache_area(hyp_params, sizeof(hyp_params));
    _uh_goto_EL2(UH_64BIT_SMC_CALL_MAGIC, (void*)code, UH_STACK_OFFSET, UH_MODE_AARCH64, (void*)virt_to_phys(hyp_params), 0);
}
