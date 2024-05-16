function [out_imge, R, C, R_img,C_img] = encode_jpeg(original_img, qtable)

Table = QuantizationTable(qtable); % Using low quantization Table
out_imge = [];

% Pad the image if required 

[R_img,C_img] = size(original_img); % to keep the size of the original image

padded_img = pad(original_img);   % check inside the function if the size 
                                  %of the image is divisable by 8, otherwise pad 
[R,C] = size(padded_img);  

% Divide the image into blocks of 8x8 pixels:

for r = 1 : 7 : R-7
    for c = 1 : 7 : C-7
        block1 = padded_img(r:r+7,c:c+7);
        DCT_out = DCT(block1);    %2.Perform DCT on each block
        quantize_out = round(DCT_out./Table);   %3.Perform the quantization step per 8x8 block
        one_D = serpentine(quantize_out);   %4.Transform each block from 2-D into 1-D vector
        out_code = run_length(one_D);   %5.Use run-length encoding to compress the stream of zeros
        out_imge = [out_imge out_code];
    end
end

%6.Use Huffman function to encode the final stream:
%[encoded_file,dict] = Huffman_encoder(out_imge);
end