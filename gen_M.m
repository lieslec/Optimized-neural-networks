function A = gen_M(M,fil,col)
A = [M(fil-1,col-1) M(fil-1,col) M(fil-1,col+1); M(fil,col-1) M(fil,col) M(fil,col+1); M(fil+1,col-1) M(fil+1,col) M(fil+1,col+1)];
end