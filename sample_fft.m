% sample program for playing with FFT2

i = im2double(imread('./ldr.jpg'));
ifft1 = fftshift(fft2(rgb2gray(i)));
% visualize the fft
figure()
imshow(log(abs(ifft1))/max(max(log(abs(ifft1)))));
% contour plot for the fft
figure()
contour(log(abs(ifft1))/max(max(log(abs(ifft1)))));

%% mask out with zeros
[h, w, ~] = size(i);
ifft1_mask = zeros(size(ifft1));
% mask out the center region, leaving the rest all zeros
ifft1_mask(w/4:3*w/4,h/4:3*h/4) = ifft1(w/4:3*w/4,h/4:3*h/4);
image_mask = ifft2(ifftshift(ifft1_mask));
% visualize the zeroed fft2
figure()
imshow(log(abs(ifft1_mask))/max(max(log(abs(ifft1_mask)))));
% visualize the transformed back image
figure()
imshow(image_mask,[])
% visualize the difference
figure()
imshow(abs(image_mask-rgb2gray(i)),[])

%% shrink
