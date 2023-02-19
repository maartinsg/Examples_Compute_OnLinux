cd file-*
# Maintainers-editors have not supported package compile at "dietlibc" 
# so maybe editing to resolve, comprehensible. Is "CC" set also ?
sed -e 's@mint@dietlibc* | mint@g' -i config.sub
sed -e 's@-dietlibc* | -newlib@-newlib@g' -i config.sub

./configure --prefix= \
   --enable-static --disable-shared \
   --build=x86_64-pc-linux --host=x86_64-pc-linux \
   build_alias=x86_64-pc-linux-dietlibc host_alias=x86_64-pc-linux-dietlibc \
   host=x86_64-pc-linux-dietlibc build=x86_64-pc-linux-dietlibc

sed -e 's@-C -m magic@-C -m magic/magic@g' -i magic/Makefile
make

make DESTDIR=$DESTDIR install
