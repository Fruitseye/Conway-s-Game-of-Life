%For creating a 100X100 array with elements assigned 1 or 0 randomly 
n=100;
a=abs(randi(2,n)-randi(2,n));

%Ceating another array to store the value of no of live neighbours around an element
c=zeros(n,n);

%Nested for loop:
for b=1:500  %To produce 500 different image
%To operate element by element:
  for i=1:n
    for j=1:n
      %lines 16-23 is to find c at corner elements
      %lines 24-31 is to find c at the edge elements(other than corners)
      %lines 32-33 is to find c at interior elemnts
      if ((i==1)&&(j==1))
        c(i,j)=a(i+1,j)+a(i,j+1)+a(i+1,j+1);
      elseif ((i==n)&&(j==1))
        c(i,j)=a(i-1,j)+a(i,j+1)+a(i-1,j+1);
      elseif ((i==1)&&(j==n))
        c(i,j)=a(i+1,j)+a(i,j-1)+a(i+1,j-1);
      elseif ((i==n)&&(j==n))
        c(i,j)=a(i-1,j)+a(i,j-1)+a(i-1,j-1);
      elseif ((i==1)&&(j!=1)&&(j!=n))
        c(i,j)=a(i,j-1)+a(i,j+1)+a(i+1,j)+a(i+1,j+1)+a(i+1,j-1);
      elseif ((i==n)&&(j!=1)&&(j!=n))
        c(i,j)=a(i,j-1)+a(i,j+1)+a(i-1,j)+a(i-1,j-1)+a(i-1,j+1);
      elseif ((j==1)&&(i!=1)&&(i!=n))
        c(i,j)=a(i,j+1)+a(i-1,j)+a(i+1,j)+a(i+1,j+1)+a(i-1,j+1);
      elseif ((j==n)&&(i!=1)&&(i!=n))
        c(i,j)=a(i,j-1)+a(i-1,j)+a(i+1,j)+a(i-1,j-1)+a(i+1,j-1);
      else
        c(i,j)=a(i,j-1)+a(i,j+1)+a(i-1,j)+a(i+1,j)+a(i-1,j-1)+a(i+1,j+1)+a(i+1,j-1)+a(i-1,j+1);
      endif
    endfor
  endfor
%To modify the a matrix accrding to the convays game of life rules:
  for i=1:n
    for j=1:n
      if((a(i,j)==1)&&(c(i,j)<2))
        c(i,j)=0;
      elseif((a(i,j)==1)&&((c(i,j)==2)||(c(i,j)==3)))
        c(i,j)=1;
      elseif((a(i,j)==1)&&(c(i,j)>3))
        c(i,j)=0;
      elseif((a(i,j)==0)&&(c(i,j)==3))
        c(i,j)=1;
      else
        c(i,j)=0;
      endif
    endfor
  endfor
%Assigns matrix c to a
a=c;
%Produces images after each iteration
imshow(c);
str2 = sprintf("print -dpng img-%d.png", b);
eval(str2);
endfor