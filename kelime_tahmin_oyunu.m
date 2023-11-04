A = {'m','a','t','l','a','b'};
B = {'p','r','o','g','r','a','m','l','a','m','a'};
C = {'d','e','g','i','þ','k','e','n'};
D = {'f','o','n','k','s','i','y','o','n'};
E = {'d','ö','n','g','ü'};
F = {'i','f','a','d','e'};
G = {'v','e','r','i'};
H = {'g','r','a','f','i','k'};
I = {'a','l','g','o','r','i','t','m','a'};
J = {'i','n','d','e','k','s'};

dizi_kelimeler = {A, B, C, D, E, F, G, H, I, J};

rastgele_kelime = randi([1, numel(dizi_kelimeler)]);
secilen_kelime = dizi_kelimeler{rastgele_kelime};

harf_sayisi = length(secilen_kelime);
% Alt çizgi dizisini oluþturun
alt_cizgi_dizi = repmat('_ ', 1, harf_sayisi);
alt_cizgi_dizi = alt_cizgi_dizi(1:end-1);
haklar = 6;
fprintf('Kelime tahmin oyunu baþlýyor.\nKelime tahmin için 6 hakkýnýz bulunmakta.\n');
while haklar > 0
    disp(['kelime: ' alt_cizgi_dizi]);
    tahmin = input('bir harf tahmin edin: ', 's');

    tahminDogru = false;
    
    for i = 1:harf_sayisi
        if secilen_kelime{i} == tahmin
            alt_cizgi_dizi(2*i-1) = tahmin;
            tahminDogru = true;
        end
    end

    if tahminDogru == true
        fprintf('Doðru tahmin! Kalan haklar: %d\n', haklar);
    else
        haklar = haklar - 1;
        fprintf('Yanlýþ tahmin. Tekrar dene. Kalan haklar: %d\n', haklar);
    end
    secilen_kelime_char = char([secilen_kelime{:}]);
    secilen_kelime_str = strjoin(secilen_kelime, ' ');

    if isequal(alt_cizgi_dizi, secilen_kelime_str) && haklar > 0
        fprintf('Tebrikler! Kelimeyi doðru tahmin ettiniz. Kelime: %s\n', strjoin(secilen_kelime, ''));
        break;
    end
end

if haklar == 0 && ~isequal(alt_cizgi_dizi, secilen_kelime_char)
     fprintf('Oyun bitti. Dogru kelime: %s\n', strjoin(secilen_kelime, ''));
end