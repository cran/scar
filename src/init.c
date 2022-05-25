#include <stdlib.h> // for NULL
#include <R_ext/Rdynload.h>

/* FIXME: 
   Check these declarations against the C/Fortran source code.
*/

/* .C calls */
extern void AggSum(void *, void *);

static const R_CMethodDef CEntries[] = {
    {"AggSum", (DL_FUNC) &AggSum, 2},
    {NULL, NULL, 0}
};

void R_init_scar(DllInfo *dll)
{
    R_registerRoutines(dll, CEntries, NULL, NULL, NULL);
    R_useDynamicSymbols(dll, FALSE);
}
