function CR = compression(subband_bits, BPS, Signal)

subband_length = Signal/32;
uncompressed = BPS * Signal;
Compressed = sum(subband_bits) * subband_length; 

CR = uncompressed / Compressed;


end