import requests
import progressbar
import zipfile
import io

if __name__ == '__main__':

	#print(platform.processor() == True )

	#reg = _winreg.ConnectRegistry(None, HKEY_LOCAL_MACHINE)

	#key = _winreg.OpenKey(reg, "SOFTWARE\Wow6432Node\Microsoft\VisualStudio\11.0\InstallDir")
	#print(key);

	#files = ['http://docs.python-requests.org/en/latest/index.html', 'https://github.com/powerumc/VS2012_UPDATE2_KOR_PATCH/blob/master/BasicMvcWebApplicationProjectTemplatev4.1.csaspx.zip']
	#CHUNK_SIZE = 1024 * 1024 # 1MB

	
	ISO = "https://github.com/powerumc/VS2012_UPDATE2_KOR_PATCH/archive/master.zip"
	CHUNK_SIZE = 1024 # 1MB

	r = requests.get(ISO)
	total_size = int(r.headers['content-length'])
	pbar = progressbar.ProgressBar(maxval=total_size).start()

	f = open('a.zip', 'wb')

	file_contents = ""
	for chunk in r.iter_content(chunk_size=CHUNK_SIZE):
		file_contents += chunk
		pbar.update(len(file_contents))
		f.write(chunk)

	f.close()


	pass;



