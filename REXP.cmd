cd library
ar r lwpc.a *.o
mv lwpc.a ..
cd ..
cp save/xmtr.lis data/
rm *.mds
rm *.lwf
./LWPC rexp
