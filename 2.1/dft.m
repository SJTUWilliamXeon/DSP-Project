clear all
T=1/1024;
n=0:63;
N=64

x_c=1+cos(160*pi*n*T)+cos(320*pi*n*T);
%Sampling
w = [-400:1:400]*pi/400;

%|V(e^jw)|
X=sum((x_c(n+1).*exp(-j*w'*n))');

%|V(K)|
V=fft(x_c);
a=abs(V);
V=fftshift(V);

figure
bar(n-32,abs(V))
figure
plot(w,abs(X))

%Hanning
hanning(n+1)=0.5*(1-cos(2*pi*n/(N-1)))

%¼Ó´°
x_c=x_c.*hanning;
X=sum((x_c(n+1).*exp(-j*w'*n))');
V=fft(x_c);
a=abs(V);
V=fftshift(V);


figure
bar(n-32,abs(V))
figure
plot(w,abs(X))
figure
plot(hanning)