function [ result ] = bilinear_zoom(inputimage, fac)

%im0=imread('TEP.jpg');
%im=cast(im0,'int16'); 
%imshow(cast(im,'uint8'));
[h,v,d]=size(inputimage);
inputimage = double(inputimage);
for i=1:h
    for j=1:v
      inputimage(1+(i-1)*fac,1+(j-1)*fac,:)=inputimage(i,j,:); 
    end
      %imshow(cast(inputimage,'uint8')); 
end

%bilinear interpolation
for i=1:1+(h-2)*fac     %row number
    for j=1:1+(v-2)*fac %column number
    
       if ((rem(i-1,fac)==0) && (rem(j-1,fac)==0)) 
       else  
           h00=inputimage( ceil(i/fac)*fac-fac+1,ceil(j/fac)*fac-fac+1,:); 
           h10=inputimage( ceil(i/fac)*fac-fac+1+fac,ceil(j/fac)*fac-fac+1,:);
           h01=inputimage( ceil(i/fac)*fac-fac+1,ceil(j/fac)*fac-fac+1+fac,:);
           h11=inputimage( ceil(i/fac)*fac-fac+1+fac,ceil(j/fac)*fac-fac+1+fac,:);
           
           x=rem(i-1,fac); %coordinates of calculating pixel.
           y=rem(j-1,fac);  
           
           dx=x/fac; %localizeing the  pixel being calculated to the nearest four know pixels.
           dy=y/fac;
          
           b1=h00;    %constants of bilinear interpolation.
           b2=h10-h00;
           b3=h01-h00;
           b4=h00-h10-h01+h11;           
           inputimage(i,j,:)=b1+b2*dx+b3*dy+b4*dx*dy; %equation of bilinear interpolation.
      end
   end
  %imshow(cast(inputimage,'uint8'));
end
result = uint8(inputimage);
%result = cast(inputimage,'uint8');
end