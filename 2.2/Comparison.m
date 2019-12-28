clear all
n=256;
N=1:n;
a=ones(n,1);
b=cos(2*N*pi/16)';
X_1=N.^2;
X_2=3/2.*N.*log2(N)+N;
figure
hold on
plot(X_1)
plot(X_2)
title('Comparison')
legend('Linear Convolution','FFT')
xlabel('Length')
ylabel('times')
tic
    c=conv(a,b);    
toc

tic
    f_a=fft(a);
    f_b=fft(b);
    f_c=f_a.*f_b;
    cc=ifft(f_c);
toc
