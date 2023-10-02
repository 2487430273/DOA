clear all;
clc;
%% 初始化数值
c = 3120.77;              % 标准值
t1 = 0.22 * 0.0001;       % 传感器1的时间延迟 
t2 = 0.58 * 0.0001;       % 传感器2的时间延迟

x1 = 0;     y1 = 0.5;           % 传感器1
x2 = 0;     y2 = 0;             % 传感器2
x3 = 0.5;   y3 = 0;             % 传感器3
  

s1 = c * t1;    % 时延距离 s1 = r21
s2 = c * t2;    % 试验距离 s2 = r31


%% 求解未知点
k1 = x1^2 + y1^2;   % 中间值
k2 = x2^2 + y2^2;
k3 = x3^2 + y3^2;

p1_molecule = (y2 - y1)*s2^2 - (y3 - y1)*s1^2 + (y3 - y1)*(k2 - k1) - (y2 - y1)*(k3 - k1);
p1_denominator = (x2 - x1)*(y3 - y1) - (x3 - x1)*(y2 - y1);
p1 = p1_molecule / (p1_denominator*2);
q1 = ((y2 - y1)*s2 - (y3 - y1)*s1)/((x2 - x1)*(y3 - y1)-(x3 - x1)*(y2 - y1));

p2_molecule = (x2 - x1)*s2^2 - (x3 - x1)*s1^2 + (x3 - x1)*(k2 - k1) - (x2 - x1)*(k3 - k1);
p2_denominator = (x3 - x1)*(y2 - y1) - (x2 - x1)*(y3 - y1);
p2 = p2_molecule / (p2_denominator * 2);
q2 = ((x2 - x1)*s2 - (x3 - x1)*s1)/((x3 - x1)*(y2 - y1)-(x2 - x1)*(y3 - y1));
%% 求取方程
a = q1^2 + q2^2 -1;
b = -2*((x1 - p1)*q1 + (y1 - p2)*q2);
c = (x1 - p1)^2 + (y1 - p2)^2;

r1 = (-b + sqrt(b^2 - 4*a*c))/(2*a);
r2 = (-b - sqrt(b^2 - 4*a*c))/(2*a);

if r1 > 0
    x = p1 + q1*r1;
    y = p2 + q2*r1;
else
    x = p1 + q1*r2;
    y = p2 + q2*r2;
end

disp('未知点坐标: ')
disp(x), disp(y)
