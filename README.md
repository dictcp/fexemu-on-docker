FEX-Emu for Docker on ARM

```bash
# build FEXInterpreter
docker build -t fex .
docker run --rm -it -v $PWD:/tmp/target fex cp /FEX-2207/Build/Bin/FEXInterpreter /tmp/target/
sudo cp ./FEXInterpreter /usr/bin/

# set up binfmt
sudo apt install binfmt-support
sudo /usr/sbin/update-binfmts --install FEX-x86_64 /usr/bin/FEXInterpreter --magic "\x7fELF\x02\x01\x01\x00\x00\x00\x00\x00\x00\x00\x00\x00\x02\x00\x3e\x00" --mask "\xff\xff\xff\xff\xff\xfe\xfe\x00\x00\x00\x00\xff\xff\xff\xff\xff\xfe\xff\xff\xff" --credentials yes --preserve yes --fix-binary yes

# it works
docker run --rm -it --platform linux/amd64 dictcp/utils /bin/bash
```
