clc;
clear;

% Vectors

X = 1:1:9;
Y1 = [2,4,4,1,0,3,0,1,0];
Y2 = Y1 + 1;
Y3 = Y2 + 1;

% Average and standard deviation computed from excel

Yavg = [3,5,5,2,1,4,1,2,1];
Ystd = [1,1,1,1,1,1,1,1,1];

% Generation of the figure

figure;
sgtitle('Rajdeep De','FontName', 'Times New Roman','FontSize', 14, 'FontWeight', 'bold','Color','k');

% Subplot 1
subplot(1,3,1)
plot(X,Y1,'-b','LineWidth',1);
hold on;
plot(X,Y2,'--r','LineWidth',1);
plot(X,Y3,'s','MarkerFaceColor','m','MarkerSize',6,'LineStyle','none');
[max_val,idx] = max(Y3);
x_max = X(idx);
plot(x_max,max_val,'o','MarkerSize',12);
text(x_max+0.1,max_val+0.2,'Maxima', 'FontWeight', 'bold','Color','k');
text(0.5,max_val+0.5,'Roll No:244103010','FontWeight', 'bold','Color','k');
xlabel('$\frac{\partial R}{\partial x}$', 'Interpreter', 'latex', 'FontSize', 16, 'FontWeight', 'bold','Color','k');
ylabel('Roll Number(R)', 'FontName', 'Times New Roman','FontSize', 14, 'FontWeight', 'bold','Color','k');
legend({'Y1','Y2','Y3'}, 'FontName', 'Times New Roman','FontSize', 14, 'FontWeight', 'bold', 'Location', 'northeast');
ylim([0 7]);
set(gca, 'LineWidth', 1.5, 'FontWeight', 'bold')
box on;
xticks(X);

% Subplot 2
x_target = X(3);
y_target = Yavg(3);
subplot(1,3,2)
e = errorbar(X,Yavg,Ystd,'Color','k','LineWidth',1,'CapSize',6,'Marker','s','MarkerFaceColor','r');
p = polyfit(X, Yavg, 2);
y_fit = polyval(p, X);
Rsq = 1 - sum((Yavg - y_fit).^2) / sum((Yavg - mean(Yavg)).^2);
eqn = sprintf('y = %.2fx^2 + %.2fx + %.2f\nR^2 = %.4f', p(1), p(2), p(3), Rsq);
text(x_target + 1.2, y_target - 0.5, eqn, 'FontName', 'Times New Roman','FontSize', 10, 'FontWeight', 'bold','Color','r');
text(x_target + 0.3, y_target - 0.5, '$\longleftarrow$','Interpreter', 'latex','FontWeight', 'bold', 'FontSize', 12,'Color','k');
xlabel('$\frac{\partial R}{\partial x}$', 'Interpreter', 'latex', 'FontSize', 16, 'FontWeight', 'bold','Color','k');
ylabel('Roll Number(R)', 'FontName', 'Times New Roman','FontSize', 14, 'FontWeight', 'bold','Color','k');
legend(e,'Yavg', 'FontName', 'Times New Roman','FontSize', 14, 'FontWeight', 'bold', 'Location', 'northeast');
ylim([0 7]);
set(gca, 'LineWidth', 1.5, 'FontWeight', 'bold')
box on;
xticks(X);

% Subplot 3
subplot(1,3,3)
bar(X,Yavg,'FaceColor','b');
hold on;
errorbar(X,Yavg,Ystd,'Color','k','LineWidth',1,'LineStyle','none');
hold off;
xlabel('$\frac{\partial R}{\partial x}$', 'Interpreter', 'latex', 'FontSize', 16, 'FontWeight', 'bold','Color','k');
ylabel('Roll Number(R)', 'FontName', 'Times New Roman','FontSize', 14, 'FontWeight', 'bold','Color','k');
legend('Average','Error', 'FontName', 'Times New Roman','FontSize', 14, 'FontWeight', 'bold', 'Location', 'northeast');
ylim([0 7]);
set(gca, 'LineWidth', 1.5, 'FontWeight', 'bold')
box on;
xticks(X);