function Perro = k7(p_param,L_param)

	k = 7;
	L = L_param;
	p = p_param;
	err = 0;

	while L > 0
	
		% fonte discreta
		u = abs(round(rand(1, 7)));
		
		% codificador de fonte
		v = u;
		
		% BSC channel
		e=abs(round(rand(1, 7)-0.5+p));
		r = mod((v+e),2);
		
		% error detection	
		err_flag = sum(mod((r-u),2));
		err = err + err_flag;
		
		L = L-1;
	end

	Perro = err/(k*L_param);

end