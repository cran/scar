void AggSum(int *nin, double *x)
{
	int n = nin[0];
	int i;
	for (i=1; i<n; i++)
		x[i] = x[i] + x[i-1];
}
