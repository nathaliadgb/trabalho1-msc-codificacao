k = 1;
L0 = 10000;
L = L0;
p = 0.05 % 0.1 0.2 0.3
err = 0;

while L > 0

	% fonte discreta
	u = abs(round(rand(1, 1)));
	
	% codificador de fonte
	v = u * [1 1 1 1 1 1 1];
	
	% BSC channel
	e=abs(round(rand(1, 7)-0.5+p));
	% sum_e = sum(e);
	r = mod((v+e),2);
	
	% error detection	
	err_flag = round(abs(sum(r-v)/8));
	err = err + err_flag;
	
	L = L-1;
end

err/(k*L0)