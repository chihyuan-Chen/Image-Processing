function [ result ]=InterpolationBilinear(inputimage) 
%% 雙線性內插法
factor2 = 8; %放大8倍
inputimage = double(inputimage);
[row,column] = size(inputimage);
newr=round(factor2.*row);
newc=round(factor2.*column);
sampled_inputimage=zeros(newr,newc);
for i=1:newr
    for j=1:newc
        ii=i./factor2;
        jj=j./factor2;        
        i1=round(ii);
        j1=round(jj);
        if i1==0 
            i1=1;
        end
        if j1==0 
            j1=1;
        end
        if i1>row-1
            i1=row-1;
        end
        if j1>column-1
            j1=column-1;
        end
        if((ii/i1==1.0)&&(jj/j1==1.0))
            sampled_inputimage(i,j) = inputimage(ii,jj);
        else
            x11=inputimage(i1,j1); 
            x12=inputimage(i1,j1+1);
            x21=inputimage(i1+1,j1); 
            x22=inputimage(i1+1,j1+1);
            sampled_inputimage(i,j)= (j1+1-jj) * ((ii-i1)*x21 + (i1+1-ii)*x11) + (jj-j1) * ((ii-i1)*x22 +(i1+1-ii) * x12);
        end
    end
end
result = uint8(sampled_inputimage);
