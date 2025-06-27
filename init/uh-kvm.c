#include <linux/types.h>
#include <asm/memory.h>
#include <asm/cacheflush.h>
#include <linux/uh-kvm.h>

#define UH_64BIT_SMC_CALL_MAGIC 0xC2000400
#define UH_STACK_OFFSET 0x2000
#define UH_MODE_AARCH64 1

int _uh_goto_EL2(int magic, void *label, int offset, int mode, void *base, int size);

/* Parameters passed to EL2 hypervisor */
static unsigned long hyp_params[3];

void uh_init_kvm(
    phys_addr_t code,
    phys_addr_t pgd_ptr,
    unsigned long hyp_stack_ptr,
    unsigned long vector_ptr
)
{

    /* Set up hypervisor parameters */
    hyp_params[0] = pgd_ptr;        /* TTBR0_EL2 value */
    hyp_params[1] = hyp_stack_ptr;  /* Hypervisor stack pointer */
    hyp_params[2] = vector_ptr;     /* Exception vectors address */

    /* Ensure parameters are visible to EL2 */
    __flush_dcache_area(hyp_params, sizeof(hyp_params));

    /* Transition to EL2 */
    _uh_goto_EL2(
        UH_64BIT_SMC_CALL_MAGIC,   // SMC call magic number
        (void *)code,               // Entry point address
        UH_STACK_OFFSET,            // Stack offset
        UH_MODE_AARCH64,            // AArch64 execution mode
        (void *)virt_to_phys(hyp_params),  // Physical address of params
        sizeof(hyp_params)          // Size of parameter block
    );
}


























