% x and y csv read files are real co-ordinates
% a and b csv files are noisy co-ordinates

x_file=csvread('x(2).csv');
y_file=csvread('y(2).csv');
a_file=csvread('a(1).csv');
b_file=csvread('b(1).csv');

%plotting  the real co-ordinates and noisy co-ordinates of target trajectories.
plot(x_file, y_file, 'xb');
hold;
plot(a_file, b_file, '+r');

%mean value and standard deviation values.
nx = a_file-x_file;
ny = b_file-y_file;
mean(nx)
mean(ny)
std(nx)
std(ny)

% plotting the histogram for nx and ny
histogram(nx,6)
histogram(ny,6)
plot(x_file, y_file, 'xb');
hold;
plot(a_file, b_file, '+r');
title('noise graph of target trajectories')

%kalman tracking for assess the quality of tracking
z=[a_file;b_file]
[px, py] = kalmanTracking(z)

nnx = px-x_file;
nny = py-y_file;
mean(nx)
mean(ny)
plot(x_file, y_file, 'xb');
hold on
plot(a_file, b_file, '+r');
hold off

plot(x_file,y_file, 'xb', px, py, '+r', a_file,b_file,'oy');
legend({'x,y = real co-ord of target trajectory(x,y)','px,py = predicted co-ords(x,y) of target trajectory','a,b = noisy co-ord(a,b) of target trajectory'}, 'Location', 'northwest')


% Calculating the mean value and standard deviation value of absolute error and Root mean squared error for estimated value

Standard_deviation_abso_error = sqrt( ((x_file-px).^2) + ((y_file-py).^2) )
RootMeanStandard_error = rms(Standard_deviation_abso_error)

% Calculating the mean value and standard deviation value of absolute error and Root mean squared error for Noisy Co-ord value

Standard_deviation_abso_error_NOISY = sqrt( ((x_file-a_file).^2) + ((y_file-b_file).^2) )
RootMeanStandard_error_NOISY = rms(Standard_deviation_abso_error_NOISY)

%%%
