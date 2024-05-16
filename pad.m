function out = pad(I)
% I: input image
% out: output the padded image if needed

[R,C]=size(I);
%check if the size of the image is divisable by 8, otherwise pad 
if mod(R,8) ~= 0 && mod(C,8) == 0
    p = 8 - mod(R,8) ;
    I = [ I ; zeros(p,C)];

elseif mod(C,8) ~= 0 && mod(R,8) == 0

    p = 8 - mod(C,8) ;
    I = [ I , zeros(R,p)];

elseif mod(C,8) ~= 0 && mod(R,8) ~= 0
    
    p1 = 8 - mod(R,8) ;
    p2 = 8 - mod(C,8) ;
    I = [ I ; zeros(p1,C)];
    [R,C]=size(I);
    I = [ I , zeros(R,p2)];
end 
out = I;
end 