plot(Standard_deviation_abso_error,'r')
%legend('standard deviation of estimated co-ordinates')
hold on
plot(Standard_deviation_abso_error_NOISY,'b')
%egend('standard deviation of Noisy co-ordinates')
legend({'standard deviation of estimated co-ord of trageted trajectory','standard deviation of Noisy co-ord of trageted trajectory'}, 'Location', 'northwest')
hold off
