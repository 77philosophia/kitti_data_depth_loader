clc;
clear;
rgb_fin=fopen('rgb_img_train_path_matlab.csv','r');
depth_fin=fopen('depth_img_train_path_matlab.csv','r');
result_fin=fopen('dense_img_train_path_matlab.csv','r');
while ~feof(rgb_fin)
    rgb_path=fgetl(rgb_fin);
    depth_path=fgetl(depth_fin);
    result_path=fgetl(result_fin);
    rgb=imread(rgb_path);
    depth=imread(depth_path);
    rgb=im2double(rgb);
    depth_out=fill_depth_colorization(rgb, double(depth/256), 1);
    %depth_out=(depth_out - min(min(depth_out)))/(max(max(depth_out))-min(min(depth_out)));
    depth_out=uint16(depth_out*255);
    imwrite(depth_out,result_path);
    disp(result_path);
end
fclose(rgb_fin);
fclose(depth_fin);
fclose(result_fin);

%str=fgetl(fin);
%fclose(fin);
%S=regexp(str,'\n','split');