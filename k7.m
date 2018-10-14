k = 7;
L0 = 10000;
L = L0;
p = 0.05 % 0.1 0.2 0.3
err = 0;

while L > 0

	u = abs(round(rand(1, 7)));
	v = u;
	e=abs(round(rand(1, 7)-0.5+p));
	r = mod((v+e),2);
	
	err_flag = sum(mod((r-v),2));
	
	err = err + err_flag;
	
	L = L-1;
end

err/(k*L0)