* RATS program to calculate and graph cyclical components
calendar 1947 1 4
compute capt = 2016:2
open data employment.csv
data(org=obs) 1947:1 capt datex nfp nfp_nsa

smpl 1947:1 capt
set recessdum 1947:1 capt = 0
set recessdum 1948:4 1949:4 = 1
set recessdum 1953:2 1954:2 = 1
set recessdum 1957:3 1958:2 = 1
set recessdum 1960:2 1961:1 = 1
set recessdum 1969:4 1970:4 = 1
set recessdum 1973:4 1975:1 = 1
set recessdum 1980:1 1980:3 = 1
set recessdum 1981:3 1982:4 = 1
set recessdum 1990:3 1991:1 = 1
set recessdum 2001:1 2001:4 = 1
set recessdum 2007:4 2009:2 = 1
set nfp_log = 100*log(nfp(t))
set nsa_log = 100*log(nfp_nsa(t))
ieval start_val = 1947:1

source hdif.src
source regfilt.src

open styles darker.txt
grparm(import=styles)

spgraph(vfields=2,hfields=2)
graph(header='Employment (seasonally adjusted)',dates,shading=recessdum) 1
# nfp_log
   @hdif(hval = 8) nfp_log baseline start_val capt
   @regfilt(hval=8,pval=4) nfp_log regression start_val capt
   graph(dates,shading=recessdum,key=upright,header='Cyclical component (SA)') 2
   # baseline / 4
   # regression / 1
graph(header='Employment (not seasonally adjusted)',dates,shading=recessdum) 1
# nsa_log
   @hdif(hval = 8) nsa_log baseline start_val capt
   @regfilt(hval=8,pval=4) nsa_log regression start_val capt
   graph(dates,shading=recessdum,key=upright,header='Cyclical component (NSA)') 2
   # baseline / 4
   # regression / 1
spgraph(done)

spgraph(vfields=2)
graph(header='Employment (seasonally adjusted)',dates,shading=recessdum) 1
# nfp_log
   @hdif(hval = 8) nfp_log baseline start_val capt
   @regfilt(hval=8,pval=4) nfp_log regression start_val capt
graph(dates,shading=recessdum,key=upright,header='Cyclical component (SA)') 2
   # baseline / 4
   # regression / 1
spgraph(done)

spgraph(vfields=2)
graph(header='Employment (not seasonally adjusted)',dates,shading=recessdum) 1
# nsa_log
   @hdif(hval = 8) nsa_log baseline start_val capt
   @regfilt(hval=8,pval=4) nsa_log regression start_val capt
graph(dates,shading=recessdum,key=upright,header='Cyclical component (NSA)') 2
   # baseline / 4
   # regression / 1
spgraph(done)













