function Perro = k1(p_param,L_param)

	k = 1;
	L = L_param;
	p = p_param;
	err = 0;

	while L > 0

		% fonte discreta
		u = abs(round(rand(1, 1)));
		
		% codificador de fonte
		v = u * [1 1 1 1 1 1 1];
		
		% BSC channel
		e=abs(round(rand(1, 7)-0.5+p));
		r = mod((v+e),2);
		
		% error detection
		err_flag = round(abs(sum(r-v)/8));
		
		err = err + err_flag;
		
		L = L-1;
	end

	Perro = err/(k*L_param);

end