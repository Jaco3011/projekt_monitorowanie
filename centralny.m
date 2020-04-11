clear all; close all;
[track,fs]=audioread('oryginalny.mp3');
if size(track,2)>1
    track=track(:,1);
end
msg='Lorem ipsum';
starting_buffer_coef=200;
offset=20; %!
frame_length=100; %!
starting_buffer=starting_buffer_coef*frame_length;
message_bits=de2bi(uint8(msg),8);
message_bits=message_bits(:);
result=[track(1:starting_buffer); encode(frame_length,track(starting_buffer:length(track)),double(message_bits),offset)];
audiowrite('przerobiony.wav',result,fs);
sound(result,fs);
[bits_decoded, ~]=decode(frame_length,result,offset);
bits_decoded=uint8(bits_decoded);
bits_decoded=vec2mat(bits_decoded,8);
msg_bis=bi2de(bits_decoded);
msg_bis=char(msg_bis);
strcat(msg_bis')