k = 1;
L0 = 1000;
L = L0;
p = 0.5 % 0.1 0.2 0.3
err = 0;

v0 = [0 0 0 0 0 0 0];
v1 = [1 1 1 1 1 1 1];


while L > 0

	u = abs(round(rand(1, 1)));
	v = u * [1 1 1 1 1 1 1];
	e=abs(round(rand(1, 7)-0.5+p));
	sum_e = sum(e);
	r = mod((v+e),2);
	
	err_flag = round(abs(sum(r-v)/8));
	err = err + err_flag;
	
	L = L-1;
end

err/(k*L0)