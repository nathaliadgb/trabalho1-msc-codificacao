L = 1000;

for p = [0.05 0.1 0.2 0.3];
	disp('----')
	disp(num2str(p))
	disp('----')
	Perro_k1 = 1 - ( (1-p)^7 + 7*p*(1-p)^6 + nchoosek(7,2)*p^2*(1-p)^5 + nchoosek(7,3)*p^3*(1-p)^4 )
	k1(p,L)
	disp('----')
	Perro_k4 = 1 - ( (1-p)^7 + 7*p*(1-p)^6 )
	k4(p,L)
	disp('----')
	Perro_k7 = p
	k7(p,L)
end

x = -10:0.1:10;
plot (x, sin (x));