function p = ratio_of_normalpdf(x,m1,s1,m2,s2)
% RATIO_OF_NORMALPDF - pdf for the ratio of N(mu1,sigma1)/N(mu2,sigma2)
%
% Calling:
% p = ratio_of_normalpdf(x,mu1,sigma1,mu2,sigma2)
%

p = 1/(sqrt(2*pi)*s1*s2)*...
    b(x,m1,s1,m2,s2).*c(x,m1,s1,m2,s2)./a(x,s1,s2).^3.*...
    (normcdf(b(x,m1,s1,m2,s2)./a(x,s1,s2),0,1)-normcdf(-b(x,m1,s1,m2,s2)./a(x,s1,s2),0,1)) + ...
    1./(a(x,s1,s2).^2*pi*s1*s2).*exp(-1/2*(m1^2/s1^2+m2^2/s2^2));
    %(2*erf(b(x,m1,s1,m2,s2)./a(x,s1,s2))-1) + ...

function A = a(x,s1,s2)
% A -
%

A = (x.^2/s1^2+1/s2^2).^(1/2);

function B = b(x,m1,s1,m2,s2)
% B -
%
B = x*m1/s1^2+m2/s2^2;

function C = c(x,m1,s1,m2,s2)
% C -
%

C = exp(1/2*b(x,m1,s1,m2,s2).^2./a(x,s1,s2).^2-1/2*(m1^2/s1^2+m2^2/s2^2));