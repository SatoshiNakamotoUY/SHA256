Typing: SHA256 "String" after loading SHA256.hs will give the hash value of SHA256 of the "String"

auxiliares.hs has auxiliary functions like functions which convert decimals to binary or hexadecimal, functions that divide a list into smaller
lists, etc. These functions are necesary but are not part of the SHA256 algorithm itself.

hahes.hs has the hashes and constants used by SHA256 H and K.

olementales.hs has elementary functions as NOT AND XOR, ROTR and SHIFTR

sigmas.hs contains sigma0, sigma1, Sigma0, Sigma1, Maj and CH functions.

SHA256 contains the main SHA256 algorithm.