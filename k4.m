function Perro = k4(p_param,L_param)

	k = 4;
	L = L_param;
	p = p_param;
	err = 0;

	G = [1 1 0 1 0 0 0;0 1 1 0 1 0 0;1 1 1 0 0 1 0;1 0 1 0 0 0 1];

	H = [1 0 0 1 0 1 1;0 1 0 1 1 1 0;0 0 1 0 1 1 1];

	u_hamm = zeros(16,4);
		u_hamm(1,:) = [0 0 0 0];
		u_hamm(2,:) = [1 0 0 0];
		u_hamm(3,:) = [0 1 0 0];
		u_hamm(4,:) = [1 1 0 0];
		u_hamm(5,:) = [0 0 1 0];
		u_hamm(6,:) = [1 0 1 0];
		u_hamm(7,:) = [0 1 1 0];
		u_hamm(8,:) = [1 1 1 0];
		u_hamm(9,:) = [0 0 0 1];
		u_hamm(10,:) = [1 0 0 1];
		u_hamm(11,:) = [0 1 0 1];
		u_hamm(12,:) = [1 1 0 1];
		u_hamm(13,:) = [0 0 1 1];
		u_hamm(14,:) = [1 0 1 1];
		u_hamm(15,:) = [0 1 1 1];
		u_hamm(16,:) = [1 1 1 1];

	v_hamm = zeros(16,7);
		v_hamm(1,:)=[0 0 0 0 0 0 0];
		v_hamm(2,:)=[1 1 0 1 0 0 0];
		v_hamm(3,:)=[0 1 1 0 1 0 0];
		v_hamm(4,:)=[1 0 1 1 1 0 0];
		v_hamm(5,:)=[1 1 1 0 0 1 0];
		v_hamm(6,:)=[0 0 1 1 0 1 0];
		v_hamm(7,:)=[1 0 0 0 1 1 0];
		v_hamm(8,:)=[0 1 0 1 1 1 0];
		v_hamm(9,:)=[1 0 1 0 0 0 1];
		v_hamm(10,:)=[0 1 1 1 0 0 1];
		v_hamm(11,:)=[1 1 0 0 1 0 1];
		v_hamm(12,:)=[0 0 0 1 1 0 1];
		v_hamm(13,:)=[0 1 0 0 0 1 1];
		v_hamm(14,:)=[1 0 0 1 0 1 1];
		v_hamm(15,:)=[0 0 1 0 1 1 1];
		v_hamm(16,:)=[1 1 1 1 1 1 1];

	while L > 0

		% fonte discreta
		u = abs(round(rand(1, 4)));
		
		% codificador de fonte
		v = mod((u * G),2);
		
		% BSC channel
		e=abs(round(rand(1, 7)-0.5+p));
		r = mod((v+e),2);
		
		% error detection	
		% s = mod((r * H'),2)
		dist_hamm = zeros(16,1);
		for i = 1:16
			dist_hamm(i) = sum(mod((r-v_hamm(i,:)),2));
		end
		[M,I]=min(dist_hamm);
		% expected value of u
		exp_u = u_hamm(I,:);
		if sum(exp_u-u)>0
			err = err + 4;
		end
		
		L = L-1;
	end

	Perro = err/(k*L_param);

end