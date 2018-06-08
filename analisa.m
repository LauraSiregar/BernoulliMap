function [persen] = analisa(Img1,Img2)

[x,y,z] = size (Img1);
if (z==1);
else
    Img1 = rgb2gray(Img1);
end

[x,y,z] = size (Img2);
if (z==1);
else
    Img2 = rgb2gray(Img2);
end

deteksi_tepi_Img1 = edge(Img1,'Sobel');
deteksi_tepi_Img2 = edge(Img2,'Sobel');

cocok = 0;
nilai_putih = 0;
nilai_hitam = 0;
x=0;
y=0;
l=0;
m=0;

for a = 1:1:256
    for b = 1:1:256
        if(deteksi_tepi_Img1(a,b)==1)
            nilai_putih = nilai_putih+1;
        else
            nilai_hitam = nilai_hitam+1;
        end
    end
end

for i = 1:1:256
    for j = 1:1:256
        if(deteksi_tepi_Img1(i,j)==1)&&(deteksi_tepi_Img2(i,j)==1)
            cocok = cocok+1;
        else
            
        end
    end
end

total_data = nilai_putih;
if(cocok==0)
    persen=0;
else
    persen = (cocok/total_data)*100;
end