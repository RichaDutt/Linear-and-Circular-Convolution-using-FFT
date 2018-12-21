
for count = 1 :5
x= round(abs(randn(1,1000))+1);
y= round(abs(randn(1,1000))+1);
size(x)
size(y)
m=length(x);
n=length(y);
X=[x,zeros(1,n)]; 
Y=[y,zeros(1,m)]; 
disp("time using conv")
tic
for i=1:m+n-1
H(i)=0;
for j=1:m
if((i-j+1)>0)
H(i)=H(i)+X(j)*Y(i-j+1);
else
end
end
end
toc
len=m+n-1;
disp("time using fft")
tic
con_xy1 = ifft(fft(x,len).*fft(y,len));
toc

xpad = [x zeros(1,len-m)];
ypad = [y zeros(1,len-n)];
ccirc = ifft(fft(xpad).*fft(ypad));

linear_conv = conv(x,y);

error= linear_conv - ccirc;


avg_H= sum(linear_conv)/length(linear_conv);
avg_ccirc= sum(ccirc)/length(ccirc);
disp("Average error")
disp(avg_H-avg_ccirc)

end