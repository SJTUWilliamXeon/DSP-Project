clear;
L=2;
M=3;

%%
%ԭʼ����
x=0:1000;
y=cos(2*pi*x/12);

%%
%������
%���������ڲ�
[r_y,c_y]=size(y);
Len=c_y*2;
y_C=zeros(1,Len);
y_L=zeros(1,Len);
[r,c]=size(y_L);
y_L(1:L:c)=y;
y_addtional=zeros(1,Len-1);
y_tem=[y_addtional,y_L];
%����y_tem��ֵ�ڲ壬ͬʱ�����˺������᳤��һ����ȫ�㸺�����Է��������޳����
y1=zeros(1,2*Len-1);
x1=-Len+1:Len-1;
y1_u=L*sin(pi*x1/L);
y1_d=pi*x1;
y1(Len)=1;
y1(1:Len-1)=y1_u(1:Len-1)./y1_d(1:Len-1);
y1(Len+1:2*Len-1)=y1_u(Len+1:2*Len-1)./y1_d(Len+1:2*Len-1);
%����y1Ϊ����sinc�������������᳤��һ�£��ܳ��Ⱥ�y_tem���
for i=1:Len
    y_C(i)=sum(y_tem.*y1,2);
    y1=[0,y1(1:2*Len-2)];
end %y_tem��y1�����޳����
x_l=0:2000;

%%
%�²���
y_M=zeros(1,334);
for i=1:334
   y_M(i)=y(3*i-2); 
end
x_m=0:333;

%%
%���������󽵲���
y_LM=zeros(1,667);
for i=1:667
   y_LM(i)=y_C(3*i-2);
end
x_lm=0:666;
%%
%��ͼ
figure;
subplot(4,1,1);
stem(x,y);
axis([0 1000 -1.3 1.3]);
xlabel('��������');
ylabel('������ֵ');
title('ԭʼ����');
subplot(4,1,2);
stem(x_l,y_C(1:2001));
axis([0 2000 -1.3 1.3]);
xlabel('��������');
ylabel('������ֵ');
title('L=2');
subplot(4,1,3);
stem(x_m,y_M);
axis([0 333 -1.3 1.3]);
xlabel('��������');
ylabel('������ֵ');
title('M=3');
subplot(4,1,4);
stem(x_lm,y_LM);
axis([0 666 -1.3 1.3]);
xlabel('��������');
ylabel('������ֵ');
title('L/M=2/3');