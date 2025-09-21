x = 0:0.5:5;
y1 = sin(x);
y2 = cos(x);
err1 = 0.1 * rand(1, length(x));
err2 = 0.1 * rand(1, length(x));

% First plot with error bars: sin(x)
e1 = errorbar(x, y1, err1, '-or', ...
    'LineWidth', 1.5, 'MarkerSize', 8, 'MarkerFaceColor', 'r'); 
hold on;

% Second plot with error bars: cos(x)
e2 = errorbar(x, y2, err2, '-sb', ...
    'LineWidth', 1.5, 'MarkerSize', 8, 'MarkerFaceColor', 'b'); 
hold off;

% Labels and legend
xlabel('x');
ylabel('Value');
title('Sine and Cosine with Error Bars');
grid on;

legend([e1, e2], {'sin(x)', 'cos(x)'}, 'Location', 'best');
