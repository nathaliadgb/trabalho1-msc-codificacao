% Trabalho 1 
% Nathalia Della Giustina Ballmann

close all;
clear all;
clc;

L = 1000;
p_vector = [0.05 0.1 0.2 0.3];

data_plot = zeros(6,length(p_vector));

for i = 1:length(p_vector)
	p = p_vector(i);
	data_plot(1,i) = 1 - ( (1-p)^7 + 7*p*(1-p)^6 + nchoosek(7,2)*p^2*(1-p)^5 + nchoosek(7,3)*p^3*(1-p)^4);
	data_plot(2,i) = k1(p,L);
	data_plot(3,i) = 1 - ( (1-p)^7 + 7*p*(1-p)^6 );
	data_plot(4,i) = k4(p,L);
	data_plot(5,i) = p;
	data_plot(6,i) = k7(p,L);
end

data_plot=100*data_plot;

figure(1);
	plot(p_vector,data_plot(1,:),p_vector,data_plot(2,:));
	h = legend ("Theoretical", "Simulated");
	legend (h);
	set (h, "fontsize", 12);
	title('R=1/7');
	xlabel('p')
	ylabel('Error rate (%)')
	grid on;

figure(2);
	plot(p_vector,data_plot(3,:),p_vector,data_plot(4,:));
	h = legend ("Theoretical", "Simulated");
	legend (h);
	set (h, "fontsize", 12);
	title('R=4/7');
	xlabel('p')
	ylabel('Error rate (%)')
	grid on;

figure(3);
	plot(p_vector,data_plot(5,:),p_vector,data_plot(6,:));
	h = legend ("Theoretical", "Simulated");
	legend (h);
	set (h, "fontsize", 12);
	title('R=7/7');
	xlabel('p')
	ylabel('Error rate (%)')
	grid on;