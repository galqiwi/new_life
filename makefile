encrypt:
	@if [[ -f './data.gpg' ]]; then\
		>&2 echo -e "error: encrypted file is already in this folder";\
		exit 1;\
	fi
	tar -cvf data.tar data
	gpg --cipher-algo aes-256 -c data.tar
	mv data.tar.gpg data.gpg
	rm data.tar
	rm -rf data

decrypt:
	@if [[ -d './data' ]]; then\
		>&2 echo -e "error: decrypted directory is already in this folder";\
		exit 1;\
	fi
	gpg -d data.gpg > data.tar
	tar xvf data.tar
	rm data.tar