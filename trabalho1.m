% Trabalho 1 
% Nathalia Della Giustina Ballmann

close all;
clear all;
clc;

L = 10000;
% p_vector = [0.05 0.1 0.2 0.3];
p_vector = 0.0:0.05:0.5;

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

% multiplicando por 100 para ter o valor em %
data_plot=100*data_plot;

figure(1);
	h_plot = plot(p_vector,data_plot(1,:),p_vector,data_plot(2,:),'--');
	h_legend = legend ("Simulated", "Theoretical");
	legend (h_legend,'Location','northwest');
	set (h_legend, "fontsize", 12);
	title(['R=1/7, L=' num2str(L)]);
	xlabel('p')
	ylabel('Error rate (%)')
	set(h_plot,'LineWidth',2)
	grid on;
	% autosaving
	saveas(gcf,'R1-7.png')

figure(2);
	h_plot = plot(p_vector,data_plot(3,:),p_vector,data_plot(4,:),'--');
	h_legend = legend ("Simulated", "Theoretical");
	legend (h_legend,'Location','northwest');
	set (h_legend, "fontsize", 12);
	title(['R=4/7, L=' num2str(L)]);
	xlabel('p')
	ylabel('Error rate (%)')
	set(h_plot,'LineWidth',2)
	grid on;
	% autosaving
	saveas(gcf,'R4-7.png')

figure(3);
	h_plot = plot(p_vector,data_plot(5,:),p_vector,data_plot(6,:),'--');
	h_legend = legend ("Simulated", "Theoretical");
	legend (h_legend,'Location','northwest');
	set (h_legend, "fontsize", 12);
	title(['R=7/7, L=' num2str(L)]);
	xlabel('p')
	ylabel('Error rate (%)')
	set(h_plot,'LineWidth',2)
	grid on;
	% autosaving
	saveas(gcf,'R7-7.png')
	
figure(4);
	h_plot = plot(p_vector,data_plot(1,:),p_vector,data_plot(2,:),'--', p_vector,data_plot(3,:),p_vector,data_plot(4,:),'--',p_vector,data_plot(5,:),p_vector,data_plot(6,:),'--');
	h_legend = legend ("Simulated - R=1/7", "Theoretical- R=1/7","Simulated - R=4/7", "Theoretical- R=4/7","Simulated - R=7/7", "Theoretical- R=7/7");
	legend (h_legend,'Location','northwest');
	set (h_legend, "fontsize", 12);
	title(['Comparison between, R=1/7, R=4/7 and R=7/7 - L=' num2str(L)]);
	xlabel('p')
	ylabel('Error rate (%)')
	set(h_plot,'LineWidth',2)
	grid on;
	% autosaving
	saveas(gcf,'comparison-Rs.png')