char data[128] = {0};

extern void print_dram(void);
void print(const char *str)
{
	char *p = (char *)str;
	char *p_data;

	while(*p)
		*p_data++ = *p++; 			
}

int main()
{
	print("hello world\n");
	print_dram();
	return 0;
}
